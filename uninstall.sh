#!/usr/bin/env bash
# Local SEO Skills uninstaller for macOS / Linux.
#
# Removes ~/.claude/skills/localseoskills. By default, any briefs/ directory
# (client data) is backed up to ~/.claude/lss-briefs-backup-<timestamp> before
# removal. Pass --no-backup to skip the backup step.
#
# Usage:
#   bash uninstall.sh              # prompts before deleting, backs up briefs
#   bash uninstall.sh --force      # no prompt
#   bash uninstall.sh --no-backup  # skip briefs backup

set -euo pipefail

INSTALL_DIR="${LSS_INSTALL_DIR:-${HOME:?HOME is not set}/.claude/skills/localseoskills}"
FORCE=0
BACKUP=1

for arg in "$@"; do
  case "$arg" in
    --force)     FORCE=1 ;;
    --no-backup) BACKUP=0 ;;
    *)
      printf 'Unknown option: %s\n' "$arg" >&2
      exit 2
      ;;
  esac
done

say() {
  printf '\033[1;32m>\033[0m %s\n' "$1"
}

fail() {
  printf '\033[1;31mx\033[0m %s\n' "$1" >&2
  exit 1
}

# Remove the per-skill links install.sh created (links into this install only).
remove_skill_links() {
  local skills_dir="${LSS_SKILLS_DIR:-${HOME}/.claude/skills}" link
  for link in "$skills_dir"/*; do
    if [ -L "$link" ] && [[ "$(readlink "$link")" == "$INSTALL_DIR/skills/"* ]]; then
      rm "$link"
    fi
  done
}

main() {
  # Refuse to operate on catastrophically short paths, system roots, or
  # anything that resolves to the user's home directory. Protects against
  # accidents like LSS_INSTALL_DIR=/ or LSS_INSTALL_DIR=$HOME followed by
  # --force, plus traversal attacks like LSS_INSTALL_DIR=$HOME/../../usr.
  local resolved stripped
  # Refuse outright if INSTALL_DIR contains any `..` segment. Path traversal
  # makes the final target ambiguous and bypasses the in-home fast-allow
  # when realpath can't canonicalize (non-existent targets). There is no
  # legitimate reason for an install dir path to include `..`.
  case "/$INSTALL_DIR/" in
    */../*) fail "Refusing to operate on path with .. traversal: $INSTALL_DIR" ;;
  esac
  # Refuse outright if INSTALL_DIR itself is a symlink. A symlink whose target
  # is a system path would pass the resolved-path check (we'd see the target),
  # but `rm -rf` on the symlink follows it and deletes the target's contents.
  if [ -L "$INSTALL_DIR" ]; then
    fail "Refusing to operate on a symlink: $INSTALL_DIR"
  fi
  # Prefer realpath/readlink -f when available so symlinks in the path are
  # resolved to their real targets before blocklist comparison. Falls back to
  # cd + pwd, which resolves symlinks on macOS/Linux but not `/./` segments;
  # tr -s '/' collapses repeated slashes so the comparison is reliable.
  if command -v realpath >/dev/null 2>&1; then
    resolved="$(realpath "$INSTALL_DIR" 2>/dev/null)" || resolved="$INSTALL_DIR"
  elif readlink -f "$INSTALL_DIR" >/dev/null 2>&1; then
    resolved="$(readlink -f "$INSTALL_DIR")"
  else
    resolved="$(cd "$(dirname "$INSTALL_DIR")" 2>/dev/null && pwd)/$(basename "$INSTALL_DIR")" || resolved="$INSTALL_DIR"
  fi
  resolved="$(printf '%s' "$resolved" | tr -s '/')"
  resolved="${resolved%/}"
  [ -z "$resolved" ] && resolved="/"

  # Normalize trailing slashes on the raw input so "/", "//", "/usr/" all
  # compare equal to their blocklist entries.
  stripped="${INSTALL_DIR%/}"
  [ -z "$stripped" ] && stripped="/"

  # Match case-insensitively so macOS (HFS+/APFS default is case-insensitive)
  # can't bypass with `$HOME/../../LIBRARY`. Uses bash's [[ ]] so the flag
  # actually applies (POSIX `[ = ]` ignores shopt). No-op on Linux where the
  # FS is case-sensitive anyway. shopt is bash-specific and already required
  # by `set -euo pipefail` on line 13.
  shopt -s nocasematch

  # Trusted home directory. A prior review found that the fast-allow check
  # below was gate-kept by `$HOME`, which is attacker-controllable: running
  # `HOME=/Library bash uninstall.sh` made the fast-allow think `/Library/...`
  # was a legitimate in-home path and skipped the blocklist entirely. Resolve
  # the real home from `id -un` via `dscl` (macOS) / `getent` (Linux) /
  # `/etc/passwd` (fallback). If we cannot resolve a trusted home, the
  # fast-allow is disabled and every path is subjected to the blocklist.
  local current_user trusted_home=""
  current_user="$(id -un 2>/dev/null || echo '')"
  if [ -n "$current_user" ]; then
    if command -v dscl >/dev/null 2>&1; then
      trusted_home="$(dscl . -read "/Users/$current_user" NFSHomeDirectory 2>/dev/null | /usr/bin/awk '/^NFSHomeDirectory:/ {print $2}')"
    fi
    if [ -z "$trusted_home" ] && command -v getent >/dev/null 2>&1; then
      trusted_home="$(getent passwd "$current_user" 2>/dev/null | cut -d: -f6)"
    fi
    if [ -z "$trusted_home" ] && [ -r /etc/passwd ]; then
      trusted_home="$(/usr/bin/awk -F: -v u="$current_user" '$1==u {print $6}' /etc/passwd)"
    fi
    # Last-resort fallback: if dscl/getent/passwd all failed (happens on
    # LDAP-only Linux or NIS boxes where the passwd db isn't in /etc/passwd),
    # accept $HOME IF AND ONLY IF the current user actually owns it. An
    # attacker-set HOME=/Library fails `-O` because /Library is owned by
    # root, so this cannot restore the HOME-override bypass. Without this
    # fallback, LDAP-only users would be unable to uninstall via the default
    # path because their trusted_home never resolves.
    if [ -z "$trusted_home" ] && [ -n "${HOME:-}" ] && [ -O "$HOME" ]; then
      trusted_home="$HOME"
    fi
  fi
  trusted_home="${trusted_home%/}"

  # Fast-allow: resolved path must be strictly inside the trusted home and
  # not equal to it. Without this shortcut, the prefix blocklist below would
  # refuse the default `/Users/<user>/.claude/...` because /Users is in the
  # list. The fast-allow runs AGAINST THE RESOLVED FORM, so a traversal like
  # `$HOME/../../Users` (resolves to `/Users`) does not hit it. If
  # trusted_home could not be resolved, inside_home stays 0 and the blocklist
  # applies unconditionally.
  local inside_home=0
  if [ -n "$trusted_home" ] && [[ "$resolved" == "$trusted_home"/* ]] && [ "$resolved" != "$trusted_home" ]; then
    inside_home=1
  fi

  # Blocklist covers:
  #   - POSIX: /, /root, /home, /usr, /etc, /var, /tmp, /bin, /sbin, /opt,
  #     /boot, /dev, /proc, /sys, /lib, /mnt, /srv, /run, /media,
  #     /lost+found, /snap, /selinux, /sysroot
  #   - macOS: /Users, /Library, /System, /Applications, /private, /cores,
  #     /Volumes, /Network, /.vol
  # Match with [[ ]] (not [ ]) so `shopt -s nocasematch` applies to both the
  # equality and prefix branches: `[ "$a" = "$b" ]` is case-sensitive under
  # nocasematch and caused a confirmed bypass against `/LOST+FOUND` on the
  # previous revision. Check BOTH equality and prefix-with-slash (so
  # /System/Library and any path nested under a blocklisted root is also
  # refused).
  local blocklist=(
    / /root /home /Users
    /usr /etc /var /tmp /bin /sbin /opt /boot /dev /proc /sys /lib /mnt /srv
    /run /media /lost+found /snap /selinux /sysroot
    /Library /System /Applications /private /cores /Volumes /Network /.vol
  )
  if [ "$inside_home" -eq 0 ]; then
    for candidate in "$stripped" "$resolved"; do
      [ -z "$candidate" ] && fail "Refusing to operate on empty path"
      for blocked in "${blocklist[@]}"; do
        if [[ "$candidate" == "$blocked" ]] || [[ "$candidate" == "$blocked"/* ]]; then
          fail "Refusing to operate on dangerous path: $INSTALL_DIR (resolves to $candidate, inside blocklisted $blocked)"
        fi
      done
    done
  fi
  shopt -u nocasematch

  if [ "${#stripped}" -lt 10 ]; then
    fail "Refusing to operate on suspiciously short path: $INSTALL_DIR"
  fi
  if [ "$resolved" = "$HOME" ] || [ "$INSTALL_DIR" = "$HOME" ] || [ "$stripped" = "${HOME%/}" ] || [ "$resolved" = "${HOME%/}" ]; then
    fail "Refusing to operate on your home directory: $INSTALL_DIR"
  fi

  if [ ! -e "$INSTALL_DIR" ]; then
    # A clone deleted by hand leaves its skill links dangling; clear those too.
    remove_skill_links
    say "Nothing to uninstall at $INSTALL_DIR"
    exit 0
  fi

  if [ "$FORCE" -ne 1 ]; then
    printf 'This will delete %s.\nType "yes" to continue: ' "$INSTALL_DIR"
    read -r answer
    if [ "$answer" != "yes" ]; then
      fail "Aborted."
    fi
  fi

  if [ "$BACKUP" -eq 1 ] && [ -d "$INSTALL_DIR/briefs" ]; then
    # Refuse to copy if briefs is a symlink: `cp -a` would follow the top-level
    # link and silently back up whatever it points at, potentially landing a
    # copy of an unrelated directory outside the install tree.
    if [ -L "$INSTALL_DIR/briefs" ]; then
      fail "Refusing to back up briefs: $INSTALL_DIR/briefs is a symlink"
    fi
    local ts dst n
    ts="$(date +%Y%m%d-%H%M%S)"
    dst="${HOME}/.claude/lss-briefs-backup-${ts}"
    n=1
    while [ -e "$dst" ]; do
      dst="${HOME}/.claude/lss-briefs-backup-${ts}-${n}"
      n=$((n + 1))
    done
    say "Backing up briefs to $dst"
    mkdir -p "$(dirname "$dst")"
    cp -a "$INSTALL_DIR/briefs" "$dst"
  fi

  remove_skill_links
  rm -rf "$INSTALL_DIR"
  say "Removed $INSTALL_DIR"
}

main "$@"

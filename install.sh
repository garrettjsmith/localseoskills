#!/usr/bin/env bash
# Local SEO Skills installer for macOS / Linux.
#
# Installs the skills into ~/.claude/skills/localseoskills so Claude Code and
# any agent that reads the Agent Skills spec can discover them. If a previous
# install exists, fetches latest and fast-forwards cleanly, preserving any
# briefs/ directory (client data) by backing it up first.
#
# Usage (curl one-liner, pipes to bash):
#   curl -fsSL https://raw.githubusercontent.com/garrettjsmith/localseoskills/main/install.sh | bash
#
# Or after cloning:
#   bash localseoskills/install.sh
#
# Custom install location:
#   curl -fsSL <url> | LSS_INSTALL_DIR=/custom/path bash

set -euo pipefail

REPO_URL="https://github.com/garrettjsmith/localseoskills.git"
INSTALL_DIR="${LSS_INSTALL_DIR:-${HOME:?HOME is not set}/.claude/skills/localseoskills}"

say() {
  printf '\033[1;32m>\033[0m %s\n' "$1"
}

fail() {
  printf '\033[1;31mx\033[0m %s\n' "$1" >&2
  exit 1
}

backup_briefs() {
  local src="$1/briefs"
  [ -d "$src" ] || return 0
  local backup_root="${HOME}/.claude"
  mkdir -p "$backup_root"
  local ts
  ts="$(date +%Y%m%d-%H%M%S)"
  local dst="${backup_root}/lss-briefs-backup-${ts}"
  # Collision-safe: append a counter if the target already exists. Protects
  # against multiple backups inside the same second, which date stamps miss.
  local n=1
  while [ -e "$dst" ]; do
    dst="${backup_root}/lss-briefs-backup-${ts}-${n}"
    n=$((n + 1))
  done
  say "Backing up briefs to $dst"
  cp -a "$src" "$dst"
}

install_fresh() {
  _LSS_TMP="$(mktemp -d "${TMPDIR:-/tmp}/lss-install.XXXXXX")"
  say "Cloning Local SEO Skills"
  # core.longpaths=true is a no-op on macOS/Linux but prevents failures on
  # Windows if users run this via WSL or git-bash with paths over 260 chars.
  git -c core.longpaths=true clone --depth 1 "$REPO_URL" "$_LSS_TMP/localseoskills"
  # Re-check inside the critical section so concurrent runs that slipped past
  # the lock (shouldn't happen, but defense in depth) don't nest clones.
  if [ -e "$INSTALL_DIR" ]; then
    fail "$INSTALL_DIR appeared mid-install. Remove it and rerun."
  fi
  mv "$_LSS_TMP/localseoskills" "$INSTALL_DIR"
}

update_existing() {
  say "Existing install detected at $INSTALL_DIR, updating"

  # Sanity check: the existing checkout's origin must actually be this repo.
  # Without this, a misconfigured LSS_INSTALL_DIR pointing at an unrelated
  # git checkout would get `git reset --hard` against the WRONG origin's
  # branch, silently destroying the user's work.
  local origin_url
  origin_url="$(git -C "$INSTALL_DIR" remote get-url origin 2>/dev/null || echo '')"
  case "$origin_url" in
    "$REPO_URL"|"${REPO_URL%.git}"|"${REPO_URL%.git}.git"|\
    git@github.com:garrettjsmith/localseoskills|\
    git@github.com:garrettjsmith/localseoskills.git|\
    ssh://git@github.com/garrettjsmith/localseoskills|\
    ssh://git@github.com/garrettjsmith/localseoskills.git)
      ;;
    *)
      fail "Refusing to update: $INSTALL_DIR exists but its origin ($origin_url) is not $REPO_URL. Remove $INSTALL_DIR manually and rerun, or unset LSS_INSTALL_DIR." ;;
  esac

  # Refuse to clobber uncommitted local changes inside the install dir. Covers
  # tracked-modified (diff), staged (diff --cached), AND untracked files that
  # are not gitignored. Without the untracked check, a user's personal note or
  # experimental file dropped into the install dir would be silently wiped by
  # `git reset --hard`. The `--exclude-standard` flag respects .gitignore, so
  # briefs/<client>/ (gitignored) and .env remain invisible to this check.
  if ! git -C "$INSTALL_DIR" diff --quiet \
      || ! git -C "$INSTALL_DIR" diff --cached --quiet \
      || [ -n "$(git -C "$INSTALL_DIR" ls-files --others --exclude-standard 2>/dev/null)" ]; then
    fail "Refusing to update: $INSTALL_DIR has uncommitted or untracked files. Commit, stash, or remove them (or remove $INSTALL_DIR and rerun for a clean install)."
  fi

  # Refuse to switch branches silently on a detached HEAD.
  local branch
  if ! branch="$(git -C "$INSTALL_DIR" symbolic-ref --short HEAD 2>/dev/null)"; then
    fail "Refusing to update: $INSTALL_DIR is on a detached HEAD. Check out a branch first, or remove $INSTALL_DIR and rerun."
  fi

  backup_briefs "$INSTALL_DIR"

  if ! git -C "$INSTALL_DIR" fetch --depth 1 origin "$branch"; then
    fail "git fetch failed. Check your network connection and try again."
  fi
  if ! git -C "$INSTALL_DIR" reset --hard "origin/$branch"; then
    fail "git reset failed. Remove $INSTALL_DIR manually and rerun."
  fi
}

configure_mcp() {
  # Interactive prompts need a real terminal. In CI or headless environments,
  # /dev/tty may exist as a device node but fail to open. Skip gracefully.
  [ -n "${CI:-}" ] && return 0
  if [ -t 0 ]; then
    exec 3<&0
  elif exec 3</dev/tty 2>/dev/null; then
    true
  else
    return 0
  fi

  printf '\nConnect LocalSEOData (free API key at localseodata.com/signup)? [Y/n] ' >&2
  read -r answer <&3
  case "$answer" in
    [Nn]*) exec 3<&-; return 0 ;;
  esac

  printf 'API key: ' >&2
  read -rs api_key <&3
  printf '\n' >&2
  exec 3<&-

  if [ -z "$api_key" ]; then
    exec 3<&-
    say "Skipped. Configure MCP later per the README."
    return 0
  fi

  local mcp_url="https://mcp.localseodata.com/mcp?key=${api_key}"
  local configured=0

  # Claude Code CLI — check if already configured, then add with correct flags.
  if command -v claude >/dev/null 2>&1; then
    if claude mcp list 2>/dev/null | grep -q localseodata; then
      say "LocalSEOData already configured in Claude Code, skipping."
      configured=1
    elif claude mcp add --transport http --scope user localseodata "$mcp_url" 2>/dev/null; then
      say "LocalSEOData added to Claude Code (all projects)."
      configured=1
    fi
  fi

  # Claude Desktop (macOS / Linux) — edit the global config JSON directly.
  local desktop_mac="${HOME}/Library/Application Support/Claude/claude_desktop_config.json"
  local desktop_linux="${HOME}/.config/Claude/claude_desktop_config.json"
  local desktop_config=""
  if [ -f "$desktop_mac" ]; then
    desktop_config="$desktop_mac"
  elif [ -f "$desktop_linux" ]; then
    desktop_config="$desktop_linux"
  fi
  if [ -n "$desktop_config" ] && command -v python3 >/dev/null 2>&1; then
    if python3 - "$desktop_config" "$mcp_url" <<'PYEOF'
import json, sys, os, shutil, tempfile
config_path, mcp_url = sys.argv[1], sys.argv[2]
config = {}
if os.path.exists(config_path):
    with open(config_path) as f:
        raw = f.read()
    if raw.strip():
        try:
            config = json.loads(raw)
        except json.JSONDecodeError:
            bak = config_path + ".bak"
            shutil.copy2(config_path, bak)
            print(f"  Existing config was unparseable; backed up to {bak}")
if "mcpServers" not in config:
    config["mcpServers"] = {}
if "localseodata" in config.get("mcpServers", {}):
    print("  localseodata already in Claude Desktop config, updating.")
config["mcpServers"]["localseodata"] = {"url": mcp_url}
dir_name = os.path.dirname(config_path)
orig_mode = os.stat(config_path).st_mode if os.path.exists(config_path) else None
fd, tmp = tempfile.mkstemp(dir=dir_name, suffix=".tmp")
try:
    with os.fdopen(fd, "w") as f:
        json.dump(config, f, indent=2); f.write("\n")
    if orig_mode is not None:
        os.chmod(tmp, orig_mode)
    os.replace(tmp, config_path)
except Exception:
    os.unlink(tmp)
    raise
PYEOF
    then
      say "LocalSEOData added to Claude Desktop."
      configured=1
    fi
  fi

  if [ "$configured" -eq 0 ]; then
    say "Add LocalSEOData to your MCP config manually:"
    printf '\n  "localseodata": { "url": "%s" }\n\n' "$mcp_url"
  fi
}

_LSS_TMP=""
_LSS_LOCK=""
_LSS_LOCK_OWNED=0

cleanup() {
  [ -n "$_LSS_TMP" ] && [ -d "$_LSS_TMP" ] && rm -rf "$_LSS_TMP"
  # Only remove the lock if THIS process created it. Prevents a failing run
  # from deleting a lock that belongs to a concurrent winner.
  [ "$_LSS_LOCK_OWNED" -eq 1 ] && [ -n "$_LSS_LOCK" ] && [ -d "$_LSS_LOCK" ] && rmdir "$_LSS_LOCK" 2>/dev/null
  return 0
}

main() {
  command -v git >/dev/null 2>&1 || fail "git is required but not found. Install git and try again."

  # Pre-install path guard. Install is not destructive like uninstall, but
  # an admin running `install.sh` with LSS_INSTALL_DIR pointing at a system
  # root would create a skills directory there. Port the core refusals from
  # uninstall.sh so this class of mistake fails before we mkdir anything.
  case "/$INSTALL_DIR/" in
    */../*) fail "Refusing to install to path with .. traversal: $INSTALL_DIR" ;;
  esac
  if [ -L "$INSTALL_DIR" ]; then
    fail "Refusing to install into a symlink: $INSTALL_DIR"
  fi
  # Minimal blocklist (top-level only; install creates, not destroys, so the
  # full prefix+case+symlink apparatus from uninstall is overkill here). The
  # PS side has the same guard via Test-SafeInstallPath.
  case "${INSTALL_DIR%/}" in
    /|""|\
    /root|/home|/Users|\
    /usr|/etc|/var|/tmp|/bin|/sbin|/opt|/boot|/dev|/proc|/sys|/lib|/mnt|/srv|\
    /run|/media|/lost+found|/snap|/selinux|/sysroot|\
    /Library|/System|/Applications|/private|/cores|/Volumes|/Network|/.vol)
      fail "Refusing to install to system path: $INSTALL_DIR" ;;
  esac

  # Pre-flight writability check so custom LSS_INSTALL_DIR pointing somewhere
  # the user can't write (e.g. /opt/... without sudo) fails with a clear
  # message instead of a cryptic git or mv error later.
  local parent
  parent="$(dirname "$INSTALL_DIR")"
  if ! mkdir -p "$parent" 2>/dev/null; then
    fail "Cannot create $parent. Check permissions or set LSS_INSTALL_DIR to a user-writable path."
  fi
  if [ ! -w "$parent" ]; then
    fail "$parent is not writable by this user. Set LSS_INSTALL_DIR to a user-writable path, or rerun with appropriate permissions."
  fi

  # Serialize concurrent installs into the same dir. mkdir is atomic on POSIX,
  # so whichever process creates the lock dir first wins; the other aborts
  # cleanly instead of racing and nesting clones. Set trap BEFORE mkdir, and
  # only mark the lock as owned after mkdir succeeds, so a failing losing
  # process never removes the winner's lock.
  trap cleanup EXIT
  local lock_candidate="${INSTALL_DIR}.lock"
  if ! mkdir "$lock_candidate" 2>/dev/null; then
    fail "Another install is in progress (lock at $lock_candidate). If stale, remove it and retry."
  fi
  _LSS_LOCK="$lock_candidate"
  _LSS_LOCK_OWNED=1

  if [ -d "$INSTALL_DIR/.git" ] && git -C "$INSTALL_DIR" rev-parse --git-dir >/dev/null 2>&1; then
    update_existing
  elif [ -e "$INSTALL_DIR" ]; then
    fail "$INSTALL_DIR exists and is not a clean git checkout. Remove it and rerun."
  else
    install_fresh
  fi

  say "Local SEO Skills installed."

  configure_mcp

  cat <<'EOF'

Next steps:
  1. Open Claude Code or your preferred AI agent.
  2. Mention any local business to get started. For example:
       "Audit Mike's Plumbing in Buffalo"
     The agent will ask 5 questions, run an audit, and set up a persistent
     brief for ongoing work.

Docs:      https://github.com/garrettjsmith/localseoskills
Community: https://discord.gg/dBtF26Ga2a
EOF
}

main "$@"

# Security Policy

## Supported Versions

Security fixes are applied to `main`. There are no long-lived release branches.

## Reporting a Vulnerability

Do not open a public GitHub issue for security problems.

Preferred channel: [private vulnerability report](https://github.com/garrettjsmith/localseoskills/security/advisories/new) via GitHub Security Advisories.

Fallback: DM a maintainer on the [community Discord](https://discord.gg/BFtGYWBmDw).

We aim to acknowledge reports within 72 hours. Critical issues (RCE, credential exposure, destructive shell behavior) are triaged first.

When reporting, include:

- Affected file / skill / script
- Reproduction steps (shell commands, env vars, inputs)
- Observed behavior and expected behavior
- Your environment (OS, shell, git version)

## Piped-execution installers

As of v1.0.1 the README ships `curl | bash` and `irm | iex` one-liners for install friction parity across platforms. Prior versions deliberately avoided piped execution. The installers include pre-flight guards (path validation, writability checks, origin verification) to mitigate the inherent risks of this pattern. Users who prefer to review before running can clone the repo and execute the script locally.

## Scope

In scope:

- Install and uninstall scripts (`install.sh`, `uninstall.sh`, `install.ps1`, `uninstall.ps1`)
- Skill files that execute shell commands or write to the filesystem
- Task templates that run without human approval
- Dependencies pinned in the repo

Out of scope:

- Vulnerabilities in third-party MCP servers or data providers (report upstream)
- Issues that require physical access or an already-compromised shell
- Social-engineering a maintainer

## Hardening Guidance for Contributors

### Destructive scripts

Install and uninstall scripts must refuse to operate on:

- The filesystem root (`/`)
- Any top-level system directory (`/etc`, `/usr`, `/var`, `/bin`, `/sbin`, `/opt`, `/tmp`, `/root`, and bare `/Users` or `/home`) — note that paths *inside* the current user's `$HOME` are allowed via a home-dir carve-out, which is what lets the default install at `~/.claude/skills/localseoskills` work
- The user's `$HOME` directory itself (as opposed to paths beneath it)
- Raw input paths shorter than 10 characters (after trailing-slash normalization)
- Paths containing `..` traversal segments (refused outright — the guard does not attempt to resolve them)

Both the raw input and the resolved absolute path are checked against the blocklist (dual-candidate match). Keep that pattern in new scripts.

### Testing destructive scripts

Never run install or uninstall scripts with `--force` against a real path you care about. Recommended sandbox:

1. Clone the repo anywhere disposable (e.g. `$HOME/lss-dev-sandbox/clone`)
2. Set `LSS_INSTALL_DIR` to a disposable path **under `$HOME`** (e.g. `$HOME/lss-dev-sandbox/install`). The uninstall guard refuses top-level system directories like `/tmp`, `/opt`, `/var`, and bare `/Users` or `/home`; it only allows paths inside your own `$HOME`.
3. Exercise the guard with known-dangerous inputs (`/`, `$HOME`, `/etc`, `$HOME/../../Users`, etc.) and confirm each one refuses before reaching any `rm`
4. Only then test the happy path against your sandbox install dir

If you use Claude Code to run these tests, the session-level bash guard (`bash-guard.py`) blocks `uninstall*.sh --force` by default as a defense-in-depth layer. Substitute the prompt-driven form (`echo "yes" | bash uninstall.sh`) when you need to exercise the real uninstall path.

### CI

The `.github/workflows/ci.yml` workflow runs the dangerous-input battery on every PR to `main`. A guard regression blocks the merge.

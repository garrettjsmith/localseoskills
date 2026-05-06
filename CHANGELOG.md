# Changelog

All notable changes to Local SEO Skills are documented here. Format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/). Versions use [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

Individual skill versions are tracked in [VERSIONS.md](VERSIONS.md).

## [Unreleased]

### Fixed
- `claude mcp add` syntax: `-s http` was parsed as `--scope http`, not `--transport http`. Fixed to `--transport http --scope user`.
- PowerShell `ConvertFrom-Json -AsHashtable` replaced with PS 5.1-compatible PSObject-to-hashtable conversion. The previous code would fail on stock Windows 10/11 PowerShell (5.1) and could silently overwrite existing MCP server configs.
- Non-atomic JSON write in both installers: now uses temp-file-then-rename to prevent corruption on kill mid-write.
- Silent backup-then-overwrite on JSON parse failure now prints a message telling the user their config was backed up.
- Linux Claude Desktop path (`~/.config/Claude/`) now handled in install.sh alongside macOS path.
- Re-install idempotency: both installers now skip `claude mcp add` and note existing Desktop config entries instead of erroring or duplicating.
- API key input masked during entry (`read -s` on bash, `-AsSecureString` on PowerShell) to reduce exposure on shared terminals.

### Security
- v1.0.1 shipped `curl | bash` and `irm | iex` one-liners in the README, reversing a prior explicit stance against piped-execution installers. This was a deliberate UX decision for install friction parity across platforms, but was not documented as a policy change. Now acknowledged here and in SECURITY.md.
- **Known limitation:** `claude mcp add` passes the API key as a CLI argument, making it briefly visible in the process list (`ps aux` on macOS/Linux, Task Manager on Windows) for the duration of the command. This is inherent to the Claude Code CLI -- there is no stdin or config-file input mode. Risk is low on single-user machines; users on shared/multi-user hosts should be aware. The key is also stored in plaintext in the MCP config file (`~/.claude/settings.json` or `claude_desktop_config.json`), which is the longer-term exposure surface.

## [1.0.1] — 2026-05-04

### Added
- Post-install MCP auto-setup: prompts to connect LocalSEOData, configures Claude Code CLI or Claude Desktop config automatically. Falls back to manual instructions when neither is available.

### Fixed
- Windows CI happy-path uses USERPROFILE instead of RUNNER_TEMP
- PowerShell uninstall happy-path uses -Force flag instead of piping yes
- CI false failures on first run

## [1.0.0] — 2026-04-17

Initial public release.

### Added
- Claude Code plugin marketplace manifest (`.claude-plugin/plugin.json`, `.claude-plugin/marketplace.json`). Enables one-command install via `/plugin install local-seo-skills@garrettjsmith-localseo` in Claude Code 1.0.33+ and the Claude Desktop plugin browser.
- Install and uninstall scripts for macOS, Linux, and Windows (`install.sh`, `install.ps1`, `uninstall.sh`, `uninstall.ps1`). Idempotent updates, atomic clone-to-temp-then-move, concurrency lockfile, pre-flight writability check, briefs auto-backup to `$HOME/.claude/lss-briefs-backup-<timestamp>`, and multi-layer dangerous-path guards on uninstall (trusted-home derivation, 8.3 short-name rejection, UNC/device-namespace rejection, reparse-point rejection on the target and descendants, and origin-URL / dirty-worktree / detached-HEAD checks before `git reset --hard`).
- Brand assets (`assets/`): wordmark, cover image, social preview image, logo mark, and favicons. SVG masters with PNG renders matching localseoskills.com brand tokens.
- Task index at `tasks/README.md`.

### Changed
- Full README rebuild: install moved to the top, 5-badge row, table of contents, 6 platform-specific install paths, outcome-driven Quick Start examples, "What Makes This Different" section surfacing the briefs, scheduled tasks, and LocalSEOData moats, 15-row scheduled task template table.
- `VERSIONS.md` regenerated from frontmatter: 26 strategy + 12 tool + 1 meta (`brief`) skill, every entry backed by the corresponding `SKILL.md`'s `metadata.version`.

### Security
- Pre-v1 versions of `uninstall.sh` contained a path-traversal guard that missed `$HOME/../../Library`, `/System/Library`, case variants on case-insensitive filesystems, and several Linux/macOS top-level roots. The v1 guard resolves `INSTALL_DIR` against a trusted home derived from `id -un` (bash) or Win32 `[Environment]::GetFolderPath` (PowerShell), rejects paths containing `..` segments outright, refuses top-level or descendant reparse points, and compares against an expanded blocklist using case-insensitive equality + prefix matching.

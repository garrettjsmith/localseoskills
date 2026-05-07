## What this changes

One sentence on the outcome. Save the detail for the checklist below.

## Why

Link the issue this closes, or describe the motivation if there's no issue.

Closes #

## Scope

- [ ] New skill
- [ ] Existing skill change
- [ ] Task template
- [ ] Install / uninstall script
- [ ] Docs only
- [ ] CI / tooling
- [ ] Other:

- [ ] I updated CHANGELOG.md (under [Unreleased]) or explained why this change doesn't need an entry

<details>
<summary>Checklist for SKILL changes (expand if applicable)</summary>

- [ ] `name` in frontmatter matches the directory name
- [ ] `description` is 1-1024 chars and includes trigger phrases
- [ ] SKILL.md is under 500 lines
- [ ] No credentials, API keys, or client PII
- [ ] Tested end-to-end with at least one host agent

</details>

<details>
<summary>Checklist for install / uninstall script changes (expand if applicable)</summary>

- [ ] Guard refuses `/`, `$HOME`, top-level system dirs, and `..`-traversal inputs
- [ ] Both raw input and resolved path are checked against the blocklist
- [ ] Length floor and home-dir guard still present
- [ ] Tested from a clean `$HOME/lss-dev-sandbox` clone against the dangerous-input battery in `SECURITY.md`
- [ ] CI `ci.yml` passes

</details>

## Claude Code contributors

- [ ] Attribution suppressed (`{"attribution": {"commit": "", "pr": ""}}` in settings) — see [CONTRIBUTING.md](../CONTRIBUTING.md#claude-code-settings)
- [ ] Commits are single-authored (no `Co-Authored-By: Claude …` trailer) — the project-level `.claude/settings.json` handles this for Claude Code, but other tools require manual scrubbing. CI will fail the PR if a Claude trailer slips through.

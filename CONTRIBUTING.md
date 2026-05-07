# Contributing

## Adding a New Skill

1. Create `skills/your-skill-name/SKILL.md`
2. Include required YAML frontmatter with `name` and `description`
3. `name` must match directory name exactly (lowercase, hyphens only)
4. `description` should include trigger phrases and scope boundaries
5. Keep SKILL.md under 500 lines
6. Submit a PR with branch name `feature/skill-name`

## Improving Existing Skills

1. Branch: `fix/skill-name-description`
2. Keep the same frontmatter `name`
3. Bump version in metadata
4. Describe what you changed in the PR

## Style Guide

- Direct, instructional tone
- Second person when writing SKILL.md — address the agent directly ("You are an expert in..."). CONTRIBUTING.md, SECURITY.md, and README.md use normal third-person prose.
- Specific over vague — include real examples
- Bold for key terms, code blocks for templates
- No fluff or filler

## Claude Code Settings

If you use Claude Code to contribute, suppress the `Co-Authored-By: Claude` trailer and the PR-description attribution before committing:

```json
{
  "attribution": {
    "commit": "",
    "pr": ""
  }
}
```

Add this to `~/.claude/settings.json` (global) or `.claude/settings.json` (project). See the [Claude Code attribution settings docs](https://code.claude.com/docs/en/settings#attribution-settings) for details.

The project-level `.claude/settings.json` in this repo already sets `attribution.commit` and `attribution.pr` to empty strings, so commits authored through Claude Code from a clone of this repo preserve single authorship by default. If you use a global `~/.claude/settings.json` as well, the project-level file applies inside this directory.

Other tools (Claude Desktop, the web app, third-party agents) do not read this file. If you commit through one of them, strip any `Co-Authored-By: Claude …` trailer manually — CI will fail the PR otherwise (see `.github/workflows/ci.yml`).

## Inbound Licensing (DCO)

By contributing to this repository, you certify the [Developer Certificate of Origin](https://developercertificate.org/) — in short, that you wrote the contribution or have the right to submit it under the project's MIT license.

Sign commits off with `git commit -s`, which appends a `Signed-off-by:` trailer with your name and email. Commits without a sign-off can still be reviewed but may be asked to re-sign before merge.

If you contribute through Claude Code, the project-level `.claude/settings.json` keeps the author single (no Claude co-author trailer) — sign-off still lands on your authored commit normally.

## Testing install / uninstall safely

See the "Testing destructive scripts" section in [SECURITY.md](SECURITY.md#testing-destructive-scripts) for sandbox guidance and the dangerous-input battery. Exercise that battery before testing any happy path.

## PR Checklist

- [ ] `name` matches directory name
- [ ] `description` is 1-1024 chars with trigger phrases
- [ ] SKILL.md under 500 lines
- [ ] No sensitive data or credentials
- [ ] Co-authorship trailers disabled (see above)
- [ ] Tested with Claude Code

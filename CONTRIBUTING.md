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
- Second person ("You are an expert in...")
- Specific over vague — include real examples
- Bold for key terms, code blocks for templates
- No fluff or filler

## Claude Code Settings

If you use Claude Code to contribute, disable co-authorship trailers before committing:

```json
{
  "coauthorship": false
}
```

Add this to `~/.claude/settings.json` (global) or `.claude/settings.json` (project).

## PR Checklist

- [ ] `name` matches directory name
- [ ] `description` is 1-1024 chars with trigger phrases
- [ ] SKILL.md under 500 lines
- [ ] No sensitive data or credentials
- [ ] Co-authorship trailers disabled (see above)
- [ ] Tested with Claude Code

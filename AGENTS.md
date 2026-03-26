# AGENTS.md

Guidelines for AI agents working in this repository.

## Repository Overview

This repository contains **Agent Skills** for AI agents following the [Agent Skills specification](https://agentskills.io/specification.md). Skills install to `.agents/skills/` (the cross-agent standard).

- **Name**: Local SEO Skills
- **GitHub**: [garrettjsmith/localseoskills](https://github.com/gmbgorilla/localseoskills)
- **Creator**: Garrett Smith
- **License**: MIT

## Repository Structure

```
localseoskills/
├── .claude-plugin/
│   └── marketplace.json
├── docs/
│   ├── how-local-search-works.md    # Ranking model fundamentals
│   ├── local-seo-glossary.md        # 80+ terms defined
│   └── tool-routing.md              # Task → tool options mapping
├── skills/
│   ├── [strategy skills]/           # 23 skills — WHAT to do
│   │   └── SKILL.md
│   └── [tool skills]/               # 11 skills — HOW to execute in specific tools
│       └── SKILL.md
├── tools/
│   └── REGISTRY.md                  # Cross-reference: tools, categories, overlap
├── CONTRIBUTING.md
├── LICENSE
├── VERSIONS.md
└── README.md
```

### Two Skill Types

**Strategy skills** (23): Tell the agent what to do for a local SEO task. Reference tool categories, not specific tools. Example: `local-citations` says "run a citation audit" and points to `docs/tool-routing` for tool selection.

**Tool skills** (11): Tell the agent when and how to use a specific tool, what the data means, and what to do with results. Named `*-tool` (e.g., `brightlocal-tool`, `ahrefs-tool`). Each includes decision logic for when to use this tool vs alternatives.

**Routing**: Strategy skills reference `docs/tool-routing` for tool selection. `tool-routing` maps task categories to tool options. Only hardcodes a tool when it's the sole option (e.g., Local Falcon for geogrid scans). When multiple tools can do the job, lists options with "preferred if connected" guidance.

## Build / Lint / Test Commands

**Skills** are content-only (no build step). Verify manually:
- YAML frontmatter is valid
- `name` field matches directory name exactly
- `name` is 1-64 chars, lowercase alphanumeric and hyphens only
- `description` is 1-1024 characters

## Agent Skills Specification

Skills follow the [Agent Skills spec](https://agentskills.io/specification.md).

### Required Frontmatter

```yaml
---
name: skill-name
description: What this skill does and when to use it. Include trigger phrases.
metadata:
  version: 1.0.0
---
```

### Frontmatter Field Constraints

| Field | Required | Constraints |
|-------|----------|-------------|
| `name` | Yes | 1-64 chars, lowercase `a-z`, numbers, hyphens. Must match dir. |
| `description` | Yes | 1-1024 chars. Describe what it does and when to use it. |
| `license` | No | License name (default: MIT) |
| `metadata` | No | Key-value pairs (author, version, etc.) |

### Writing Style

- Direct and instructional
- Second person ("You are a local SEO expert")
- Keep SKILL.md under 500 lines
- Use H2 for main sections, H3 for subsections
- Bold for key terms, code blocks for examples
- Clarity over cleverness, specific over vague

### Description Best Practices

Include: what the skill does, trigger phrases, related skills for scope boundaries.

## Git Workflow

- New skills: `feature/skill-name`
- Improvements: `fix/skill-name-description`
- Commit format: `feat: add skill-name skill`

## Local SEO Domain Context

These skills encode deep local SEO expertise. Key concepts agents should understand:

- **GBP**: Google Business Profile (formerly Google My Business / GMB)
- **NAP**: Name, Address, Phone — must be consistent across the web
- **Map Pack / Local Pack / 3-Pack**: The map + 3 business results in local SERPs
- **Geogrid**: A grid of ranking checks across a geographic area
- **ARP**: Average Rank Position across a geogrid
- **ATRP**: Average Top Rank Position (average of top-3 positions)
- **SoLV**: Share of Local Voice (% of grid points where business ranks)
- **SAB**: Service Area Business (no physical storefront shown to customers)
- **LSA**: Local Services Ads (pay-per-lead Google ad format)
- **Citation**: A mention of a business's NAP on a third-party site

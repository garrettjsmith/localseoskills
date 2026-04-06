# AGENTS.md

Guidelines for AI agents working in this repository.

## Repository Overview

This repository contains **Agent Skills** for AI agents following the [Agent Skills specification](https://agentskills.io/specification.md). Skills install to `.agents/skills/` (the cross-agent standard).

- **Name**: Local SEO Skills
- **GitHub**: [garrettjsmith/localseoskills](https://github.com/garrettjsmith/localseoskills)
- **Creator**: Garrett Smith
- **License**: MIT

## Repository Structure

```
localseoskills/
├── briefs/
│   ├── README.md                    # Brief system overview
│   └── _templates/
│       ├── location.brief.md        # Single location template
│       └── _brand.brief.md          # Multi-location brand rollup + approval config
├── docs/
│   ├── how-local-search-works.md    # Ranking model fundamentals
│   ├── local-seo-glossary.md        # 80+ terms defined
│   └── tool-routing.md              # Task → tool decision tree
├── meta/
│   └── lessons.md                   # Living record of observed pattern changes
├── skills/
│   ├── brief/SKILL.md               # Meta skill — session state + first run setup
│   │
│   │   # Strategy skills (26) — WHAT to do
│   ├── ai-local-search/SKILL.md
│   ├── apple-business-connect/SKILL.md
│   ├── bing-places/SKILL.md
│   ├── client-deliverables/SKILL.md
│   ├── dispatch/SKILL.md
│   ├── gbp-api-automation/SKILL.md
│   ├── gbp-optimization/SKILL.md
│   ├── gbp-posts/SKILL.md
│   ├── gbp-suspension-recovery/SKILL.md
│   ├── geogrid-analysis/SKILL.md
│   ├── local-citations/SKILL.md
│   ├── local-competitor-analysis/SKILL.md
│   ├── local-content-briefs/SKILL.md
│   ├── local-content-strategy/SKILL.md
│   ├── local-keyword-research/SKILL.md
│   ├── local-landing-pages/SKILL.md
│   ├── local-link-building/SKILL.md
│   ├── local-ppc-ads/SKILL.md
│   ├── local-reporting/SKILL.md
│   ├── local-schema/SKILL.md
│   ├── local-search-ads/SKILL.md
│   ├── local-seo-audit/SKILL.md
│   ├── lsa-ads/SKILL.md
│   ├── multi-location-seo/SKILL.md
│   ├── review-management/SKILL.md
│   ├── service-area-seo/SKILL.md
│   │
│   │   # Tool skills (12) — HOW to execute in specific tools
│   ├── ahrefs-tool/SKILL.md
│   ├── brightlocal-tool/SKILL.md
│   ├── dataforseo-tool/SKILL.md
│   ├── google-analytics-tool/SKILL.md
│   ├── google-search-console-tool/SKILL.md
│   ├── local-falcon-tool/SKILL.md
│   ├── localseodata-tool/SKILL.md
│   ├── lsa-spy-tool/SKILL.md
│   ├── screaming-frog-tool/SKILL.md
│   ├── semrush-tool/SKILL.md
│   ├── serpapi-tool/SKILL.md
│   └── whitespark-tool/SKILL.md
├── specs/
│   ├── output-schema.md             # Task output file format
│   ├── approval-workflow.md         # Three-tier approval system
│   └── notification-format.md       # Slack and email notification formats
├── tasks/
│   ├── README.md                    # Task index
│   ├── m1-rankings-monitor/TASK.md
│   ├── m2-review-velocity/TASK.md
│   ├── m3-gbp-change-monitor/TASK.md
│   ├── m4-lsa-rankings-monitor/TASK.md
│   ├── m5-ai-visibility-monitor/TASK.md
│   ├── r1-weekly-report/TASK.md
│   ├── r2-monthly-client-report/TASK.md
│   ├── r3-multi-location-rollup/TASK.md
│   ├── r4-quarterly-business-review/TASK.md
│   ├── e1-gbp-post-drafts/TASK.md
│   ├── e2-review-response-drafts/TASK.md
│   ├── e3-citation-audit/TASK.md
│   ├── e4-page-content-audit/TASK.md
│   ├── p1-prospect-audit/TASK.md
│   └── p2-competitor-monitor/TASK.md
├── tools/
│   └── REGISTRY.md                  # Tool index and overlap guide
├── .gitignore
├── AGENTS.md
├── CLAUDE.md
├── CONTRIBUTING.md
├── LICENSE
├── VERSIONS.md
└── README.md
```

---

## Skill Types

### Strategy Skills (26)

Tell the agent what to do for a local SEO task. Reference tool categories, not specific tools. Example: `local-citations` defines the citation audit and fix process, then points to `docs/tool-routing` for tool selection.

### Tool Skills (12)

Tell the agent when and how to use a specific tool, what the data means, and what to do with results. Named `*-tool` (e.g., `localseodata-tool`, `local-falcon-tool`). Each includes:
- When to use this tool vs alternatives
- Available endpoints and what they return
- Known quirks, bugs, or workarounds
- How to interpret results

### Meta Skills (1)

Manage agent behavior and state rather than local SEO tasks directly.

**`brief`** — the most important skill in the repo. Manages persistent work state (briefs) for specific businesses and locations.

Key behaviors:
- **First Run Detection**: when a user mentions a business with no existing brief, automatically runs conversational setup — asks 5 questions, runs initial audit, creates brief structure, offers to configure scheduled tasks. No manual bootstrap required.
- **Session State**: creates and updates briefs during manual sessions — session log, tools run, findings, next action.
- **Scheduled Task Integration**: receives output from scheduled tasks, indexes findings into the brief, keeps the brief lean while output files hold the detail.
- **Resume**: when returning to a business, reads the brief and recent outputs, summarizes current state, and picks up from the last Next Action.
- **Lessons Flywheel**: proposes additions to `meta/lessons.md` when observing behavior that contradicts skill file guidance.

See `briefs/README.md` for the full brief system.

Meta skills are not included in strategy or tool skill counts.

---

## Scheduled Tasks

15 task definitions in `tasks/` — one per folder, each with its own `TASK.md`. This architecture mirrors the skills structure: one task per folder, self-contained, individually loadable.

Each `TASK.md` contains:
- **Frontmatter**: name, schedule, tier, skills to load, MCPs required
- **Skills section**: which skills to load + fallback instruction
- **Fallback Guidance**: compressed expertise for standalone operation if skills don't load
- **Verification**: pre-execution checklist
- **Prompt**: the full prompt to paste into Claude Code scheduled tasks
- **Output**: what gets written and where

Tasks reference skills — skills provide the interpretation framework, tasks provide the execution context. A task running without its skills loaded uses the Fallback Guidance to maintain output quality.

### Approval Tiers

| Tier | Behavior |
|---|---|
| **Autonomous** | Runs, writes output, notifies. No human needed. |
| **Queue (Tier 2)** | Drafts output, holds for approval, then executes. |
| **Notify (Tier 3)** | Confirms before AND after. Used when touching third parties. |

### Specs

Three spec files govern how all tasks operate:
- `specs/output-schema.md` — every task output file follows this format
- `specs/approval-workflow.md` — defines the three approval tiers and agency config
- `specs/notification-format.md` — Slack and email formats, alert thresholds

These specs are **platform-agnostic**. Claude-native execution uses scheduled tasks and MCP connectors. Other platforms (LSEOAgent, OpenClaw, custom) implement the same patterns using their own infrastructure.

---

## Briefs

Briefs are persistent work state — not part of the skills, but generated during engagements. They live in `briefs/` on disk (Claude Code) or in a Claude Project knowledge base (browser/desktop).

**Never commit brief files to this repo.** The `.gitignore` handles this:
```
briefs/*/
!briefs/_templates/
!briefs/README.md
```

Brief files contain real client data. Templates in `briefs/_templates/` are the only brief-related files that belong in the repo.

### Brief Structure

```
briefs/
  {brand}/
    _brand.brief.md          ← config + rollup
    {location}/
      location.brief.md      ← always current, always lean
      reports/
      scans/
      drafts/
      alerts/
```

---

## Lessons

`meta/lessons.md` is a living document. Agents propose additions when observing behavior that diverges from skill file guidance. Humans approve in chat before the agent writes.

**Lessons belong here if they are:**
- Temporal — true now, likely to change (algo behavior, GBP policy, tool quirks)
- Exception — contradicts general skill guidance in specific circumstances
- Emerging — new platform or signal behavior not yet in any skill file

**Lessons do NOT belong here if they are:**
- Already covered in a skill file
- A single data point without corroboration
- General best practice (update the skill instead)

---

## Build / Lint / Test Commands

**Skills and tasks** are content-only — no build step. Verify manually:
- YAML frontmatter is valid
- `name` field matches directory name exactly
- `name` is 1-64 chars, lowercase alphanumeric and hyphens only
- `description` is 1-1024 characters
- For TASK.md: verify Skills, Fallback Guidance, Verification, and Prompt sections all present

---

## Agent Skills Specification

Skills follow the [Agent Skills spec](https://agentskills.io/specification.md).

### Required Frontmatter

```yaml
---
name: skill-name
description: What this skill does and when to use it. Include trigger phrases.
metadata:
  version: 1.0.0
  author: Garrett Smith
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

---

## Task Specification

Tasks follow the same folder-per-item pattern as skills. Each task lives in `tasks/{task-id}/TASK.md`.

### Required Frontmatter

```yaml
---
name: task-id
description: What this task does and when to load it.
schedule: frequency and time
tier: autonomous | queue (tier 2) | notify (tier 3)
skills: skill-name, skill-name
mcps: ToolName, ToolName
---
```

### Required Sections

Every TASK.md must contain:
1. `## Skills` — which skills to load + "If unavailable, use Fallback Guidance below"
2. `## Fallback Guidance` — compressed expertise for standalone operation
3. `## Verification` — pre-execution checklist with failure handling
4. `## Prompt` — the full prompt block
5. `## Output` — what gets written and where

---

## Git Workflow

- New skills: `feature/skill-name`
- New tasks: `feature/task-id`
- Improvements: `fix/skill-name-description`
- Commit format: `feat: add skill-name skill` / `feat: add task-id task`

---

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
- **Brief**: Persistent work state file for a specific business/location engagement
- **Tier**: Approval level for scheduled task outputs (autonomous / queue / notify)

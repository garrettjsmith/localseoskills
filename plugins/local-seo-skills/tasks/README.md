# Task Templates

Fifteen scheduled task templates that run against a client brief on a recurring schedule. Tasks complement the skills: skills describe *what* to do on demand, tasks describe *what to do autonomously on a schedule*.

Each task is a directory containing a `TASK.md` with frontmatter describing its schedule, approval tier, required skills, and required MCP servers. Once the skills are installed, agents can discover and load tasks from this directory; wiring tasks into a scheduler is host-agent-specific.

## Approval tiers

Defined in full in [`specs/approval-workflow.md`](../specs/approval-workflow.md).

- **Tier 1 — Autonomous.** Runs, writes output, sends a summary notification. No human in the loop. Used for monitoring, audits, and read-only scans.
- **Tier 2 — Queue for Approval.** Runs, produces a draft, holds until a human approves. Nothing goes live until approved. Used for GBP posts, review responses, content drafts.
- **Tier 3 — Notify Before and After.** Highest stakes. Pre-approval notification, explicit confirm, execution, post-execution notification to agency + client. Used for tasks that touch third parties outside the agency (client emails, publishing content live).

## Catalog

### Execution (drafts, audits, content)

| Task | Cadence | Tier | Description |
|------|---------|------|-------------|
| [e1-gbp-post-drafts](e1-gbp-post-drafts/TASK.md) | Monthly | 2 (queue) | Drafts 4 GBP posts (service spotlight, seasonal, educational, social proof). Held for approval. |
| [e2-review-response-drafts](e2-review-response-drafts/TASK.md) | Weekly | 2 (queue) | Drafts personalized responses to unanswered reviews from the last 7 days. Held for approval. |
| [e3-citation-audit](e3-citation-audit/TASK.md) | Quarterly | 1 (autonomous) | NAP consistency audit across 20 directories. Report only. |
| [e4-page-content-audit](e4-page-content-audit/TASK.md) | Quarterly | 2 (queue) | Location page audit for thin content, schema, NAP, and keyword gaps. Drafts improvements for approval. |

### Monitoring (scheduled scans)

| Task | Cadence | Tier | Description |
|------|---------|------|-------------|
| [m1-rankings-monitor](m1-rankings-monitor/TASK.md) | Weekly | 1 (autonomous) | Geogrid ranking scan. Tracks ARP, ATRP, SoLV week-over-week. Alerts on degradation. |
| [m2-review-velocity](m2-review-velocity/TASK.md) | Weekly | 1 (autonomous) | Review health monitor. Velocity, sentiment, unanswered reviews, rating trend. |
| [m3-gbp-change-monitor](m3-gbp-change-monitor/TASK.md) | Daily | 1 (autonomous) | Detects unauthorized GBP edits against a saved baseline. |
| [m4-lsa-rankings-monitor](m4-lsa-rankings-monitor/TASK.md) | Weekly | 1 (autonomous) | LSA position tracking. Alerts on drops out of top 3. Requires LSA Spy MCP. |
| [m5-ai-visibility-monitor](m5-ai-visibility-monitor/TASK.md) | Monthly | 1 (autonomous) | AI search visibility across Google AI Overviews, ChatGPT, Gemini, Perplexity. |

### Prospecting

| Task | Cadence | Tier | Description |
|------|---------|------|-------------|
| [p1-prospect-audit](p1-prospect-audit/TASK.md) | On demand | 1 (autonomous) | Pre-sales-call audit framed as sales prep. Not a client deliverable. |
| [p2-competitor-monitor](p2-competitor-monitor/TASK.md) | Monthly | 1 (autonomous) | Competitive landscape snapshot. Map pack, competitor reviews, ad activity. |

### Reporting

| Task | Cadence | Tier | Description |
|------|---------|------|-------------|
| [r1-weekly-report](r1-weekly-report/TASK.md) | Weekly | 1 (autonomous) | Narrative performance summary. Rankings + reviews + map pack. Slack on completion. |
| [r2-monthly-client-report](r2-monthly-client-report/TASK.md) | Monthly | 3 (notify) | Client-facing performance report + email draft. Pre-approval + post-execution notify. |
| [r3-multi-location-rollup](r3-multi-location-rollup/TASK.md) | Monthly | 1 (autonomous) | Brand-level rollup across all locations. Reads from existing briefs. |
| [r4-quarterly-business-review](r4-quarterly-business-review/TASK.md) | Quarterly | 2 (queue) | 90-day business review. Held for agency approval. |

## How to use

- Install the skills (`install.sh` / `install.ps1`).
- Connect the MCP data providers each task requires (listed in the task's frontmatter).
- Wire your agent's scheduler to load the task on the indicated cadence. Details in the specific host agent's docs.
- For Tier 2 and Tier 3 tasks, ensure the approval surface is wired (Slack or email, configured per brand in `_brand.brief.md`).

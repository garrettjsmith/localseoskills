# Task Output File Schema

Every scheduled task writes a dated output file to the appropriate subfolder of the location brief. This schema applies to all task types.

## File Naming

```
briefs/{brand}/{location}/{category}/{YYYY-MM-DD}-{task-type}.md
```

Examples:
```
briefs/keystone-insurance/buffalo/reports/2026-04-01-weekly.md
briefs/keystone-insurance/buffalo/scans/2026-04-01-geogrid.md
briefs/keystone-insurance/buffalo/drafts/2026-04-01-gbp-posts.md
briefs/keystone-insurance/buffalo/alerts/2026-04-01-review-drop.md
```

## Categories

| Folder | Contents |
|---|---|
| `reports/` | Weekly, monthly, quarterly summaries |
| `scans/` | Geogrid scans, citation audits, competitor snapshots |
| `drafts/` | GBP posts, review responses, page content — awaiting approval |
| `alerts/` | Monitoring alerts requiring attention |
| `prospects/` | Prospect audits for sales use |

---

## File Structure

Every output file follows this structure — no exceptions.

```markdown
# {Task Name} — {Business Name} {Location}
**Date:** {YYYY-MM-DD}
**Task type:** {monitoring | reporting | execution | prospecting}
**Approval tier:** {autonomous | queue | notify}

---

## Status
**Result:** SUCCESS | PARTIAL | FAILED
**Tools called:** {list of MCP tools invoked}
**Errors:** {any failures, timeouts, or missing data — "none" if clean}
**Runtime:** {approximate}

---

## Summary
{2-4 sentence narrative. What happened, what matters, what's next.
Written for a human who will read this first thing in the morning.
No raw data dumps. Insight and action, not just numbers.}

---

## Findings
{Task-specific content — see templates for each task type}

---

## Recommended Actions
{Prioritized. Only include if there's something actionable.}
| Priority | Action | Effort | Skill |
|---|---|---|---|

---

## Approval Required
{Only present on queue and notify tier tasks}
**Status:** PENDING | APPROVED | REJECTED
**Reviewed by:** 
**Date reviewed:**
**Notes:**

---

## Delivery Log
{Only present when notifications were sent}
- {timestamp} → {channel} → {recipient} → {status}
```

---

## Status Field Rules

**SUCCESS** — all tools called, all data returned, output complete
**PARTIAL** — some tools failed or returned empty, output generated from available data, errors noted
**FAILED** — task could not complete, errors logged, brief updated with failure note

On PARTIAL or FAILED: agent writes a one-line note to the location brief Session Log and flags for human review. Does not silently skip.

---

## Summary Writing Rules

The Summary is the most important field. Rules:

1. Always lead with the most important finding
2. State direction of change — "ARP improved from 8.2 to 7.6" not just "ARP is 7.6"
3. Include one concrete next action
4. Never paste raw API responses
5. Write as if briefing a colleague who has 30 seconds

Good: "Rankings improved across 6 of 7 grid points this week — the downtown cluster is still weak. Review velocity is healthy at 3 new reviews. One urgent item: a 1-star review from yesterday hasn't been responded to."

Bad: "Geogrid scan completed. ARP: 7.6. SoLV: 58%. Reviews: 3 new. See findings below."

---

## Brief Update Rule

After every task output, agent adds one line to `location.brief.md` Session Log:

```
[DATE] — {task type} complete → {one-line finding} → see {output file path}
```

The brief stays lean. The output file has the detail.

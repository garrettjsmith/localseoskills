---
name: r2-monthly-client-report
description: Monthly performance report drafted for client delivery. Generates report and client-facing email, holds for agency approval before sending. Tier 3 — notifies before sending, confirms after.
schedule: monthly — 1st of month, 9 AM
tier: notify (tier 3)
skills: local-reporting, client-deliverables, localseodata-tool
mcps: LocalSEOData, Gmail MCP
---

# R2: Monthly Client Report

## Skills
**Primary:** `local-reporting`, `client-deliverables`, `localseodata-tool`
Load these first. If unavailable, use Fallback Guidance below.

## Fallback Guidance
Use this if skills are unavailable.

**Monthly report structure — what clients actually read:**
Clients read the executive summary and the metrics table. They skim everything else. Design accordingly.

**Executive summary — 3-4 sentences:**
- Sentence 1: Overall status this month (better / stable / needs attention)
- Sentence 2: The biggest win
- Sentence 3: The most important issue or opportunity
- Sentence 4: What's planned next (if agency has a plan)

**Key metrics table — include these, nothing else:**
| Metric | This Month | Last Month | Change |
|---|---|---|---|
| Map Pack Position | | | ↑↓→ |
| Geographic Visibility (SoLV) | | | |
| Google Rating | | | |
| New Reviews | | | |
| AI Search Visibility | | | |

**Tone for client-facing reports:**
- Professional but not stiff
- Confident — avoid hedge language ("it seems," "possibly," "might")
- Own the wins and the issues equally
- Never blame Google, competitors, or the client
- No internal SEO jargon — write for a business owner who knows their business, not ours

**What makes a report feel premium:**
- Specific numbers with context ("12 new reviews — your best month this year")
- Named observations ("The downtown Buffalo grid improved significantly")
- Concrete next steps, not vague recommendations ("We'll add 3 secondary categories this month" not "We should look at categories")
- Clean formatting — metrics table, then findings, then next steps

**Email format:**
- Subject: {Business Name} — Local SEO Update — {Month YYYY}
- Open with the biggest win or most important news — not "I hope this email finds you well"
- 3-4 short paragraphs max
- Link to or attach the full report
- Close with one specific next step

## Verification
Before executing, confirm:
- [ ] `local-reporting` skill loaded, or Fallback Guidance read
- [ ] `client-deliverables` skill loaded, or Fallback Guidance read
- [ ] `localseodata-tool` skill loaded, or Fallback Guidance read
- [ ] Location brief exists with client email address
- [ ] Monthly output files from past 30 days exist in `reports/` and `scans/`
- [ ] LocalSEOData MCP responding
- [ ] Gmail MCP connected (required for email draft)
- [ ] `_brand.brief.md` has client_notify and reviewer configured

If Gmail MCP unavailable: generate report only, note email draft cannot be sent, alert agency via Slack.

## Prompt

```
Load skills: local-reporting, client-deliverables, localseodata-tool
If skills unavailable, read Fallback Guidance in tasks/r2-monthly-client-report/TASK.md.

Run verification checklist before proceeding.

You are generating a monthly performance report for {BUSINESS_NAME} at {LOCATION}
to be sent to {CLIENT_EMAIL}.

Read all output files from the past 30 days in briefs/{brand}/{location}/.
Read briefs/{brand}/{location}/location.brief.md for context and goals.

Pull fresh data from LocalSEOData:
- local_audit for current snapshot
- review_velocity for monthly trend
- competitor_gap vs top 3 competitors

Using local-reporting and client-deliverables skills or Fallback Guidance:
- Structure for a business owner reader
- Lead with wins, then issues, then next steps
- Metrics table with direction of change
- Client-appropriate language throughout

Generate:
1. Full report at briefs/{brand}/{location}/reports/{TODAY}-monthly.md
2. Client-facing email draft per specs/notification-format.md email format

Set Approval Required to PENDING.
Send pre-approval Slack notification per specs/notification-format.md Tier 3 format.
Do NOT send the client email until explicit approval is received.
Update location brief Session Log.
```

## Output
- `reports/{date}-monthly.md`
- Draft client email held pending approval

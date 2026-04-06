---
name: r4-quarterly-business-review
description: Comprehensive 90-day business review covering rankings, reviews, competitive position, and AI visibility. Drafted for client delivery, held for agency approval.
schedule: quarterly — 1st of Jan/Apr/Jul/Oct, 8 AM
tier: queue (tier 2)
skills: local-reporting, client-deliverables, geogrid-analysis, localseodata-tool
mcps: LocalSEOData, Local Falcon
---

# R4: Quarterly Business Review

## Skills
**Primary:** `local-reporting`, `client-deliverables`, `geogrid-analysis`, `localseodata-tool`
Load these first. If unavailable, use Fallback Guidance below.

## Fallback Guidance
Use this if skills are unavailable.

**QBR purpose:**
The quarterly review is the most important client touchpoint. It justifies the retainer, demonstrates the value of the work, and sets expectations for the next 90 days. A weak QBR loses clients. A strong QBR builds long-term relationships.

**QBR structure — what works:**
1. **90-day summary** — 3 sentences: overall trajectory, biggest win, most important challenge
2. **Performance data** — metrics with 90-day trend, not just current snapshot
3. **Wins section** — specific improvements with context for why they happened
4. **Issues section** — honest assessment with root causes, not just symptoms
5. **Competitive position** — where the business stands vs competitors now vs 90 days ago
6. **AI visibility** — where it stands in the emerging AI search landscape
7. **Next 90 days** — 3-5 specific, prioritized recommendations with expected impact

**How to frame wins without overselling:**
- Tie wins to business outcomes where possible ("Rankings improved → more visible to customers searching in the north end of your service area")
- Be specific about what changed and why it worked
- Don't overattribute — "Rankings improved this quarter" not "Our optimization drove a 28% ranking improvement"

**How to frame issues honestly:**
- Name the issue directly — don't bury it in the middle
- Explain the root cause, not just the symptom
- Always pair an issue with a remediation plan
- Frame as opportunity where genuine: "Citation inconsistencies are currently suppressing rankings — fixing these is one of the highest-ROI moves we can make next quarter"

**Competitive framing:**
- Show where the business has gained vs competitors (map pack presence, review count, etc.)
- Show where competitors are ahead and what it would take to close the gap
- Keep it factual — no speculation about what competitors are doing

**Geogrid 90-day comparison:**
- Show the grid from 90 days ago vs today side by side
- Highlight which zones improved, which declined, which are unchanged
- Lead with the trend, not the current state

## Verification
Before executing, confirm:
- [ ] All four skills loaded, or Fallback Guidance read
- [ ] Location brief exists with 90 days of output files
- [ ] Geogrid scan from ~90 days ago exists in `scans/` for comparison
- [ ] LocalSEOData MCP responding
- [ ] `_brand.brief.md` has client_notify and reviewer configured
- [ ] Client email address available in brief or brand config

If 90-day geogrid baseline is missing: note in QBR, use earliest available scan for comparison, flag gap.

## Prompt

```
Load skills: local-reporting, client-deliverables, geogrid-analysis, localseodata-tool
If skills unavailable, read Fallback Guidance in tasks/r4-quarterly-business-review/TASK.md.

Run verification checklist before proceeding.

You are generating a quarterly business review for {BUSINESS_NAME} at {LOCATION}.

Read all output files from the past 90 days in briefs/{brand}/{location}/.
Read briefs/{brand}/{location}/location.brief.md.

Pull fresh data from LocalSEOData:
- local_audit, competitor_gap, review_velocity, keyword_opportunities
- ai_visibility for AI search performance

Using geogrid-analysis skill or Fallback Guidance, compare most recent geogrid
vs geogrid from 90 days ago in scans/ — assess geographic ranking trend.

Using local-reporting and client-deliverables skills or Fallback Guidance:
- Structure for impact: summary → wins → issues → competitive → AI → next 90 days
- Frame wins with business context, issues with root causes and remediation
- Make next 90 days section specific and prioritized

Generate QBR covering:
1. 90-day performance summary
2. Wins — what improved and why
3. Issues — what needs attention and why
4. Competitive position vs 90 days ago
5. AI search visibility trend
6. Recommended priorities for next 90 days

Write to briefs/{brand}/{location}/reports/{TODAY}-qbr.md per specs/output-schema.md.
Set Approval Required to PENDING.
Send Slack approval request per specs/notification-format.md Tier 2 format.
Update location brief Session Log.
```

## Output
- `reports/{date}-qbr.md` held for approval

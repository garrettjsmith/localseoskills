---
name: r1-weekly-report
description: Weekly performance summary combining rankings, reviews, and map pack position into a single narrative report. Written for a business owner. Sends Slack notification on completion.
schedule: weekly — Monday 8 AM (after m1 and m2 have run)
tier: autonomous
skills: local-reporting, localseodata-tool
mcps: LocalSEOData
---

# R1: Weekly Performance Report

## Skills
**Primary:** `local-reporting`, `localseodata-tool`
Load these first. If unavailable, use Fallback Guidance below.

## Fallback Guidance
Use this if skills are unavailable.

**What a weekly report must communicate:**
A business owner reading this has 60 seconds. They need to know: is this week better or worse than last week, what's the one thing that needs attention, and is anything urgent. Everything else is detail.

**Required elements — every report:**
1. One-sentence status: "Rankings improved this week / Rankings held steady / Rankings declined this week"
2. Key metric changes with direction arrows: ARP, SoLV, map pack position, new reviews, current rating
3. One finding: the most important thing that happened
4. One action: the single highest-priority next step

**How to frame metrics for a business owner:**
- Never say "ARP improved from 8.2 to 7.6" — say "You're ranking higher across more of your service area this week"
- Never say "SoLV is 58%" — say "You're visible to 58% of potential customers searching in your area"
- Never say "review_velocity is 3" — say "3 new reviews this week"
- Always state direction: "up from last week," "down from last week," "steady"

**Tone:**
- Direct, confident, no hedging
- No SEO jargon without plain-language explanation
- Good news first, then issues
- Action item at the end, not buried in the middle

**What NOT to include:**
- Raw API data or numbers without context
- More than 3-4 metrics (more = noise)
- Multiple action items (pick one)
- Explanations of what ARP/SoLV mean (they don't care)

## Verification
Before executing, confirm:
- [ ] `local-reporting` skill loaded, or Fallback Guidance read
- [ ] `localseodata-tool` skill loaded, or Fallback Guidance read
- [ ] Location brief exists
- [ ] M1 geogrid output exists in `scans/` from today or this week
- [ ] M2 review output exists in `reports/` from today or this week
- [ ] LocalSEOData MCP responding

If M1 or M2 outputs are missing: note in report that some data is unavailable, generate report from available data, flag as PARTIAL status.

## Prompt

```
Load skills: local-reporting, localseodata-tool
If skills unavailable, read Fallback Guidance in tasks/r1-weekly-report/TASK.md.

Run verification checklist before proceeding.

You are generating a weekly performance report for {BUSINESS_NAME} at {LOCATION}.

Read:
- briefs/{brand}/{location}/location.brief.md for business context
- Most recent geogrid scan in briefs/{brand}/{location}/scans/
- Most recent review monitor in briefs/{brand}/{location}/reports/

Pull fresh data from LocalSEOData:
- local_pack for {PRIMARY_KEYWORD} — current map pack position
- review_velocity — this week's review count

Using local-reporting skill or Fallback Guidance, synthesize into a report
written for a business owner — no jargon, clear direction of change, one action item.

Write to briefs/{brand}/{location}/reports/{TODAY}-weekly.md per specs/output-schema.md.

Send Slack notification per specs/notification-format.md.
Update location brief Session Log.
```

## Output
- `reports/{date}-weekly.md`

---
name: p2-competitor-monitor
description: Monthly competitive landscape snapshot. Tracks map pack composition, competitor review trends, and ad activity. Flags new entrants, dropouts, and competitor optimization moves.
schedule: monthly — 1st of month
tier: autonomous
skills: local-competitor-analysis, localseodata-tool
mcps: LocalSEOData, LSA Spy (optional)
---

# P2: Competitor Market Monitor

## Skills
**Primary:** `local-competitor-analysis`, `localseodata-tool`
Load these first. If unavailable, use Fallback Guidance below.

## Fallback Guidance
Use this if skills are unavailable.

**What to watch for in competitor data:**

**Map pack composition changes:**
- New entrant to top 3 = someone optimized aggressively, find out what changed
- Competitor dropped out = opportunity to gain ground — they may have been suspended or penalized
- Same top 3 month after month = entrenched competition, will require sustained effort to displace

**Review signals to watch:**
- Competitor review count growing fast = active review generation campaign underway
- Competitor rating improving = they fixed a service or reputation issue
- Competitor rating declining = potential opportunity to highlight in marketing
- Response rate: competitors not responding to reviews = opportunity to differentiate

**Ad activity signals:**
- New competitor running ads = they're investing in growth, expect increased competition
- Competitor stopped ads = possible budget issues or strategy shift
- Ad copy themes = what they're positioning on (price, speed, guarantees)

**What competitor moves mean for the business:**
- Competitor jumped from position 5 to position 2 = they made a significant optimization — analyze their GBP for what changed (new photos, category change, review spike, website update)
- Competitor gained 20 reviews this month = they launched a review campaign — consider matching
- New competitor with 150+ reviews = established business entered the market, not a quick threat but a watch item

**How to frame findings as actionable:**
- Don't just describe what competitors are doing — say what it means and what to do
- "Competitor A added 15 reviews this month and is now at 4.6 vs our 4.1 — recommend launching a review generation campaign this quarter"
- "New competitor entered at position 4 with a strong profile — no immediate threat but worth tracking"

**Patterns worth escalating:**
- Two or more competitors suddenly improving = possible algo update benefiting a tactic we're not using
- Multiple competitors running ads simultaneously = market is heating up, consider LSA or ads
- Consistent decline of a specific competitor = potential suspension or penalty — opportunity to capture their keywords

## Verification
Before executing, confirm:
- [ ] `local-competitor-analysis` skill loaded, or Fallback Guidance read
- [ ] `localseodata-tool` skill loaded, or Fallback Guidance read
- [ ] Location brief exists
- [ ] LocalSEOData MCP responding
- [ ] Prior competitor monitor in `reports/` for comparison (if not, baseline run)

If LocalSEOData unavailable: write FAILED status, note in brief, send Slack alert.

## Prompt

```
Load skills: local-competitor-analysis, localseodata-tool
If skills unavailable, read Fallback Guidance in tasks/p2-competitor-monitor/TASK.md.

Run verification checklist before proceeding.

You are monitoring the competitive landscape for {BUSINESS_NAME} at {LOCATION}.

Read briefs/{brand}/{location}/location.brief.md for context and
last month's competitor snapshot in reports/.

Call LocalSEOData:
- local_pack for {PRIMARY_KEYWORD} — who's in the top 3?
- competitor_gap vs top 3 current map pack competitors
- google_reviews for each top competitor (last 10 reviews each)
- competitor_ads to check for ad activity

Using local-competitor-analysis skill or Fallback Guidance:
- Interpret what changes mean, not just what changed
- Flag any moves requiring a response
- Identify opportunities created by competitor weakness

Note changes from last month:
- Map pack entrants or dropouts
- Review count or rating changes
- New ad activity
- Apparent optimization moves

Write to briefs/{brand}/{location}/reports/{TODAY}-competitor-monitor.md
per specs/output-schema.md.
Send Slack notification per specs/notification-format.md.
Update location brief Session Log.
```

## Output
- `reports/{date}-competitor-monitor.md`

---
name: m4-lsa-rankings-monitor
description: Weekly LSA ranking tracking. Monitors position and ranking changes in a target LSA market. Alerts on drops out of top 3 or significant position changes. Requires LSA Spy MCP.
schedule: weekly — Monday 7 AM
tier: autonomous
skills: lsa-ads, lsa-spy-tool
mcps: LSA Spy
---

# M4: LSA Rankings Monitor

## Skills
**Primary:** `lsa-ads`, `lsa-spy-tool`
Load these first. If unavailable, use Fallback Guidance below.

## Fallback Guidance
Use this if skills are unavailable.

**How LSA rankings work:**
- LSA rankings are determined by Google's lead quality algorithm — not traditional SEO signals
- Key factors: review count and rating, responsiveness to leads, dispute rate, background check status, proximity, business hours
- Rankings fluctuate more than map pack — weekly movement is normal; multi-position drops are not

**What positions mean for lead volume:**
- Position 1-3 = in the visible set, receiving leads
- Position 4-5 = sometimes visible depending on query and device
- Position 6+ = effectively invisible for most queries
- Dropping out of top 3 = significant lead volume impact — treat as urgent

**What causes rank drops:**
- New negative review or disputed leads
- Competitor surge in reviews
- Responsiveness score degraded (missed leads, slow response time)
- Background check or license expiry
- Budget exhausted or paused
- Google recalibrating the market

**Alert thresholds — why they matter:**
- Out of top 3 = immediate revenue impact
- Drop 3+ positions = trend signal, investigate before it worsens
- New competitor in top 3 = competitive threat, identify what changed for them

## Verification
Before executing, confirm:
- [ ] `lsa-ads` skill loaded, or Fallback Guidance read
- [ ] `lsa-spy-tool` skill loaded, or Fallback Guidance read
- [ ] LSA Spy MCP responding
- [ ] Location brief exists
- [ ] Prior LSA report exists in `reports/` for comparison (if not, note as baseline)

If LSA Spy is unavailable: write FAILED status, note in brief, send Slack alert.

## Prompt

```
Load skills: lsa-ads, lsa-spy-tool
If skills unavailable, read Fallback Guidance in tasks/m4-lsa-rankings-monitor/TASK.md.

Run verification checklist before proceeding.

You are monitoring Local Services Ads rankings for {BUSINESS_NAME} in {MARKET}.

Call LSA Spy:
- get_rankings for {MARKET}
- get_ranking_changes to see movement since last week

Using lsa-ads and lsa-spy-tool skills or Fallback Guidance, interpret:
- Current position and what it means for lead volume
- Direction of change and likely cause
- Competitive context — who moved up as this business moved

Find {BUSINESS_NAME} in results. Note current rank, prior rank, and direction.

Write output to briefs/{brand}/{location}/reports/{TODAY}-lsa-monitor.md
per specs/output-schema.md.

Alert per specs/notification-format.md if:
- Dropped out of top 3
- Dropped 3+ positions week-over-week
- A new competitor entered the top 3

Update location brief Session Log.
```

## Output
- `reports/{date}-lsa-monitor.md`
- Optional alert if threshold crossed

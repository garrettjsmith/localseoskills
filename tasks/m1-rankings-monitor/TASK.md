---
name: m1-rankings-monitor
description: Weekly geogrid ranking scan. Tracks ARP, ATRP, and SoLV week-over-week. Alerts when rankings degrade. Load this task when setting up weekly ranking monitoring for a location.
schedule: weekly — Monday 7 AM
tier: autonomous
skills: geogrid-analysis, localseodata-tool
mcps: LocalSEOData
---

# M1: Weekly Rankings Monitor

## Skills
**Primary:** `geogrid-analysis`, `localseodata-tool`
Load these first. If unavailable, use Fallback Guidance below.

## Fallback Guidance
Use this if skills are unavailable.

**Core metrics:**
- **ARP (Average Rank Position)** — average ranking across all grid points. Lower is better. Under 5 = strong, 5-10 = moderate, 10+ = needs work.
- **SoLV (Share of Local Voice)** — % of grid points where business appears. 70%+ = strong, 40-70% = moderate, under 40% = weak.
- **ATRP (Average Top Rank Position)** — average of best 3 positions. If ATRP is strong but ARP is weak, business ranks well near its location but drops off at distance.

**Pattern interpretation:**
- Weak edges, strong center = proximity-dependent ranking. Fix: more citations, reviews, links from the weak area.
- Uniform weakness = GBP signal problem. Fix: category, completeness, review velocity.
- Strong one direction, weak another = competitor dominance in weak zone. Fix: target that area specifically.
- Sudden drop everywhere = algo update, GBP issue, or suspension. Check GBP status first.

**What direction of change means:**
- ARP improved + SoLV improved = optimization working, continue
- ARP stable + SoLV declining = losing peripheral grid points, early warning
- ARP degraded + SoLV stable = dropping in rank but still visible, competitor strengthening
- Both degraded = urgent — something changed, investigate GBP and recent edits

## Verification
Before executing, confirm:
- [ ] `geogrid-analysis` skill loaded, or Fallback Guidance read
- [ ] `localseodata-tool` skill loaded, or Fallback Guidance read
- [ ] Location brief exists at `briefs/{brand}/{location}/location.brief.md`
- [ ] LocalSEOData MCP responding (call `ping` endpoint)
- [ ] Prior scan exists in `scans/` for comparison (if not, note as baseline run)

If LocalSEOData is unavailable: write FAILED status to output file, note in brief Session Log, send Slack alert per `specs/notification-format.md`.

## Prompt

```
Load skills: geogrid-analysis, localseodata-tool
If skills unavailable, read Fallback Guidance in tasks/m1-rankings-monitor/TASK.md.

Run verification checklist before proceeding.

You are monitoring rankings for {BUSINESS_NAME} at {LOCATION}.

Read briefs/{brand}/{location}/location.brief.md for business context and baseline metrics.

Run a geogrid scan using LocalSEOData geogrid_scan:
- Keyword: {PRIMARY_KEYWORD}
- Grid: 7x7
- Radius: {RADIUS_MILES} miles

Interpret results using geogrid-analysis skill or Fallback Guidance:
- Calculate ARP, ATRP, SoLV
- Identify weak zones and pattern type
- Compare to most recent scan in briefs/{brand}/{location}/scans/
- Assess direction of change

Write output to briefs/{brand}/{location}/scans/{TODAY}-geogrid.md
per specs/output-schema.md. Summary must include direction of change and one action item.

If ARP degraded 2+ positions or SoLV dropped 10+ points vs last scan, write alert
to briefs/{brand}/{location}/alerts/{TODAY}-ranking-drop.md and send Slack alert
per specs/notification-format.md.

Update location brief Session Log with one line summary.
```

## Output
- `scans/{date}-geogrid.md`
- `alerts/{date}-ranking-drop.md` (only if threshold crossed)

## Alert Thresholds
Reads from `_brand.brief.md`. Defaults: ARP degrades 2+ positions, SoLV drops 10+ points.

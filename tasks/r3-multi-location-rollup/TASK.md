---
name: r3-multi-location-rollup
description: Monthly brand-level rollup across all locations. Reads from existing location briefs — no additional tool calls required. Updates the brand brief Locations table and writes a portfolio-view report.
schedule: monthly — 1st of month, 10 AM (after r2 has run for all locations)
tier: autonomous
skills: multi-location-seo, local-reporting
mcps: none (reads from existing briefs)
---

# R3: Multi-Location Rollup

## Skills
**Primary:** `multi-location-seo`, `local-reporting`
Load these first. If unavailable, use Fallback Guidance below.

## Fallback Guidance
Use this if skills are unavailable.

**What a rollup report is for:**
The rollup gives the agency or brand manager a single view across all locations — where is the portfolio healthy, where does it need attention, and are there patterns that need brand-level intervention vs location-level fixes.

**How to read across locations:**
- Sort by most critical issues first, not alphabetically
- A location with 0 critical issues and declining SoLV is more urgent than a location with 1 minor issue and stable rankings
- Cross-location patterns matter more than individual location findings — if 8 of 10 locations have citation errors, that's a brand-level problem, not 8 separate problems

**Cross-location pattern threshold:**
- Appearing in 3+ locations = systemic, needs brand-level response
- Appearing in 1-2 locations = location-specific, handle individually

**What to include in the brand-level notes:**
- Patterns: "7 of 12 locations have unanswered 1-star reviews"
- Wins: "All locations improved SoLV this month — brand-wide optimization is working"
- Risks: "3 locations showing review velocity decline — possible algorithm sensitivity"
- Opportunities: "4 locations not yet running GBP posts — quick win available"

**Metrics table format:**
| Location | ARP | SoLV | Rating | Reviews/Mo | Critical Issues | Status |
|---|---|---|---|---|---|---|
Each row gets a status: ✅ Healthy / ⚠️ Monitor / 🚨 Urgent

## Verification
Before executing, confirm:
- [ ] `multi-location-seo` skill loaded, or Fallback Guidance read
- [ ] `local-reporting` skill loaded, or Fallback Guidance read
- [ ] `_brand.brief.md` exists at `briefs/{brand}/`
- [ ] At least one location brief exists with a recent monthly report
- [ ] All location monthly reports from this period exist (note any missing)

If location reports are missing: generate rollup from available data, note which locations are missing in the report, flag as PARTIAL.

## Prompt

```
Load skills: multi-location-seo, local-reporting
If skills unavailable, read Fallback Guidance in tasks/r3-multi-location-rollup/TASK.md.

Run verification checklist before proceeding.

You are generating a brand-level rollup report for {BRAND_NAME}.

Read all location briefs under briefs/{brand}/. For each location find the
most recent monthly report.

Using multi-location-seo and local-reporting skills or Fallback Guidance:
- Identify cross-location patterns (3+ locations = systemic)
- Prioritize locations by urgency, not alphabetically
- Assign status to each location: Healthy / Monitor / Urgent
- Flag brand-level interventions vs location-specific fixes

Compile:
- Rankings table: each location, ARP, SoLV, status, direction vs last month
- Review table: each location, rating, monthly count, trend
- Issues: critical findings across all locations
- Cross-location patterns: any issue in 3+ locations

Update _brand.brief.md Locations table rows.
Write full report to briefs/{brand}/reports/{TODAY}-rollup.md per specs/output-schema.md.

Send Slack notification per specs/notification-format.md.
```

## Output
- `briefs/{brand}/reports/{date}-rollup.md`
- Updated `_brand.brief.md` Locations table

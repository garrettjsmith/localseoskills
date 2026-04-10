---
name: geogrid-analysis
description: When the user wants to analyze local ranking data using geogrid scans, interpret map pack rankings across a geographic area, or understand ARP/ATRP/SoLV metrics. Also use when the user mentions "geogrid," "rank grid," "local rank tracking," "Local Falcon," "grid scan," "map pack rankings," "ranking heatmap," or "where am I ranking." For broader local audit, see local-seo-audit. For competitor analysis, see local-competitor-analysis.
metadata:
  version: 1.1.0
  author: Garrett Smith
---

# Geogrid Analysis

> **Default data tool:** LocalSEOData (`localseodata-tool`). Use `geogrid_scan` for one-time scans (50-162 credits depending on grid size: 5x5=50, 7x7=98, 9x9=162). For trend reports, recurring campaigns, and Falcon Guard monitoring, use Local Falcon (`local-falcon-tool`).

You are an expert in local search ranking analysis using geogrid methodology. Your goal is to interpret geogrid scan data to identify ranking patterns, weaknesses, and opportunities across a business's service area.

## Initial Assessment

Before analyzing, understand:

1. **Scan Context**
   - What keyword was scanned?
   - What grid size and radius were used?
   - What platform (Google Maps, Apple Maps, AI)?
   - When was the scan run?

2. **Business Context**
   - Business type and primary services
   - Physical location (storefront vs. SAB)
   - Target service area

3. **Goals**
   - Overall visibility assessment?
   - Tracking improvement over time?
   - Identifying weak zones to improve?
   - Competitive positioning?

---

## Core Metrics

### ARP (Average Rank Position)
- Average ranking across all grid points
- Lower is better (1 = ranking #1 everywhere)
- Scale: 1-20 (20 = not found in top 20)
- **Good**: Under 5 | **OK**: 5-10 | **Needs work**: 10+

### ATRP (Average Top Rank Position)
- Average of the top 3 ranking positions in the grid
- Shows best-case performance
- If ATRP is strong but ARP is weak: business ranks well close to location but drops off at distance

### SoLV (Share of Local Voice)
- Percentage of grid points where the business appears in results
- 100% = visible everywhere in the grid
- **Strong**: 70%+ | **Moderate**: 40-70% | **Weak**: Under 40%
- The most actionable metric for client reporting

### Grid Point Rankings
- Individual rank at each coordinate in the grid
- 1-20 scale (1 = top result, 20+ = not found)
- Visualized as color-coded heatmap
- Green (1-3) → Yellow (4-7) → Orange (8-13) → Red (14-20) → Gray (not found)

---

## Grid Configuration Guidelines

### Grid Size Selection

| Business Type | Recommended Grid | Rationale |
|---------------|-----------------|-----------|
| Neighborhood business (coffee shop, salon) | 5×5 or 7×7 | Small service area |
| City-wide service (plumber, dentist) | 7×7 or 9×9 | Medium coverage |
| Regional service (HVAC, roofing) | 11×11 or 13×13 | Wide service area |
| Metro-wide (hospital system, franchise) | 13×13 or 15×15 | Maximum coverage |

### Radius Selection

| Area Type | Radius | Use Case |
|-----------|--------|----------|
| Dense urban | 1-3 miles | NYC, Chicago, SF neighborhoods |
| Suburban | 3-7 miles | Typical city business |
| Suburban-rural | 7-15 miles | Spread-out metro areas |
| Rural | 15-30+ miles | Small towns, wide service areas |

### Scan Frequency
- **Weekly**: Active optimization campaigns
- **Biweekly**: Steady-state monitoring
- **Monthly**: Maintenance tracking
- **Before/after**: Specific optimization changes

---

## Analysis Framework

### Step 0: Validate Scan Configuration

Before interpreting results, confirm the scan setup makes sense for this business. Bad configuration produces misleading data.

**Check grid size vs. business type:**
- Is a neighborhood coffee shop being scanned at 13×13 / 15 miles? Too wide — results will look terrible because they SHOULD only rank nearby.
- Is an HVAC company scanned at 5×5 / 1 mile? Too narrow — you're missing their actual service area. Even good results here don't mean much.

**Check radius vs. market density:**
- Dense urban (NYC, SF): 1-3 mile radius is appropriate even for service businesses
- Suburban: 5-10 miles typical
- Rural: 15-30 miles may be necessary
- If radius doesn't match market, note it and recommend a rescan before drawing conclusions

**Check keyword match:**
- Does the keyword match the business's GBP primary category?
- Is it a keyword real customers would search? ("hvac company" vs. "heating and cooling repair")
- Branded keywords (business name) should always rank #1 at centroid — if they don't, there's a fundamental problem

**Check scan freshness:**
- Scans older than 30 days may not reflect current state
- If major GBP changes were made since scan date, rescan before analyzing

**If configuration is wrong:** Note the issue, provide what limited insights you can, and recommend specific rescan parameters before doing deep analysis.

---

### Step 1: Overall Health Check
- Review ARP, ATRP, and SoLV as baseline metrics
- Compare to previous scans if trend data exists
- Benchmark: Is this business competitive for this keyword?

### Step 2: Geographic Pattern Analysis

**Concentric pattern** (strong center, weak edges):
- Normal for proximity-based ranking
- Business ranks well near its location
- Improvement strategy: strengthen relevance signals, build citations in weak zones

**Directional weakness** (weak in one direction):
- Competitor with strong presence in that area
- Or: business address/service area not associated with that direction
- Improvement: location pages, citations, content targeting weak direction

**Scattered pattern** (inconsistent across grid):
- Ranking volatility or algorithm fluctuation
- Multiple competitors trading positions
- Improvement: stabilize with consistent optimization

**Peripheral strength** (weak center, strong edges):
- Unusual — may indicate address or category issues
- Check for GBP location accuracy
- Verify centroid of grid matches business location

### Step 3: Competitive Landscape
- Who ranks at grid points where you don't?
- Are the same 2-3 competitors dominating?
- What are competitors doing differently? (categories, reviews, citations)

### Step 4: Keyword-Specific Insights
- Does ranking pattern differ by keyword?
- Broad keywords (e.g., "plumber") vs. specific (e.g., "tankless water heater repair")
- Category alignment: does primary category match the keyword?

---

## Interpreting Trends

### Positive Signals
- ARP decreasing over time
- SoLV increasing
- Weak zones shrinking
- Ranking stability (less volatility)

### Warning Signs
- ARP increasing without explanation
- SoLV dropping
- New competitor appearing at multiple grid points
- Rankings volatile scan-to-scan

### Common Causes of Ranking Changes
- Google algorithm update (check industry chatter)
- Competitor optimization (new reviews, posts, citations)
- GBP profile changes (category change, address update)
- Website changes (new pages, technical issues)
- Citation inconsistencies introduced
- Review velocity change (positive or negative)
- Seasonal demand shifts

---

## Actionable Recommendations by Pattern

### "I rank well nearby but drop off at distance"
1. Build citations in directories serving the weak areas
2. Create location/neighborhood landing pages
3. Get reviews mentioning the underserved areas
4. Add service areas in GBP covering those zones
5. Local content targeting those neighborhoods

### "I don't rank at all for this keyword"
1. Verify primary category matches keyword intent
2. Add the service to GBP services section
3. Create a dedicated service page on website
4. Build keyword-relevant citations
5. Get reviews mentioning this service

### "Competitor dominates my area"
1. Audit competitor's GBP (categories, reviews, photos)
2. Identify their citation sources you're missing
3. Compare review count and velocity
4. Check for keyword-stuffed business names (report if so)
5. Differentiate with services, content, and review strategy

### "Rankings are volatile"
1. Ensure NAP consistency across all citations
2. Check for duplicate GBP listings
3. Verify no unauthorized GBP edits
4. Maintain consistent posting and review response cadence
5. Avoid making multiple changes simultaneously

---

## Diagnostic Decision Trees

When scan results contradict what you'd expect from the profile, use these trees to identify root cause.

### Strong Profile + Weak Rankings
Business has good reviews (4.5+), correct categories, complete profile, but SoLV under 40%.

**Check in order:**
1. **Duplicate listings** — Search for the business name, owner name, old addresses. Duplicate listings split ranking signals. → Use `local-seo-audit` duplicate listing workflow
2. **Category mismatch** — Primary category doesn't match the scanned keyword. "Doctor" instead of "Pain management physician." Fix: change primary category to most specific match
3. **Address/pin accuracy** — GBP pin may be in wrong location, or address doesn't match Google's understanding of the service area. Verify pin placement in GBP
4. **Manual penalty/suspension history** — Check for past suspensions or guideline violations that may have lingering effects
5. **Website disconnect** — GBP links to wrong URL, or website has no local signals (no NAP, no schema, no local content). → Use `local-seo-audit` Section 2
6. **New listing** — Listings under 6 months old often rank poorly regardless of profile quality. Age is a factor — patience required
7. **Competitive density** — In saturated markets, a strong profile isn't enough. Need link building, content, and citation advantages. → Use `local-competitor-analysis`

### Good ARP + Low SoLV
Business ranks well where it appears, but doesn't appear in most grid points.

**Diagnosis:** Service area configuration issue. Business likely ranks well near its physical address but Google doesn't associate it with the broader area.
**Fix:** Add explicit service areas in GBP, build citations mentioning surrounding cities/neighborhoods, create location landing pages for each target area. → Use `local-landing-pages` and `local-citations`

### ATRP = ARP (No Proximity Advantage)
Business ranks the same everywhere in the grid — no falloff at distance, but also no boost near the location.

**Diagnosis:** Relevance problem, not proximity problem. Google doesn't strongly associate this business with the keyword at any location.
**Fix:** Primary category alignment, dedicated service page on website, reviews mentioning the service. → Use `gbp-optimization` and `review-management`

### Sudden Ranking Drop (Trend Data)
Previous scans showed strong performance, latest scan shows significant decline.

**Check in order:**
1. **GBP changes** — Any edits, especially category or address changes, in the last 2 weeks?
2. **Unauthorized edits** — Did Google or a third party suggest an edit that was accepted? Check GBP edit history
3. **New competitor** — Pull competitor report to see if a new entrant took position
4. **Algorithm update** — Check industry forums/Twitter for reported Google local update
5. **Website changes** — Did the site change CMS, lose pages, break schema, drop HTTPS?
6. **Review bombing** — Sudden negative reviews can tank rankings. Check review timeline
7. **Citation disruption** — Data aggregator update pushed wrong info. Check core citations for NAP accuracy

### One Direction Weak
Business ranks well in all directions except one quadrant of the grid.

**Diagnosis:** A strong competitor owns that geographic zone, OR the business address isn't associated with that area.
**Fix:** Identify which competitor dominates the weak zone (pull competitor report for that scan). Build citations, content, and reviews referencing the weak area. → Use `local-competitor-analysis`

---

## Multi-Scan Synthesis

Single scans give snapshots. Multiple scans give the full picture.

### Same Keyword, Different Radii
Run at 3mi, 7mi, and 15mi to see the "falloff curve." Strong at 3mi but gone at 7mi = proximity-dependent ranking. Strong at all radii = genuine authority.

### Same Location, Different Keywords
Compare SoLV across keywords. Primary service should be strongest. If a secondary keyword outranks the primary, your primary category or website emphasis may be misaligned.

### Same Keyword, Over Time (Trend Reports)
The most valuable view. Track ARP/SoLV monthly to measure optimization impact. When presenting trends:
- Correlate ranking changes with specific actions taken (and log action dates)
- Note external factors (algorithm updates, seasonal shifts, competitor moves)
- 3+ months of data needed before drawing conclusions

---

## Translating Data for Clients

The biggest gap in geogrid reporting: clients don't understand ARP, ATRP, or SoLV. Translate every metric.

### SoLV Translation
- "You're visible to **X%** of people searching for [keyword] within [radius] of your business"
- "Out of every 100 potential customers in your area searching Google Maps, **X** would see you"
- SoLV 14% → "86% of nearby customers searching for your service can't find you on Google Maps"

### ARP Translation
- "When you DO show up, you appear in position **X** on average"
- ARP 6.5 → "When customers can find you, you're typically the 6th or 7th option they see — most people only look at the top 3"

### ATRP Translation
- "In your best-performing areas, you rank **X**"
- ATRP 2 with ARP 8 → "You rank great right near your office, but that drops off fast as customers search from farther away"

### Trend Translation
- ARP moved from 8.2 to 5.1 → "Your average visibility improved by 38% — you've moved from page 2 into competitive range"
- SoLV moved from 30% to 65% → "You went from being invisible to most nearby searchers to showing up for nearly two-thirds of them"

### Framing for Impact
Always tie to business outcomes:
- "Each 10% increase in SoLV represents approximately X more people seeing your business each month"
- "Moving from position 7 to position 3 in the map pack means appearing above the fold — most searchers never scroll past the top 3"
- Use competitor names: "Right now, [Competitor] shows up at 85% of these search points. You show up at 14%."

---

## Reporting Best Practices

### Client-Facing Reports
- Lead with SoLV — easiest metric for non-SEOs to understand
- Show visual heatmap/grid image
- Compare month-over-month or campaign start vs. now
- Highlight specific improvements ("ranking moved from #12 to #4 in north Buffalo")
- Tie to business outcomes where possible

### Internal Analysis
- Track all three metrics (ARP, ATRP, SoLV)
- Log changes made between scans
- Correlate ranking changes with specific actions
- Maintain scan consistency (same grid size, radius, keyword)

---

## Multi-Keyword Analysis

When scanning multiple keywords for the same location:
- Compare SoLV across keywords to find strongest/weakest
- Primary category alignment usually explains the gap
- Create a keyword-SoLV matrix for prioritization
- Focus optimization effort on keywords with highest business value AND improvement potential

---

## Output Format

### Scan Analysis Report
- Scan parameters (keyword, grid size, radius, date)
- Key metrics: ARP, ATRP, SoLV
- Trend comparison (if historical data available)
- Geographic pattern identification
- Top competitors in weak zones
- 3-5 prioritized action items

---

## Task-Specific Questions

1. What keyword and grid settings were used?
2. Is there historical scan data to compare?
3. What's the business's physical location?
4. What are the priority service areas?
5. Are there known competitors dominating specific zones?

---

## What to Do Next

After analyzing a scan, use the Diagnostic Decision Trees above to identify root cause, then:

| What the Scan Revealed | Next Action | Skill |
|------------------------|-------------|-------|
| Profile issues (category mismatch, incomplete) | Optimize GBP profile | `gbp-optimization` |
| Weak in specific geographic zones | Build location pages + citations for those areas | `local-landing-pages`, `local-citations` |
| Competitor dominating an area | Run competitive analysis on that competitor | `local-competitor-analysis` |
| Good profile but weak everywhere | Check for duplicates, then audit full local presence | `local-seo-audit` |
| Need to track improvement over time | Set up recurring scans (same keyword, grid, radius) | Campaign via Local Falcon |
| Client needs to understand this data | Use the Translating Data for Clients section above | |

**Default next step:** Every scan should produce 3-5 specific action items. If you can't produce actions from the scan, you're missing context — run the full audit.

## Tools for This Skill

See `docs/tool-routing` to pick based on what's connected.

- **Geogrid scan** (run and retrieve ranking grids) → Local Falcon (only option)
- **SERP spot-check** (verify rankings at a specific point) → live SERP tools (multiple options)

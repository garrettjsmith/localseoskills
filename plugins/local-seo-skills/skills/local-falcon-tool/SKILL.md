---
name: local-falcon-tool
description: When the user wants to run a geogrid scan, check existing scan reports, track ranking trends over time, monitor GBP changes via Falcon Guard, or analyze reviews. Also use when the user says "run a scan," "check my rankings," "Local Falcon," "how am I ranking," "ranking heatmap," or "scan this keyword." This is the execution tool — for interpreting results, also load geogrid-analysis.
metadata:
  version: 1.0.0
  author: Garrett Smith
---

# Local Falcon Tool

> **Note:** LocalSEOData (`localseodata-tool`) now has a `geogrid_scan` endpoint for one-time ranking scans. Use LocalSEOData for quick audits and one-off scans. Local Falcon remains essential for trend reports, recurring campaigns, Falcon Guard monitoring, and AI platform scans (GAIO/ChatGPT/Gemini/Grok).

You have direct access to Local Falcon via MCP. This skill tells you WHEN to use each operation and WHAT to do with the results.

## When to Use Local Falcon vs Other Tools

| You Need | Use Local Falcon | Use Instead |
|----------|-----------------|-------------|
| Rankings across a geographic area | ✅ Geogrid scans | — |
| Rankings at one specific point | ✅ Can do it but overkill | SerpAPI for quick spot-check |
| Competitor rankings in an area | ✅ Competitor reports auto-generated | — |
| Ranking trends over time | ✅ Trend reports | — |
| GBP monitoring for changes | ✅ Falcon Guard | — |
| Review analysis with sentiment | ✅ Reviews Analysis | — |
| Keyword search volume | ❌ | Semrush, Ahrefs, DataForSEO |
| Backlink data | ❌ | Ahrefs, Semrush |
| Website traffic data | ❌ | Google Analytics |
| Technical site audit | ❌ | Screaming Frog |

## Before Running Any Scan

**Always check existing reports first.** Scans cost credits. Don't duplicate work.

```
Step 1: listAllLocalFalconLocations → Find the place ID
Step 2: listLocalFalconScanReports (filter by placeId + keyword) → Check if a recent scan exists
Step 3: Only run a NEW scan if no recent report exists or the user explicitly wants fresh data
```

## Core Workflows

### Run a New Ranking Scan

**When:** User wants to know how a business ranks for a keyword across a geographic area.

1. **Find the business:** `listAllLocalFalconLocations` — search by name or address
   - If not found: `searchForLocalFalconBusinessLocation` → `saveLocalFalconBusinessLocationToAccount`
2. **Confirm scan parameters with user:**
   - Keyword (what customers search)
   - Grid size (see grid table below)
   - Radius (see radius table below)
   - Platform: google, apple, gaio, chatgpt, gemini, grok, aimode
   - AI analysis: yes/no (Google only, recommended)
3. **Run:** `runLocalFalconScan` — returns immediately with "submitted"
4. **Poll:** `listLocalFalconScanReports` (filter by placeId) — check every 30 seconds
5. **Retrieve:** `getLocalFalconReport` with fieldmask for analysis
6. **Interpret:** Use `geogrid-analysis` skill to diagnose results

**Recommended fieldmask for analysis:**
`report_key,date,place_id,keyword,location,arp,atrp,solv,found_in,total_competitors,grid_size,radius,measurement,ai_analysis,image,heatmap`

### Check Existing Reports

**When:** User asks about current/recent rankings, or you need baseline data.

1. `listLocalFalconScanReports` with filters (placeId, keyword, date range)
2. Use fieldmask: `report_key,date,keyword,location.name,arp,atrp,solv,grid_size,platform`
3. If multiple reports exist for same keyword: `getLocalFalconTrendReport` for the trend view

### Track Ranking Trends

**When:** User wants to see if rankings are improving or declining.

1. `listLocalFalconTrendReports` (filter by placeId and keyword)
2. `getLocalFalconTrendReport` — returns historical ARP, ATRP, SoLV per scan date
3. Compare metrics across dates and correlate with optimization actions

**Key insight:** Trend reports only exist when 2+ scans have identical settings (same placeId, keyword, grid size, radius, coordinates). If settings differ between scans, no trend report is generated.

### Run a Campaign (Recurring Scans)

**When:** User wants automated regular scanning.

1. `listLocalFalconCampaignReports` — check existing campaigns first
2. `createLocalFalconCampaign` — set up keyword(s), location(s), frequency, grid size
3. Campaign runs automatically on schedule
4. `getLocalFalconCampaignReport` — retrieve aggregated results

**Campaign vs individual scans:** Campaigns consolidate data in one report. Individual scans generate separate trend/location/keyword reports. Use campaigns for ongoing monitoring, individual scans for one-off analysis.

### Competitive Analysis

**When:** User wants to know who's beating them.

1. Every scan auto-generates a competitor report
2. `getLocalFalconCompetitorReports` — list available reports
3. `getLocalFalconCompetitorReport` — top competitors with ARP, ATRP, SoLV, reviews, ratings
4. Use fieldmask: `date,keyword,grid_size,radius,businesses.*.name,businesses.*.place_id,businesses.*.arp,businesses.*.atrp,businesses.*.solv,businesses.*.reviews,businesses.*.rating`

### Monitor GBP for Changes (Falcon Guard)

**When:** User wants to protect their GBP from unauthorized edits.

1. `listLocalFalconGuardReports` — see what's currently monitored
2. `addLocationsToFalconGuard` — add locations to monitoring
3. `getLocalFalconGuardReport` — view change history and metrics (calls, clicks, directions for OAuth-connected locations)

### Review Analysis

**When:** User wants AI-powered review insights.

1. `listLocalFalconReviewsAnalysisReports` — check existing analyses
2. `getLocalFalconReviewsAnalysisReport` — full sentiment analysis, topics, competitor comparison

## Grid Size Selection

| Business Type | Grid Size | Radius | Rationale |
|---------------|-----------|--------|-----------|
| Coffee shop, salon, restaurant | 5×5 or 7×7 | 1-3 mi | Customers walk/drive short distances |
| Dentist, chiropractor, single-location medical | 7×7 or 9×9 | 3-7 mi | City-wide draw |
| HVAC, plumber, electrician | 9×9 or 11×11 | 7-15 mi | Wide service area |
| Hospital system, franchise chain | 13×13 or 15×15 | 10-20 mi | Regional coverage |
| Rural business | 7×7 or 9×9 | 15-30 mi | Large but sparse area |

**Rule of thumb:** Grid size should cover the realistic service area. Too small = misleading good results. Too big = misleading bad results.

## Credit Awareness

- Always check credits before running scans: `viewLocalFalconAccountInformation`
- Larger grids cost more credits
- Campaigns multiply: locations × keywords × frequency
- AI analysis adds cost per scan
- Never re-run a scan without checking if results already exist

## What to Do Next

| What You Got | Next Action | Skill |
|--------------|-------------|-------|
| Scan results with ARP/ATRP/SoLV | Interpret the data and diagnose issues | `geogrid-analysis` |
| Competitor report data | Analyze what competitors do differently | `local-competitor-analysis` |
| Trend showing decline | Diagnose cause using decision trees | `geogrid-analysis` diagnostic trees |
| GBP changes detected via Guard | Review and revert unauthorized edits | `gbp-optimization` |
| Review analysis results | Build review strategy from insights | `review-management` |

**Default next step:** Never return raw scan numbers to the user. Always interpret through `geogrid-analysis` first.

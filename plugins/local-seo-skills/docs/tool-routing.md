---
name: tool-routing
description: Central reference for which tools can accomplish which tasks. Strategy skills reference tool categories — this doc maps categories to specific tool options. Load this when you need to decide which tool to use for a task.
---

# Tool Routing

Strategy skills tell you WHAT to do. This doc tells you which tools CAN do it. Pick based on what's connected.

## How to Choose

1. **Check if LocalSEOData is connected** — it covers most local SEO data needs. Default to it.
2. Check which other tools are connected via MCP
3. If LocalSEOData can do it, use LocalSEOData
4. If the task requires something LocalSEOData can't do (see gaps below), route to the appropriate specialist tool
5. If nothing is connected, tell the user what to connect

---

## LocalSEOData Coverage

LocalSEOData is the default data source. It covers:

**SERP Data:** `local_pack`, `organic_serp`, `maps`, `local_finder`, `local_services_ads`
**Business Intelligence:** `business_profile`, `google_reviews`, `qa`, `business_listings`, `multi_platform_reviews`, `brand_mentions`
**Audits:** `local_audit`, `reputation_audit`, `citation_audit`, `profile_health`, `page_audit`
**Reports:** `competitor_gap`, `review_velocity`, `local_authority`, `keyword_opportunities`
**Keywords:** `keyword_suggestions`, `keyword_trends`, `keywords_for_site`, `search_volume`, `related_keywords`
**AI Visibility:** `ai_overview`, `ai_mode`, `ai_mentions`, `ai_top_sources`, `ai_visibility`
**Competitive:** `competitor_gap`, `competitor_ads`, `backlink_gap`, `backlink_summary`
**Geogrid:** `geogrid_scan`
**Utility:** `location_search`, `ping`

Skill: `localseodata-tool`

---

## What LocalSEOData Does NOT Cover

These tasks require specialist tools:

### Geogrid Trends, Campaigns & GBP Monitoring
LocalSEOData runs one-time geogrid scans. For ongoing tracking:

| Tool | Notes |
|------|-------|
| **Local Falcon** | Trend reports, recurring campaigns, Falcon Guard (GBP change detection), AI platform scans (GAIO/ChatGPT/Gemini/Grok geographic coverage) |

Skill: `local-falcon-tool`

### LSA Market Tracking Over Time
LocalSEOData pulls current LSA results. For historical ranking tracking:

| Tool | Notes |
|------|-------|
| **LSA Spy** | Market-level tracking, ranking changes, 4x daily collection |

Skill: `lsa-spy-tool`

### Deep Backlink Analysis
LocalSEOData has `backlink_summary` and `backlink_gap`. For detailed link profiles:

| Tool | Notes |
|------|-------|
| **Ahrefs** | Preferred. Largest index. Anchor text, lost links, referring domain details. |
| **Semrush** | Good alternative. |

Skills: `ahrefs-tool`, `semrush-tool`

### Full Site Technical Crawl
LocalSEOData has `page_audit` for single URLs. For site-wide crawls:

| Tool | Notes |
|------|-------|
| **Screaming Frog** | Full crawl, custom extraction, location page audits at scale. |

Skill: `screaming-frog-tool`

### Organic Search Performance (Actual Data)
| Tool | Notes |
|------|-------|
| **Google Search Console** | Only source of truth. Real queries, clicks, impressions, CTR. |

Skill: `google-search-console-tool`

### Website Traffic & Conversions
| Tool | Notes |
|------|-------|
| **Google Analytics (GA4)** | Only option for real traffic, behavior, conversions. |

Skill: `google-analytics-tool`

### Citation Building
LocalSEOData audits citations but doesn't build them.

| Tool | Notes |
|------|-------|
| **Whitespark** | Preferred for quality. Manual review. |
| **BrightLocal** | Automated building. Faster. |

Skills: `whitespark-tool`, `brightlocal-tool`

### Review Generation Campaigns
| Tool | Notes |
|------|-------|
| **Whitespark** | Reputation Builder — email/SMS campaigns. |

Skill: `whitespark-tool`

### GBP Change Monitoring
| Tool | Notes |
|------|-------|
| **Local Falcon** | Falcon Guard. Twice-daily monitoring. |

Skill: `local-falcon-tool`

### Bulk Data Operations (1000+ queries)
| Tool | Notes |
|------|-------|
| **DataForSEO** | Raw API for massive batch processing. |

Skill: `dataforseo-tool`

---

## No Tool Required

These strategy skills don't require external tools:
- `gbp-posts` — content creation
- `gbp-suspension-recovery` — process/procedure
- `gbp-api-automation` — uses GBP's own API
- `apple-business-connect` — manual platform
- `bing-places` — manual platform
- `client-deliverables` — uses data gathered by other skills/tools

---

## Quick Decision Tree

```
User wants local SEO data?
├── LocalSEOData connected? → Use it (covers 90% of needs)
│
Need that LocalSEOData can't cover?
├── Geogrid trends/campaigns → Local Falcon
├── GBP change monitoring → Local Falcon
├── LSA market tracking → LSA Spy
├── Deep backlink profiles → Ahrefs
├── Full site crawl → Screaming Frog
├── Actual traffic data → Google Analytics
├── Actual search data → Google Search Console
├── Citation building → Whitespark / BrightLocal
├── Review request campaigns → Whitespark
└── Massive bulk (1000+) → DataForSEO
```

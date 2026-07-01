---
name: localseodata-tool
description: When the user wants to pull local SEO data — SERP results, local pack rankings, business profile data, reviews, citations, audits, geogrid scans, keyword research, AI visibility, competitor analysis, or any local search intelligence. This is the DEFAULT data tool for LocalSEOSkills. Trigger on any data request before considering other tools. Also trigger on "LocalSEOData," "LSD," "run an audit," "check my rankings," "pull reviews," "citation check," "keyword opportunities," "AI visibility," or "geogrid scan."
metadata:
  version: 1.0.0
  author: Garrett Smith
---

# LocalSEOData Tool

You have direct access to LocalSEOData via MCP. This is the **default data source** for LocalSEOSkills. Check here first before routing to other tools.

**MCP Server:** `https://mcp.localseodata.com/mcp`
**Docs:** `https://localseodata.com/docs`

## When to Use LocalSEOData vs Other Tools

LocalSEOData covers most local SEO data needs in one place. Only use other tools when LocalSEOData genuinely can't do the job.

| You Need | LocalSEOData | Use Instead |
|----------|-------------|-------------|
| Local pack rankings | ✅ `local_pack` | — |
| Full SERP with all features | ✅ `organic_serp` | — |
| Google Maps results | ✅ `maps` | — |
| Local Finder results | ✅ `local_finder` | — |
| Geogrid ranking scan | ✅ `geogrid_scan` | Local Falcon for trends, campaigns, Falcon Guard |
| Business profile data | ✅ `business_profile` | REST API recommended (MCP support coming) |
| Google reviews | ✅ `google_reviews` | — |
| Multi-platform reviews | ✅ `multi_platform_reviews` | — |
| Review velocity trends | ✅ `review_velocity` | — |
| Citation audit (NAP consistency) | ✅ `citation_audit` | — |
| Full local SEO audit | ✅ `local_audit` | — |
| Reputation audit | ✅ `reputation_audit` | — |
| Profile health check | ✅ `profile_health` | REST API recommended (MCP support coming) |
| On-page SEO audit | ✅ `page_audit` | Screaming Frog for site-wide crawls |
| Competitor gap analysis | ✅ `competitor_gap` | — |
| Keyword opportunities | ✅ `keyword_opportunities` | — |
| Keyword suggestions | ✅ `keyword_suggestions` | — |
| Related keywords | ✅ `related_keywords` | — |
| Search volume data | ✅ `search_volume` | `keyword_suggestions` also includes volume |
| Keyword trends | ✅ `keyword_trends` | — |
| Keywords a site ranks for | ✅ `keywords_for_site` | — |
| Backlink summary | ✅ `backlink_summary` | Ahrefs for deep backlink analysis |
| Backlink gap analysis | ✅ `backlink_gap` | Ahrefs for detailed link profiles |
| AI Overview detection | ✅ `ai_overview` | — |
| AI Mode response | ✅ `ai_mode` | — |
| AI mentions across platforms | ✅ `ai_mentions` | — |
| AI visibility scoring | ✅ `ai_visibility` | — |
| AI top cited sources | ✅ `ai_top_sources` | — |
| AI top cited pages | ✅ `ai_top_pages` | — |
| AI keyword-level data | ✅ `ai_keyword_data` | — |
| Raw AI/LLM response for a prompt | ✅ `ai_llm_response` | — |
| AI scraper (extract from AI results) | ✅ `ai_scraper` | — |
| AI competitor comparison | ✅ `ai_compare` | — |
| Local Services Ads data | ✅ `local_services_ads` | LSA Spy for market-level tracking over time |
| Competitor ad intelligence | ✅ `competitor_ads` | — |
| Business listings by category | ✅ `business_listings` | — |
| Brand mentions | ✅ `brand_mentions` | — |
| Q&A from GBP | ✅ `qa` (or `business_qa`) | — |
| Local authority score | ✅ `local_authority` | — |
| Ranking trends over time | ❌ | Local Falcon trend reports |
| GBP change monitoring | ❌ | Local Falcon (Falcon Guard) |
| Recurring scan campaigns | ❌ | Local Falcon campaigns |
| Deep backlink analysis (anchors, lost links) | ❌ | Ahrefs |
| Full site crawl (technical SEO) | ❌ | Screaming Frog |
| Actual traffic/conversion data | ❌ | Google Analytics |
| Real click/impression data | ❌ | Google Search Console |
| LSA market tracking over time | ❌ | LSA Spy |

## Location Resolution

Many endpoints require a location string. **The required format varies by endpoint type:**

| Endpoint Group | Format | Example |
|---------------|--------|---------|
| SERP (organic_serp, local_pack, local_services_ads) | Canonical from `location_search` | `"Syracuse, NY,New York,United States"` |
| Maps, Local Finder | Canonical from `location_search` | `"Syracuse, NY,New York,United States"` |
| Business (profile, health, reviews, qa, listings) | City, ST | `"Buffalo, NY"` |
| Reviews (multi_platform, velocity, reputation_audit) | City, ST | `"Buffalo, NY"` |
| Competitor (competitor_gap, competitor_ads) | City, ST | `"Buffalo, NY"` |
| Citation audit | Full address + phone (not location param) | `address: "123 Main St, Buffalo, NY 14201"` |
| Keyword endpoints (US) | City, Full State Name | `"Syracuse, New York"` |
| Keyword endpoints (Canada) | City, Province Abbreviation | `"Port Colborne, ON"` |
| AI endpoints (keyword-data, visibility, mentions) | City, Full State Name | `"Syracuse, New York"` |
| Local audit, local authority | City, ST | `"Buffalo, NY"` |
| Geogrid scan | City, ST | `"Buffalo, NY"` |
| Business listings | City, ST | `"Buffalo, NY"` |
| Brand mentions | Business name only (no location) | `business_name: "Ace Plumbing"` |

**Note:** The API now normalizes US state and Canadian province abbreviations automatically (e.g. "NY" to "New York", "ON" to "Ontario"). Both "Buffalo, NY" and "Buffalo, New York" should work for all endpoints.

- Use `location_search` first to resolve the exact location name (free, 0 credits, **GET** not POST)
- For Maps/Local Finder: use the canonical `name` field from `location_search` exactly (commas, no spaces after commas)
- For keyword/AI endpoints: "City, State" format works (abbreviations are expanded server-side)

---

## Core Workflows

### Full Local SEO Audit (One Call)

**When:** User says "audit this business," "check my local SEO," or "what's wrong with my rankings."

**Use:** `local_audit`
```
business_name: "Ace Plumbing"
location: "Buffalo, NY"
```

Returns local pack position, organic rankings, profile completeness, review velocity, and competitors in a single call. **50 credits.**

This replaces manually combining data from 3-4 different tools.

### Geogrid Ranking Scan

**When:** User wants to see how a business ranks across a geographic area.

**Use:** `geogrid_scan`
```
business: "Ace Plumbing"
keyword: "plumber near me"
location: "Buffalo, NY"
grid_size: "7x7"    # 5x5 (default), 7x7, or 9x9
radius_miles: 3     # default 3
```

This is an async operation — the tool polls until results are ready. Returns a rank grid, average rank, and coverage stats.

**Credit costs:** 5x5 = 50 credits, 7x7 = 98 credits, 9x9 = 162 credits. (Formula: grid points × 2.)

**For interpretation:** Load the `geogrid-analysis` strategy skill.

**Limitations vs Local Falcon:**
- No trend reports (can't compare scans over time)
- No campaigns (no recurring automated scans)
- No Falcon Guard (no GBP change monitoring)
- No AI platform scans (GAIO, ChatGPT, Gemini — use `ai_visibility` endpoints instead)

Use LocalSEOData geogrid for one-time scans and audits. Use Local Falcon for ongoing monitoring.

### Business Profile Pull

**When:** Need GBP data for audit, optimization, or reporting.

**Use:** `business_profile`
```
business_name: "Ace Plumbing"
location: "Buffalo, NY"
```

Returns: name, rating, reviews, address, phone, website, hours, categories, attributes, photos count, description, verification status. **2 credits.**

**Note:** For `business_profile` and `profile_health`, use the REST API directly. MCP support for these endpoints is in progress.

### Review Intelligence

**When:** User wants review data, sentiment analysis, or velocity tracking.

**Multiple endpoints depending on need:**

| Need | Endpoint | Credits |
|------|----------|---------|
| Read recent reviews | `google_reviews` | 1 per 10 reviews |
| Reviews across platforms | `multi_platform_reviews` | 6 |
| Review velocity over time | `review_velocity` | 6 |
| Full reputation audit | `reputation_audit` | 30 |

**`review_velocity`** is the most useful for ongoing clients — shows reviews/month, rating trend, reply rate, sentiment themes.

**`reputation_audit`** is the heavy hitter — reputation score, sentiment analysis, response rate, and recommendations. Use for new client onboarding or quarterly reviews.

### Citation Audit

**When:** User wants to check NAP consistency across directories.

**Use:** `citation_audit`
```
business_name: "Ace Plumbing"
address: "123 Main St, Buffalo, NY 14201"
phone: "(716) 555-1234"
```

Checks 20 major directories (Yelp, BBB, Facebook, YellowPages, etc.). Returns consistency score and per-directory details. **50 credits.**

**Note:** Requires all three fields (name, address, phone) for NAP comparison.

### Keyword Research

**When:** User needs keyword ideas, search volumes, or competitive keyword data.

| Need | Endpoint | Credits | Notes |
|------|----------|---------|-------|
| Keyword ideas for a business | `keyword_opportunities` | 4 | Best starting point |
| Suggestions from a seed keyword | `keyword_suggestions` | 2 | — |
| Search volume for specific keywords | `search_volume` | 1 | Use `keyword_suggestions` instead (includes volume) |
| Related keywords | `related_keywords` | 2 | — |
| Keywords a domain ranks for | `keywords_for_site` | 3 | Use `keyword_suggestions` instead |
| Keyword trends over time | `keyword_trends` | 1 | — |

**Start with `keyword_opportunities`** — it finds keywords based on the business category and location, shows difficulty, current rank, and volume. Best starting point for strategy.

Use `keyword_suggestions` when the user has a specific seed keyword and wants variations.

### Competitor Analysis

**When:** User wants to understand competitive landscape.

**Use:** `competitor_gap`
```
business_name: "Ace Plumbing"
location: "Buffalo, NY"
keyword: "plumber"
competitors: 5
```

Returns ranking gaps, review count differences, and rating advantages vs competitors. **10 credits.**

**For ad intelligence:** `competitor_ads` shows Google Ads campaigns from a competitor domain. **2 credits.**

**For backlink gaps:** `backlink_gap` compares your domain against up to 5 competitors for link opportunities. **10 credits.**

### AI Visibility

**When:** User asks about AI search visibility, AI Overviews, ChatGPT mentions, or GEO.

| Need | Endpoint | Credits |
|------|----------|---------|
| Does Google show an AI Overview? | `ai_overview` | 1 |
| What does Google AI Mode say? | `ai_mode` | 2 |
| Where does AI mention this keyword? | `ai_mentions` | 5 |
| Which sites do AI models cite? | `ai_top_sources` | 5 |
| Which pages do AI models cite? | `ai_top_pages` | 5 |
| How visible is a domain across AI? | `ai_visibility` | 10 |
| Keyword-level AI data | `ai_keyword_data` | 1 |
| Raw LLM response for a prompt | `ai_llm_response` | 8 |
| Extract data from AI search results | `ai_scraper` | 3 |

**Start with `ai_overview`** to check if AIO exists for the keyword, then use `ai_visibility` for domain-level scoring across multiple keywords.

**`ai_llm_response`** lets you send a prompt directly to an LLM and see the response. Useful for checking what ChatGPT/Gemini says about a business.
```
prompt: "Best plumber in Buffalo NY"
platform: "chat_gpt"    # Options: chat_gpt, claude, gemini, perplexity
```

**`ai_keyword_data`** returns AI-specific metrics for keywords (uses `keywords` array, not singular).
```
keywords: ["plumber buffalo", "emergency plumber buffalo ny"]
location: "Buffalo, New York"
```

**`ai_compare`** compares AI visibility across domains. Requires `domains` (array of 2-5) and `keywords` (array of 1-10). May return sparse data for smaller businesses.

### SERP Data

**When:** User wants to see what Google shows for a search.

| Need | Endpoint | Credits |
|------|----------|---------|
| Full SERP (organic + local + ads + PAA + AIO) | `organic_serp` | 1 |
| Local pack only | `local_pack` | 1 |
| Google Maps results | `maps` | 1 |
| Local Finder results | `local_finder` | 1 |
| Local Services Ads | `local_services_ads` | 1 |

**`organic_serp`** is the most complete — returns everything on the page in one call.

### On-Page Audit

**When:** User wants to check a specific URL for SEO issues.

**Use:** `page_audit`
```
url: "https://aceplumbing.com/services/drain-cleaning"
```

Checks 50+ factors: title, meta, headings, images, Core Web Vitals, schema, mobile-friendliness. **4 credits.**

For site-wide crawls across many pages, use Screaming Frog instead.

### Local Authority Score

**When:** User wants a single score representing local search authority.

**Use:** `local_authority`
```
business_name: "Ace Plumbing"
location: "Buffalo, NY"
keyword: "plumber"
```

Returns 0-100 score with component breakdown (rankings, reviews, profile completeness, citations) and percentile ranking. **10 credits.**

Great for client reporting and tracking improvement over time.

---

## Credit Cost Reference

*All costs verified against source code (`credits.ts`) on Apr 10, 2026.*

| Endpoint | Credits |
|----------|---------|
| `ping` | 0 |
| `location_search` | 0 (GET) |
| `local_pack` | 1 |
| `organic_serp` | 1 |
| `local_services_ads` | 1 |
| `local_finder` | 1 |
| `maps` | 1 |
| `ai_overview` | 1 |
| `keyword_trends` | 1 |
| `qa` / `business_qa` | 1 |
| `search_volume` | 1 per 50 keywords (use `keyword_suggestions`) |
| `ai_keyword_data` | 1 per 50 keywords |
| `google_reviews` | 1 per 10 reviews |
| `business_profile` | 2 |
| `profile_health` | 2 |
| `ai_mode` | 2 |
| `keyword_suggestions` | 2 |
| `related_keywords` | 2 |
| `competitor_ads` | 2 |
| `ai_scraper` | 3 |
| `keywords_for_site` | 3 (use `keyword_suggestions`) |
| `brand_mentions` | 3 |
| `page_audit` | 4 |
| `keyword_opportunities` | 4 |
| `backlink_summary` | 5 (use Ahrefs for backlinks) |
| `ai_mentions` | 5 |
| `ai_top_sources` | 5 |
| `ai_top_pages` | 5 |
| `multi_platform_reviews` | 6 |
| `review_velocity` | 6 |
| `ai_llm_response` | 8 |
| `ai_compare` | 10 |
| `ai_visibility` | 10 |
| `backlink_gap` | 10 |
| `business_listings` | 10 per 50 results |
| `competitor_gap` | 10 |
| `local_authority` | 10 |
| `reputation_audit` | 30 |
| `citation_audit` | 50 |
| `local_audit` | 50 |
| `geogrid_scan` (5x5) | 50 |
| `geogrid_scan` (7x7) | 98 |
| `geogrid_scan` (9x9) | 162 |

---

## Endpoint Notes

| Endpoint | Note |
|----------|------|
| `search_volume` | Works via REST API. `keyword_suggestions` also returns volume data as an alternative |
| `keywords_for_site` | Works via REST API |
| `backlink_summary` | REST path is `/v1/backlinks/summary` (not `/v1/links/backlink-summary`) |
| `ai_compare` | Requires `keywords` (array), not `keyword` (string). May return sparse data for small businesses |
| `business/reviews` | Works. Also aliased as `google_reviews` |
| `citation_audit` | REST path is `/v1/audit/citation` (also `/v1/audit/citation-consistency`). Not `/v1/citations/consistency` |
| `local_audit` | Uses async job processing (submit + poll). MCP tool handles polling automatically |

**REST API vs MCP:** For business profile endpoints (`business_profile`, `profile_health`), the REST API is recommended. MCP may add an invalid `keyword` parameter to these endpoints. Composite endpoints (`local_audit`, `review_velocity`, `citation_audit`, `reputation_audit`) work via both REST and MCP.

---

## Combining Endpoints for Common Workflows

### New Client Onboarding
1. `local_audit` — overall picture (50 credits)
2. `business_profile` — GBP details (2 credits, REST API recommended)
3. `citation_audit` — NAP consistency (50 credits)
4. `review_velocity` — review health (6 credits)
5. `keyword_opportunities` — keyword strategy (4 credits)
6. `competitor_gap` — competitive landscape (10 credits)
**Total: 122 credits for a complete new client assessment.**

### Monthly Report Data Pull
1. `local_pack` for target keywords — ranking check (1 credit each)
2. `review_velocity` — monthly review trends (6 credits)
3. `local_authority` — authority score tracking (10 credits)
4. `ai_overview` for target keywords — AI visibility check (1 credit each)

### Quick Rank Check
1. `local_pack` — who's in the 3-pack (1 credit)
Done.

### Prospecting / Sales Research
1. `business_profile` — pull their GBP data (2 credits, REST API recommended)
2. `profile_health` — find gaps to pitch on (2 credits, REST API recommended)
3. `google_reviews` — review situation (1 credit)
**Total: 5 credits to build a pitch.**

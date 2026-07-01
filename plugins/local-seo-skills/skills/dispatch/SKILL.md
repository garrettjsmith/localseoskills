---
name: dispatch
description: Local SEO router for GBP, map pack, citations, reviews, local keywords, geogrids, service-area SEO, multi-location SEO, AI local search, and reporting requests. Load this FIRST for broad local SEO requests or when unsure which Local SEO Skills to activate; it maps the request to the 2-3 relevant strategy and tool skills.
metadata:
  version: 1.0.0
  author: Garrett Smith
---

# Skill Dispatch Guide

When a local SEO request comes in, match it to a pattern below. Load those skills. Don't load everything.

**Default data tool:** `localseodata-tool` — covers most data needs. Load it alongside the relevant strategy skill unless the request specifically needs a different tool.

---

## Request Patterns → Skills to Load

### "Audit my local presence" / "What's wrong with my rankings?"
1. `local-seo-audit` — the full audit framework
2. `localseodata-tool` — `local_audit` endpoint runs a comprehensive audit in one call
3. If user wants geogrid: `geogrid-analysis` — LocalSEOData has `geogrid_scan`, or use Local Falcon for trends

### "Why am I not in the map pack?"
1. `gbp-optimization` — check profile quality first (most common issue)
2. `localseodata-tool` — `local_pack` to see who IS ranking, `business_profile` for GBP data
3. If need geographic view: `geogrid-analysis` + LocalSEOData `geogrid_scan`

### "Help me get more reviews"
1. `review-management` — strategy, generation, response frameworks
2. `localseodata-tool` — `review_velocity` for trends, `google_reviews` for recent reviews, `reputation_audit` for full picture

### "Optimize my Google Business Profile"
1. `gbp-optimization` — the full GBP playbook
2. `localseodata-tool` — `business_profile` for current state, `profile_health` for gaps
3. After optimization → `geogrid-analysis` + LocalSEOData `geogrid_scan` to measure impact

### "I need local landing pages" / "Build location pages"
1. `local-landing-pages` — page strategy, content, structure
2. `local-keyword-research` — keyword targeting per page
3. `local-schema` — schema markup for each page
4. `localseodata-tool` — `keyword_opportunities` and `keyword_suggestions` for targeting

### "Fix my citations" / "NAP is inconsistent"
1. `local-citations` — audit and cleanup process
2. `localseodata-tool` — `citation_audit` checks 20 directories in one call
3. For building: check `docs/tool-routing` → Whitespark or BrightLocal

### "Run a ranking scan" / "Check my geogrid"
1. `geogrid-analysis` — interpret results
2. `localseodata-tool` — `geogrid_scan` for a one-time scan
3. If user needs trends/campaigns → `local-falcon-tool` instead
4. After scan → `gbp-optimization` or `local-seo-audit` based on findings

### "Who are my competitors?" / "Competitive analysis"
1. `local-competitor-analysis` — full competitive framework
2. `localseodata-tool` — `competitor_gap` for rankings/reviews, `backlink_gap` for links, `competitor_ads` for ad intel
3. If need geographic comparison: `geogrid-analysis` + LocalSEOData `geogrid_scan` or Local Falcon

### "I have multiple locations"
1. `multi-location-seo` — portfolio-level strategy
2. `gbp-optimization` — per-location standards
3. `local-reporting` — per-location + rollup reporting
4. `localseodata-tool` — run endpoints per location, or Local Falcon campaigns for recurring

### "Build me a report" / "Monthly reporting"
1. `local-reporting` — metrics, KPIs, report structure
2. `client-deliverables` — packaging for client consumption
3. `localseodata-tool` — `local_authority` for score, `review_velocity` for trends, `local_pack` for rankings

### "I'm a service area business"
1. `service-area-seo` — SAB-specific strategy
2. `gbp-optimization` — SAB GBP configuration
3. `local-landing-pages` — area-specific pages
4. `localseodata-tool` — `geogrid_scan` with wider radius for SABs

### "Set up Local Services Ads"
1. `lsa-ads` — LSA strategy and optimization
2. `lsa-spy-tool` — market rankings and competitive data over time
3. `localseodata-tool` — `local_services_ads` for current snapshot
4. `review-management` — reviews are the #1 LSA ranking factor

### "Check my LSA rankings"
1. `lsa-spy-tool` — pull current and historical rankings
2. `lsa-ads` — interpret and strategize
3. `localseodata-tool` — `local_services_ads` for a quick current snapshot

### "What keywords should I target?"
1. `local-keyword-research` — keyword strategy framework
2. `localseodata-tool` — `keyword_opportunities`, `keyword_suggestions`, `search_volume`, `keyword_trends`

### "Build local links"
1. `local-link-building` — link acquisition strategies
2. `localseodata-tool` — `backlink_summary` for current profile, `backlink_gap` for competitor comparison
3. For deep analysis: `ahrefs-tool` if connected

### "Set up schema markup"
1. `local-schema` — structured data implementation
2. `localseodata-tool` — `page_audit` to check if schema exists on a page

### "How do I show up in AI search?"
1. `ai-local-search` — AI visibility strategy
2. `localseodata-tool` — `ai_overview`, `ai_mode`, `ai_mentions`, `ai_visibility`, `ai_top_sources`
3. For geographic AI coverage: `local-falcon-tool` (GAIO/ChatGPT/Gemini platform scans)

### "My listing got suspended"
1. `gbp-suspension-recovery` — reinstatement process
2. `gbp-optimization` — prevent future issues

### "Create a proposal" / "Pitch a client"
1. `client-deliverables` — proposals, SOWs, reports
2. `localseodata-tool` — `business_profile` + `profile_health` + `google_reviews` for quick research (5 credits total)
3. Load relevant strategy skills based on what you're proposing

### "I want to run Google Ads"
1. `local-search-ads` — map pack ads
2. `local-ppc-ads` — geo-targeted PPC
3. `localseodata-tool` — `competitor_ads` to see what competitors run

### "Set up Apple Maps / Bing"
1. `apple-business-connect` or `bing-places`
2. `local-citations` for broader presence

---

## When to Load Docs

- Unknown term → `docs/local-seo-glossary`
- Need reasoning about WHY → `docs/how-local-search-works`
- Need to pick a tool → `docs/tool-routing`

## When NOT to Use This Guide

Single-skill requests don't need dispatch. If someone says "how do I write a GBP post" → just load `gbp-posts`.

# Local SEO Tools Registry

Index of tools used across local SEO workflows. Each tool has a full skill with decision logic, workflows, and interpretation guidance.

## Agent Integration Levels

| Level | Meaning |
|-------|---------|
| **MCP** | Direct MCP server available — agent can call tool APIs in real-time |
| **MCP Available** | Official MCP server exists — user can connect it |
| **Export** | Agent interprets exported data (CSV, JSON) |
| **Dashboard** | Human-operated tool, agent provides guidance |

---

## Tool Index

| Tool | Category | Integration | Skill |
|------|----------|-------------|-------|
| **LocalSEOData** | **Default data source** — SERP, audits, reviews, citations, keywords, AI visibility, geogrid, competitor analysis (36 endpoints) | **MCP** (connected) | `localseodata-tool` |
| Local Falcon | Geogrid trends, recurring campaigns, GBP monitoring, AI platform scans | **MCP** (connected) | `local-falcon-tool` |
| LSA Spy | LSA market-level ranking tracking and competitive intelligence | **MCP** (connected) | `lsa-spy-tool` |
| SerpAPI | Live SERP data (fallback if LocalSEOData not connected, or non-Google engines) | **MCP** (connected) | `serpapi-tool` |
| Semrush | Advanced keyword gap analysis, Keyword Magic Tool, site audit | **MCP Available** | `semrush-tool` |
| Ahrefs | Deep backlink analysis — anchor text, lost links, referring domains | **MCP Available** | `ahrefs-tool` |
| BrightLocal | Citation building/submission, review monitoring dashboards | **MCP Available** | `brightlocal-tool` |
| DataForSEO | Massive bulk operations (1000+), raw API for custom pipelines | **MCP Available** | `dataforseo-tool` |
| Google Search Console | Actual organic search performance — clicks, impressions, CTR | **MCP Available** | `google-search-console-tool` |
| Google Analytics (GA4) | Real traffic, user behavior, conversions | **MCP Available** | `google-analytics-tool` |
| Screaming Frog | Full site technical crawls, custom extraction at scale | **MCP Available** (community) | `screaming-frog-tool` |
| Whitespark | Citation building, review generation campaigns (Reputation Builder) | **Dashboard** (no MCP) | `whitespark-tool` |

---

## Default Data Source: LocalSEOData

**Integration:** MCP (connected)
**Skill:** `localseodata-tool`
**MCP Server:** `https://mcp.localseodata.com/mcp`
**Docs:** `https://localseodata.com/docs`

LocalSEOData is the default data tool for LocalSEOSkills. Check here first before routing to other tools. It covers 36 endpoints across:

- **SERP Data:** Local pack rankings, full organic SERP, Google Maps, Local Finder, Local Services Ads
- **Business Intelligence:** Complete GBP profile data, Google reviews, Q&A, business listings by category, multi-platform reviews, brand mentions
- **Audits:** Comprehensive local SEO audit (one call), reputation audit, citation audit (20 directories), profile health check, on-page SEO audit
- **Composite Reports:** Competitor gap analysis, review velocity tracking, local authority scoring (0-100), keyword opportunities
- **Keywords:** Suggestions, search volume, trends, related keywords, keywords a site ranks for
- **AI Visibility:** AI Overview detection, Google AI Mode responses, cross-platform AI mentions, domain-level AI visibility scoring, top cited sources
- **Competitive:** Competitor gap, competitor ads, backlink gap, backlink summary
- **Geogrid:** Geographic ranking scans (5x5, 7x7, 9x9)
- **Utility:** Location search (free), connectivity ping (free)

**What LocalSEOData does NOT cover:** Geogrid trend reports and recurring campaigns, GBP change monitoring, deep backlink analysis (anchor text, lost links), full site technical crawls, actual traffic/conversion data, citation building/submission, review generation campaigns, LSA historical market tracking, massive bulk operations (1000+).

---

## Specialist Tools

Use these when LocalSEOData can't cover the need.

### Local Falcon
**Integration:** MCP (connected)
**Skill:** `local-falcon-tool`
**Use for:** Geogrid trend reports (compare scans over time), recurring scan campaigns, Falcon Guard (GBP change monitoring — twice-daily checks for unauthorized edits), AI platform geographic scans (GAIO, ChatGPT, Gemini, Grok across a grid), competitor reports with auto-generated comparisons, review analysis with AI sentiment.
**Don't use for:** One-time geogrid scans (LocalSEOData is cheaper), keyword research, backlink data, website traffic data.

### LSA Spy
**Integration:** MCP (connected)
**Skill:** `lsa-spy-tool`
**Use for:** LSA market-level ranking tracking over time (4x daily collection across 173+ markets), ranking change detection (who moved up/down), market competitive landscape for LSA, historical LSA ranking data.
**Don't use for:** Current LSA snapshot (LocalSEOData `local_services_ads` is faster), non-LSA search data.

### SerpAPI
**Integration:** MCP (connected)
**Skill:** `serpapi-tool`
**Use for:** Non-Google search engines (Bing, Yahoo, Naver), fallback SERP data if LocalSEOData is not connected.
**Don't use for:** Google SERP data when LocalSEOData is connected (it covers local pack, organic SERP, maps, local finder, AI overview).

### Semrush
**Integration:** MCP Available
**Skill:** `semrush-tool`
**Use for:** Advanced keyword gap analysis (Keyword Magic Tool), combined keyword + site audit workflows, position tracking dashboards, PPC keyword research and CPC data, content optimization scoring.
**Don't use for:** Basic keyword suggestions or search volume (LocalSEOData covers this), citation auditing, geogrid scans.

### Ahrefs
**Integration:** MCP Available
**Skill:** `ahrefs-tool`
**Use for:** Deep backlink analysis — anchor text profiles, new/lost links, referring domain details, broken link building opportunities, content gap analysis (keywords competitors rank for that you don't).
**Don't use for:** Quick backlink overview (LocalSEOData `backlink_summary` covers this), keyword volume only, citation data, local pack data.

### BrightLocal
**Integration:** MCP Available
**Skill:** `brightlocal-tool`
**Use for:** Citation building and submission at scale, review monitoring dashboards with alerts, GBP post scheduling, local rank tracking dashboards.
**Don't use for:** Citation auditing (LocalSEOData `citation_audit` covers this), multi-platform review data (LocalSEOData has this), one-off business data pulls.

### DataForSEO
**Integration:** MCP Available
**Skill:** `dataforseo-tool`
**Use for:** Massive bulk operations (1000+ keywords, 500+ locations), custom pipeline builds needing raw API access, building custom dashboards or monitoring tools, programmatic data collection at scale.
**Don't use for:** Normal volume data pulls (LocalSEOData wraps DataForSEO with a simpler interface), one-off keyword checks, single SERP lookups.

### Whitespark
**Integration:** Dashboard only (no MCP)
**Skill:** `whitespark-tool`
**Use for:** Manual citation building with human review (higher accuracy), Local Citation Finder for thorough gap analysis, Reputation Builder for email/SMS review request campaigns, review monitoring.
**Don't use for:** Citation auditing (LocalSEOData `citation_audit` covers 20 directories), quick business data pulls, SERP data.

### Google Search Console
**Integration:** MCP Available
**Skill:** `google-search-console-tool`
**Use for:** Actual organic search performance — real clicks, impressions, CTR, average position (not estimates), indexing status and coverage issues, Core Web Vitals data from real users, manual actions and security issues.
**Don't use for:** Anything LocalSEOData covers — GSC is uniquely valuable because it provides real Google data that no third-party tool can replicate.

### Google Analytics (GA4)
**Integration:** MCP Available
**Skill:** `google-analytics-tool`
**Use for:** Real website traffic (sessions, users, pageviews), conversion tracking (calls, form fills, direction clicks), traffic source breakdown, geographic traffic data, user behavior flow, landing page performance.
**Don't use for:** Search rankings or SERP data, keyword research, competitor analysis.

### Screaming Frog
**Integration:** MCP Available (community)
**Skill:** `screaming-frog-tool`
**Use for:** Full site crawls for technical SEO issues (broken links, redirect chains, duplicate content), custom extraction at scale (schema presence across all location pages), log file analysis, site architecture analysis, bulk on-page audits across 100+ URLs.
**Don't use for:** Single page audits (LocalSEOData `page_audit` covers this), keyword research, ranking data, review data.

---

## Which Tool for Which Question

| User Asks | Start With | Then |
|-----------|-----------|------|
| "How am I ranking?" | `localseodata-tool` → `local_pack` or `geogrid_scan` | `geogrid-analysis` → interpret results |
| "Run a full audit" | `localseodata-tool` → `local_audit` (one call) | `local-seo-audit` → prioritize fixes |
| "What keywords should I target?" | `localseodata-tool` → `keyword_opportunities` | `local-keyword-research` → build strategy |
| "Who links to my competitors?" | `localseodata-tool` → `backlink_gap` for overview | `ahrefs-tool` → deep link profiles if needed |
| "Are my citations consistent?" | `localseodata-tool` → `citation_audit` | `local-citations` → fix issues |
| "How are my reviews?" | `localseodata-tool` → `review_velocity` | `review-management` → strategy |
| "What does my GBP look like?" | `localseodata-tool` → `business_profile` + `profile_health` | `gbp-optimization` → fix gaps |
| "How do I show up in AI search?" | `localseodata-tool` → `ai_visibility` + `ai_overview` | `ai-local-search` → strategy |
| "Who are my competitors?" | `localseodata-tool` → `competitor_gap` | `local-competitor-analysis` → full framework |
| "What traffic am I getting?" | `google-analytics-tool` → traffic data | `google-search-console-tool` → query data |
| "Is my site technically sound?" | `screaming-frog-tool` → crawl data | `local-seo-audit` → prioritize fixes |
| "Who's ranking in LSAs?" | `lsa-spy-tool` → LSA rankings over time | `lsa-ads` → optimization strategy |
| "Track my rankings over time" | `local-falcon-tool` → trend reports | `geogrid-analysis` → interpret changes |
| "Has anyone edited my GBP?" | `local-falcon-tool` → Falcon Guard | `gbp-optimization` → fix issues |
| "What shows up when you Google this?" | `localseodata-tool` → `organic_serp` | Depends on what you find |
| "I need a lot of keyword data fast" | `dataforseo-tool` → bulk operations | `local-keyword-research` → strategy |
| "Where are my competitors listed?" | `localseodata-tool` → `citation_audit` + `business_listings` | `local-citations` → build missing |
| "Create a pitch for a prospect" | `localseodata-tool` → `business_profile` + `profile_health` + `google_reviews` | `client-deliverables` → package it |

---

## Tool Overlap Guide

Some tools cover similar ground. Here's when to use which:

### Geogrid Scans
- **LocalSEOData**: One-time scans for audits and spot-checks. Cheapest option (5-18 credits).
- **Local Falcon**: Recurring campaigns, trend reports (compare scans over time), Falcon Guard monitoring. Essential for ongoing tracking.

### Keyword Research
- **LocalSEOData**: Default — keyword opportunities, suggestions, volume, trends, keywords for site. Covers 90% of needs.
- **Semrush**: Advanced — Keyword Magic Tool, keyword gap analysis, content optimization scoring. Use when LocalSEOData suggestions aren't deep enough.
- **Ahrefs**: Content gap — keywords competitors rank for that you don't. Use for link + keyword cross-referencing.
- **DataForSEO**: Bulk — 1000+ keywords at once. Pay-per-task, cheapest at scale.
- **GSC**: Reality check — actual queries you already rank for (not estimates).

### SERP Data
- **LocalSEOData**: Default — local pack, organic SERP, maps, local finder, AI overview. Covers everything.
- **SerpAPI**: Fallback — use if LocalSEOData isn't connected, or for non-Google engines (Bing, Yahoo).
- **DataForSEO**: Bulk — 100+ SERP queries at once.

### Backlink Analysis
- **LocalSEOData**: Quick overview — `backlink_summary` and `backlink_gap` for high-level comparison.
- **Ahrefs**: Deep analysis — anchor text profiles, new/lost links, referring domain details. Largest index.
- **Semrush**: Secondary — decent backlinks, better for keywords.

### Citation Management
- **LocalSEOData**: Auditing — `citation_audit` checks 20 directories for NAP consistency.
- **BrightLocal**: Building — automated citation submission at scale + review monitoring dashboards.
- **Whitespark**: Building — highest-quality managed citation building with human review.
- Best combo: LocalSEOData to audit, Whitespark or BrightLocal to build.

### Reviews
- **LocalSEOData**: Default — `google_reviews`, `review_velocity`, `multi_platform_reviews`, `reputation_audit`. Covers monitoring and analysis.
- **Whitespark**: Generation — Reputation Builder for email/SMS review request campaigns.
- **BrightLocal**: Monitoring dashboards — alerts and multi-platform tracking UI.
- **Local Falcon**: Sentiment — Reviews Analysis with AI-powered competitor comparison.

### AI Visibility
- **LocalSEOData**: Default — AI Overview detection, AI Mode responses, cross-platform AI mentions, visibility scoring.
- **Local Falcon**: Geographic — GAIO, ChatGPT, Gemini, Grok scans across a geographic grid. Shows AI visibility by location.

### Rankings
- **LocalSEOData**: One-time geogrid scan + local pack position. Best for audits and spot-checks.
- **Local Falcon**: Ongoing tracking — trends over time, recurring campaigns, competitor comparison. Best for active management.
- **Semrush**: Organic position tracking at a single point (not geographic grid).
- **SerpAPI**: Single live SERP snapshot (if LocalSEOData not connected).

### Search Performance
- **GSC**: Ground truth for organic clicks, impressions, queries.
- **GA4**: Website traffic, conversions, behavior.
- Use both together: GSC for "how do people find me" + GA4 for "what do they do after."

---

## Quick Decision Tree

```
Need local SEO data?
├── LocalSEOData connected? → Use it (covers 90% of needs)
│
Need that LocalSEOData can't cover?
├── Geogrid trends / campaigns / GBP monitoring → Local Falcon
├── LSA market tracking over time → LSA Spy
├── Deep backlink profiles (anchors, lost links) → Ahrefs
├── Advanced keyword gap analysis → Semrush
├── Full site technical crawl → Screaming Frog
├── Actual traffic / conversion data → Google Analytics
├── Actual search performance data → Google Search Console
├── Citation building / submission → Whitespark or BrightLocal
├── Review generation campaigns → Whitespark
└── Massive bulk (1000+ queries) → DataForSEO
```

---

## Tool Routing Doc

For the full routing logic with task-to-tool mapping, see [tool-routing.md](../docs/tool-routing.md).

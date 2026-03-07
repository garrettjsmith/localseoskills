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
| Local Falcon | Geogrid rankings, competitor reports, GBP monitoring | **MCP** (connected) | `local-falcon-tool` |
| LSA Spy | LSA rankings, competitive intelligence | **MCP** (connected) | `lsa-spy-tool` |
| SerpAPI | Live SERP data, local pack, PAA, AI Overviews | **MCP** (connected) | `serpapi-tool` |
| Semrush | Keyword research, competitive analysis, site audit | **MCP Available** | `semrush-tool` |
| Ahrefs | Backlink analysis, link gap, competitive links | **MCP Available** | `ahrefs-tool` |
| BrightLocal | Citation audit, citation building, review monitoring | **MCP Available** | `brightlocal-tool` |
| DataForSEO | Bulk SERP data, keyword volumes, business data | **MCP Available** | `dataforseo-tool` |
| Google Search Console | Organic search performance, indexing, CWV | **MCP Available** | `google-search-console-tool` |
| Google Analytics (GA4) | Traffic, conversions, user behavior | **MCP Available** | `google-analytics-tool` |
| Screaming Frog | Technical crawling, site audit, schema validation | **MCP Available** (community) | `screaming-frog-tool` |
| Whitespark | Citation gap analysis, managed citation building, review generation | **Dashboard** (no MCP) | `whitespark-tool` |

---

## Which Tool for Which Question

| User Asks | Start With | Then |
|-----------|-----------|------|
| "How am I ranking?" | `local-falcon-tool` → run geogrid scan | `geogrid-analysis` → interpret results |
| "What keywords should I target?" | `semrush-tool` → keyword research | `local-keyword-research` → build strategy |
| "Who links to my competitors?" | `ahrefs-tool` → link gap analysis | `local-link-building` → build links |
| "Are my citations consistent?" | `brightlocal-tool` → citation audit | `local-citations` → fix issues |
| "What traffic am I getting?" | `google-analytics-tool` → traffic data | `google-search-console-tool` → query data |
| "Is my site technically sound?" | `screaming-frog-tool` → crawl data | `local-seo-audit` → prioritize fixes |
| "Who's ranking in LSAs?" | `lsa-spy-tool` → LSA rankings | `lsa-ads` → optimization strategy |
| "What shows up when you Google this?" | `serpapi-tool` → live SERP | Depends on what you find |
| "How many leads am I getting?" | `google-analytics-tool` → conversions | Check if events are configured first |
| "I need a lot of keyword data fast" | `dataforseo-tool` → bulk operations | `local-keyword-research` → strategy |
| "Where are my competitors listed?" | `whitespark-tool` or `brightlocal-tool` → citation gap | `local-citations` → build missing |

---

## Tool Overlap Guide

Some tools cover similar ground. Here's when to use which:

### Keyword Research
- **Semrush**: Primary — best keyword tool with volume, difficulty, gap analysis
- **Ahrefs**: Secondary — good keywords but better for links
- **DataForSEO**: Use when you need 100+ keywords at once
- **SerpAPI**: Use for live SERP feature detection, not volume data
- **GSC**: Use for actual query performance (what you already rank for)

### Backlink Analysis
- **Ahrefs**: Primary — largest backlink index
- **Semrush**: Secondary — decent backlinks, better for keywords
- **DataForSEO**: Use for bulk backlink data at scale

### Citation Management
- **BrightLocal**: Primary if MCP connected — full audit + building + monitoring
- **Whitespark**: Primary for highest-quality managed citation building
- Use both together: Whitespark to build, BrightLocal to monitor

### Rankings
- **Local Falcon**: Map pack rankings across geography (geogrid)
- **Semrush**: Organic position tracking at a single point
- **BrightLocal**: Basic local rank tracking
- **SerpAPI**: Single live SERP snapshot
- **DataForSEO**: Build custom ranking tools at scale

### Search Performance
- **GSC**: Ground truth for organic clicks, impressions, queries
- **GA4**: Website traffic, conversions, behavior
- Use both together: GSC for "how do people find me" + GA4 for "what do they do after"

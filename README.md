# Local SEO Skills for Claude Code

38 open-source agent skills that turn Claude into a local SEO specialist. Built for owners, marketers, freelancers, consultants, and agencies who want to do local SEO with AI.

Built by [Garrett Smith](https://garrettsmith.com) — AI-native marketer with 20+ years in SEO as practitioner, consultant, CMO, agency owner, and entrepreneur. Skills and workflows currently support single shingle SMBs all the way up to Fortune 50s with hundreds of locations. 

## What's Inside

- **26 strategy skills** — Keyword research, audits, citations, reviews, GBP optimization, content generation, competitor analysis, AI visibility, reporting, and more
- **12 tool skills** — MCP integrations for LocalSEOData, Local Falcon, LSA Spy, SerpAPI, Semrush, Ahrefs, BrightLocal, DataForSEO, Whitespark, Google Search Console, Google Analytics, and Screaming Frog
- **3 foundational docs** — how local search works, glossary, and tool routing
- **1 dispatch guide** — routes requests to the right skill combination automatically
- **10,000+ lines of expertise** in a 175K zip

## Default Data Source: LocalSEOData

[LocalSEOData](https://localseodata.com) is the default data tool for LocalSEOSkills. It covers 36 endpoints across SERP data, business intelligence, audits, reviews, citations, keywords, AI visibility, competitor analysis, and geogrid scans — all through a single MCP connection.

Other tools (Local Falcon, Ahrefs, Semrush, etc.) are positioned as specialists for things LocalSEOData doesn't cover: geogrid trend reports, deep backlink analysis, full site crawls, and actual traffic data. They can also be used by default if they are your prefer sources or tooling.

See [tool routing](docs/tool-routing.md) for the full decision tree.

## Strategy Skills

| Skill | Description |
| --- | --- |
| [gbp-optimization](skills/gbp-optimization) | Google Business Profile setup, optimization, and map pack visibility |
| [gbp-posts](skills/gbp-posts) | GBP post strategy, templates, and scheduling |
| [gbp-suspension-recovery](skills/gbp-suspension-recovery) | GBP suspension prevention and reinstatement |
| [gbp-api-automation](skills/gbp-api-automation) | GBP API and bulk management for enterprise |
| [geogrid-analysis](skills/geogrid-analysis) | Map pack ranking analysis using geogrid scans and ARP/ATRP/SoLV |
| [local-seo-audit](skills/local-seo-audit) | Comprehensive local search presence audit |
| [local-competitor-analysis](skills/local-competitor-analysis) | Local pack competitor analysis and benchmarking |
| [local-content-briefs](skills/local-content-briefs) | Generate semantic content briefs for local SEO content |
| [local-content-strategy](skills/local-content-strategy) | Generate semantic content briefs for local SEO content |
| [local-reporting](skills/local-reporting) | Local SEO metrics, multi-location reporting, and ROI |
| [local-keyword-research](skills/local-keyword-research) | Local keyword research, geo-modified keywords, intent classification |
| [client-deliverables](skills/client-deliverables) | Audit reports, proposals, scopes of work, competitive reports |
| [local-landing-pages](skills/local-landing-pages) | Location pages, service-area pages, and local content strategy |
| [service-area-seo](skills/service-area-seo) | SEO for service-area businesses without a storefront |
| [review-management](skills/review-management) | Review generation, response strategy, and reputation |
| [local-citations](skills/local-citations) | NAP consistency, citation building, and directory management |
| [local-link-building](skills/local-link-building) | Local backlink acquisition and digital PR |
| [local-schema](skills/local-schema) | LocalBusiness structured data and location schema |
| [lsa-ads](skills/lsa-ads) | Google Local Services Ads (pay-per-lead, Google Guaranteed) |
| [local-search-ads](skills/local-search-ads) | Ads inside the Google Maps local pack |
| [local-ppc-ads](skills/local-ppc-ads) | Geographically targeted Google Ads (PPC) |
| [apple-business-connect](skills/apple-business-connect) | Apple Maps optimization and Apple Business Connect |
| [bing-places](skills/bing-places) | Bing Maps optimization and Bing Places for Business |
| [ai-local-search](skills/ai-local-search) | AI Overviews, ChatGPT, Gemini, Copilot for local |
| [multi-location-seo](skills/multi-location-seo) | Managing SEO across 10-500+ locations at scale |
| [dispatch](skills/dispatch) | Routes requests to the right skill combination |

## Tool Skills

| Skill | Tool | What It Covers |
| --- | --- | --- |
| [localseodata-tool](skills/localseodata-tool) | **LocalSEOData** | **Default data source.** 36 endpoints: SERP data, business profiles, reviews, citations, audits, keywords, AI visibility, geogrid scans, competitor analysis |
| [local-falcon-tool](skills/local-falcon-tool) | Local Falcon | Geogrid trend reports, recurring campaigns, Falcon Guard (GBP monitoring), AI platform scans |
| [lsa-spy-tool](skills/lsa-spy-tool) | LSA Spy | LSA market-level ranking tracking and competitive intelligence over time |
| [serpapi-tool](skills/serpapi-tool) | SerpAPI | Live SERP data (fallback if LocalSEOData not connected, or for non-Google engines) |
| [semrush-tool](skills/semrush-tool) | Semrush | Advanced keyword gap analysis, Keyword Magic Tool, site audit |
| [ahrefs-tool](skills/ahrefs-tool) | Ahrefs | Deep backlink analysis — anchor text, lost links, referring domain details |
| [brightlocal-tool](skills/brightlocal-tool) | BrightLocal | Citation building/submission, review monitoring dashboards |
| [dataforseo-tool](skills/dataforseo-tool) | DataForSEO | Massive bulk operations (1000+ queries), raw API for custom pipelines |
| [whitespark-tool](skills/whitespark-tool) | Whitespark | Citation building, review generation campaigns (Reputation Builder) |
| [google-search-console-tool](skills/google-search-console-tool) | Google Search Console | Actual organic search performance — clicks, impressions, CTR |
| [google-analytics-tool](skills/google-analytics-tool) | Google Analytics (GA4) | Real traffic, user behavior, conversions |
| [screaming-frog-tool](skills/screaming-frog-tool) | Screaming Frog | Full site technical crawls, custom extraction at scale |

## Foundational Docs

| Doc | Description |
| --- | --- |
| [how-local-search-works](docs/how-local-search-works.md) | The ranking model, how the map pack gets assembled, how citations/reviews/links affect rankings |
| [local-seo-glossary](docs/local-seo-glossary.md) | Every acronym and concept: ARP, ATRP, SoLV, NAP, SAB, LSA, and 80+ more |
| [tool-routing](docs/tool-routing.md) | Which tool to use for which task — LocalSEOData as default, specialists for gaps |

## Installation

### Claude.ai (Upload)

Download the .zip → Settings → Customize → Skills → Upload

### Claude Code (Clone)

```bash
git clone https://github.com/garrettjsmith/localseoskills.git ~/.claude/skills/localseoskills
```

### API (Custom Skills)

Upload via /v1/skills endpoint — see Anthropic docs for details.

## Usage

Once installed, just ask Claude about local SEO. The dispatch skill routes to the right combination:

```
"Audit this business's local presence"
→ local-seo-audit + localseodata-tool (local_audit endpoint)

"Why am I not in the map pack?"
→ gbp-optimization + localseodata-tool (local_pack, business_profile)

"Run a geogrid scan for 'plumber near me' in Buffalo"
→ geogrid-analysis + localseodata-tool (geogrid_scan)

"How do I show up in ChatGPT for local searches?"
→ ai-local-search + localseodata-tool (ai_visibility, ai_mentions)

"Are my citations consistent?"
→ local-citations + localseodata-tool (citation_audit)

"Who are my competitors and where am I losing?"
→ local-competitor-analysis + localseodata-tool (competitor_gap, backlink_gap)

"Check my LSA rankings over time"
→ lsa-spy-tool + lsa-ads

"Create a proposal for managing 25 GBP locations"
→ client-deliverables + localseodata-tool (business_profile, profile_health)
```

## Community

Join the [Discord](https://discord.com/invite/XxVjjuhn) — freelancers, consultants, and small agencies using Claude as their operating system for local SEO.

## License

[MIT](LICENSE)

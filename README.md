# Local SEO Skills — Open-Source Claude SEO Tool

38 open-source skills that turn Claude into a local SEO specialist. Connect your data tools, describe a business, and Claude audits it, monitors it, reports on it, and executes — automatically.

Built for owners, marketers, freelancers, consultants, and agencies who want AI-native local SEO without adding SaaS subscriptions.

Built by [Garrett Smith](https://garrettsmith.com) — AI-native marketer with 20+ years in SEO as practitioner, consultant, CMO, agency owner, and entrepreneur. Supports single-location SMBs through Fortune 50s with hundreds of locations.

## What's Inside

- **26 strategy skills** — Keyword research, audits, citations, reviews, GBP optimization, content generation, competitor analysis, AI visibility, reporting, and more
- **12 tool skills** — MCP integrations for LocalSEOData, Local Falcon, LSA Spy, SerpAPI, Semrush, Ahrefs, BrightLocal, DataForSEO, Whitespark, Google Search Console, Google Analytics, and Screaming Frog
- **3 foundational docs** — how local search works, glossary, and tool routing
- **1 dispatch guide** — routes requests to the right skill combination automatically
- **1 brief system** — persistent work state per business and location, compounding history over time
- **15 scheduled task templates** — monitoring, reporting, execution, and prospecting workflows that run automatically
- **10,000+ lines of expertise**

## What This Actually Is

Local SEO Skills is a Claude SEO tool built from the ground up for local search visbility. The skills are the expertise. The MCPs are the data. Scheduled tasks are the automation engine. Briefs are the memory. Claude is the software and intelligence.

With Local SEO Skills fully configured:

- Rankings are monitored weekly — you get alerted when something moves
- Reviews are monitored daily — unanswered reviews get drafted responses 
  for your approval
- GBP changes are caught immediately — unauthorized edits trigger instant 
  alerts
- Monthly reports are generated and queued for approval before going 
  to clients
- Quarterly audits run automatically — citations, content, competitive 
  position
- Every engagement builds a searchable history — ask "why did rankings 
  drop in March?" and get a real answer

No SaaS infrastructure. No servers. Runs on Anthropic's cloud with tools you already have connected.

---

## Default Data Source: LocalSEOData

[Local SEO Data](https://localseodata.com) is the default data tool for Local SEO Skills. It covers 36 endpoints across SERP data, business intelligence, audits, reviews, citations, keywords, AI visibility, competitor analysis, and geogrid scans — all through a single MCP connection.

Other tools (Local Falcon, Ahrefs, Semrush, etc.) are positioned as specialists for things LocalSEOData doesn't cover: geogrid trend reports, deep backlink analysis, full site crawls, and actual traffic data.

See [tool routing](docs/tool-routing.md) for the full decision tree.

---

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
| [local-content-strategy](skills/local-content-strategy) | Local content strategy, topic clusters, and editorial planning |
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

---

## Briefs

Briefs are persistent work state for local SEO engagements. Claude creates and maintains them automatically — one per location. When you mention a business for the first time, Claude asks 5 questions, runs an initial audit, sets up the brief, and offers to configure scheduled tasks. No manual setup required.

```
briefs/
  keystone-insurance/
    _brand.brief.md          ← config + rollup across all locations
    buffalo/
      location.brief.md      ← always current, always lean
      reports/               ← weekly, monthly, QBR
      scans/                 ← geogrid, citations, page audits
      drafts/                ← GBP posts, review responses (awaiting approval)
      alerts/                ← monitoring alerts
```

After months of scheduled tasks writing to a brief, you can ask "why did rankings drop in March?" and get a real answer from the history. No other local SEO tool does this.

Briefs are gitignored — client data never touches the repo.

See [briefs/README.md](briefs/README.md) for the full system.

---

## Scheduled Tasks

15 task templates that turn LocalSEOSkills into always-on local SEO software. Tasks run on Anthropic's cloud infrastructure — no server required, works even when your computer is off.

### Approval Tiers

| Tier | How it works | Used for |
|---|---|---|
| **Autonomous** | Runs, writes output, notifies | Monitoring, reporting, audits |
| **Queue** | Drafts, holds for approval, then executes | GBP posts, review responses, content |
| **Notify** | Confirms before AND after | Client emails, live GBP pushes |

### Tasks

| ID | Task | Schedule | Tier |
|---|---|---|---|
| M1 | Weekly Rankings Monitor | Weekly Mon 7 AM | Autonomous |
| M2 | Review Velocity Monitor | Weekly Mon 7 AM | Autonomous |
| M3 | GBP Change Monitor | Daily 8 AM | Autonomous |
| M4 | LSA Rankings Monitor | Weekly Mon 7 AM | Autonomous |
| M5 | AI Visibility Monitor | Monthly | Autonomous |
| R1 | Weekly Performance Report | Weekly Mon 8 AM | Autonomous |
| R2 | Monthly Client Report | Monthly | Notify |
| R3 | Multi-Location Rollup | Monthly | Autonomous |
| R4 | Quarterly Business Review | Quarterly | Queue |
| E1 | GBP Post Drafts | Monthly | Queue |
| E2 | Review Response Drafts | Weekly Tue 8 AM | Queue |
| E3 | Citation Audit | Quarterly | Autonomous |
| E4 | Local Page Content Audit | Quarterly | Queue |
| P1 | Prospect Audit | On demand | Autonomous |
| P2 | Competitor Market Monitor | Monthly | Autonomous |

See [tasks/](tasks/) for individual task files.

---

## Installation

### Claude Code / Cowork (recommended for full automation)

```bash
git clone https://github.com/garrettjsmith/localseoskills.git ~/.claude/skills/localseoskills
```

Connect MCP tools in Claude settings. Then just mention a business — Claude handles the rest.

### Claude.ai Browser / Desktop

Skills load account-wide via Settings → Customize → Skills.

The Skills upload expects one skill per zip. For LocalSEOSkills (38 skills), use Claude in Chrome to import all skills at once:

```
Go to github.com/garrettjsmith/localseoskills, find all the SKILL.md files,
and add them to my Claude Skills or a new Project called "Local SEO Skills".
```

Takes 60-90 seconds. One time.

For scheduled tasks, use Claude Code on the web at claude.ai/code/scheduled — available to all paid plans, runs on Anthropic's cloud without your computer.

### API (Custom Skills)

Upload via `/v1/skills` endpoint — see Anthropic docs for details.

### Other Platforms (OpenClaw, Perplexity Computer, custom agents)

Skills and briefs are platform-agnostic markdown. Any LLM can use them as context.

Scheduled tasks and MCP connections are Claude-native. For other platforms, implement the scheduling and delivery layers using your own infrastructure. The task files, output file schema, approval workflow, and notification formats in `specs/` are the portable spec.

---

## Usage

Once installed, just ask Claude about local SEO. If you mention a specific business Claude doesn't have a brief for yet, it'll ask 5 quick questions and set everything up automatically.

```
"Audit Mike's Plumbing in Buffalo"
→ Claude checks for brief → none found → runs first run setup → audits

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

"Pick up where we left off on Keystone Insurance"
→ brief → reads brief → summarizes state → asks what's next
```

---

## Community

Join the [Discord](https://discord.com/invite/XxVjjuhn) — freelancers, consultants, and small agencies using Claude as their operating system for local SEO.

## License

[MIT](LICENSE)

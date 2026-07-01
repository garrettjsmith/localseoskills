---
name: screaming-frog-tool
description: When the user wants a technical site audit, crawl data analysis, location page quality checks, duplicate content detection, schema validation at scale, or internal linking analysis. Trigger on "Screaming Frog," "site crawl," "technical audit," "crawl data," "broken links," "duplicate content," "location page audit," or when analyzing exported crawl CSV/Excel files.
metadata:
  version: 1.0.0
  author: Garrett Smith
---

# Screaming Frog Tool

Screaming Frog is a desktop crawler with community-built MCP servers available. Even without MCP, the agent can analyze exported crawl data (CSV/Excel). This is your primary technical SEO audit tool.

## When to Use Screaming Frog vs Other Tools

| You Need | Use Screaming Frog | Use Instead |
|----------|-------------------|-------------|
| Full technical site crawl | ✅ Most detailed crawler | Semrush site audit (lighter) |
| Location page quality audit at scale | ✅ Best for this | — |
| Custom data extraction (NAP, schema fields) | ✅ Unique capability | — |
| Duplicate content detection | ✅ | — |
| Internal linking analysis | ✅ | — |
| Redirect chain detection | ✅ | — |
| Schema validation per page | ✅ Custom extraction | — |
| Missing titles/metas across hundreds of pages | ✅ | — |
| Keyword rankings | ❌ | Local Falcon, Semrush |
| Backlink data | ❌ | Ahrefs |
| Search traffic data | ❌ | GSC, GA4 |
| Citation data | ❌ | BrightLocal |

## How the Agent Interacts with Screaming Frog

### With MCP Connected
The agent can trigger crawls and read results directly.

### Without MCP (More Common)
The user runs the crawl locally and exports data. The agent analyzes the exported CSV/Excel files.

**Tell the user what to export:**
1. Run the crawl in Screaming Frog
2. Export: Internal > All (CSV)
3. If needed: Bulk Export > specific reports (response codes, directives, schema, etc.)
4. Upload the CSV to the conversation

## Core Workflows

### Location Page Technical Audit

**When:** User has a multi-location site and needs to verify all location pages are technically sound.

**What to check in crawl data:**

| Check | Where to Find | What's Wrong If... |
|-------|--------------|-------------------|
| Title tags | Title 1 column | Duplicate titles across locations, missing titles, truncated titles |
| Meta descriptions | Meta Description 1 | Duplicate metas, missing metas, boilerplate metas |
| H1 tags | H1-1 column | Missing H1, duplicate H1s, H1 doesn't include service + city |
| Word count | Word Count column | Under 300 words = thin content (Google may not index) |
| Status codes | Status Code column | 404 errors, 302 redirects (should be 301), 5xx errors |
| Canonical tags | Canonical Link Element 1 | Self-referencing canonical missing, or canonical pointing to wrong page |
| Internal links in | Inlinks column | 0 or 1 internal links = orphan page |
| Schema present | Custom extraction needed | No LocalBusiness schema on location pages |
| NAP on page | Custom extraction needed | Missing or inconsistent NAP |
| Page speed | PageSpeed tab (if PSI integration enabled) | LCP > 2.5s, CLS > 0.1 |

### Custom Extraction for Local SEO

**What to tell the user to configure:**

**LocalBusiness Schema Extraction:**
- Extraction: CSS Selector or XPath
- Target: `script[type="application/ld+json"]`
- This extracts the full JSON-LD block — agent can then validate schema fields

**NAP Extraction:**
- Business name: CSS selector for the element containing business name
- Phone: CSS selector for tel: links
- Address: CSS selector for address block

**Per-page schema validation the agent should do:**
1. Is `@type` correct? (e.g., Dentist, Plumber, LocalBusiness)
2. Does `name` match GBP exactly?
3. Does `address` match GBP exactly?
4. Does `telephone` match GBP exactly?
5. Are `openingHoursSpecification` present?
6. Are `geo` coordinates present and correct?
7. Is `areaServed` present (for SABs)?

### Duplicate Content Detection

**When:** Multi-location sites often have boilerplate location pages with only the city name changed.

**What to check:**
- Near-duplicate detection (Screaming Frog has this built in)
- Word count column — if all location pages are exactly the same word count, they're probably templated
- Title tag patterns — if all titles are "[Service] in [City] | [Brand]" with identical supporting content, Google may not index them all

**What "unique enough" looks like:**
- Unique intro paragraph mentioning specific area landmarks, neighborhoods, demographics
- Unique service details relevant to that location
- Unique testimonials or case studies from that area
- Different photos per location
- Unique FAQ based on common questions from that area's customers

### Internal Linking Analysis

**When:** Location pages aren't getting organic traffic and you suspect they're orphaned or poorly linked.

**What to check:**
- **Inlinks column**: How many internal pages link to each location page
- **Crawl depth**: How many clicks from homepage to reach each location page
- **Link structure**: Are location pages linked from the main navigation, footer, or buried?

**Healthy internal linking for location pages:**
- Every location page linked from a locations index/directory page
- Location pages linked from service pages (where relevant)
- Location pages linked from each other (nearby locations)
- Crawl depth: Max 3 clicks from homepage

### Redirect Audit

**When:** User migrated sites, changed URLs, or has old location pages that redirected.

**What to check:**
- 302 redirects (should usually be 301 for permanent moves)
- Redirect chains (A → B → C → D — should be A → D)
- Redirect loops (A → B → A)
- Old location URLs that 404 instead of redirecting

## Interpreting Crawl Data for Local SEO

### Priority Issues (Fix First)

| Issue | Impact | How to Find |
|-------|--------|------------|
| Location pages returning 404 | Pages completely invisible | Status Code = 404, filter to location URLs |
| Location pages not in sitemap | Google may not discover them | Cross-reference sitemap URLs with crawled URLs |
| Location pages blocked by robots.txt | Google can't crawl them | Indexability column = "Blocked by Robots.txt" |
| Location pages with noindex | Google won't index them | Meta Robots column contains "noindex" |

### Important Issues (Fix Next)

| Issue | Impact | How to Find |
|-------|--------|------------|
| Duplicate titles across locations | Google may suppress duplicates | Title 1 column — sort and find duplicates |
| Thin content (under 300 words) | Google may not index | Word Count column < 300 |
| Missing schema | Losing structured data signals | Custom extraction shows empty |
| Orphan pages (0-1 internal links) | Low crawl priority, low authority | Inlinks column = 0 or 1 |

### Maintenance Issues (Fix When Possible)

| Issue | Impact | How to Find |
|-------|--------|------------|
| Missing meta descriptions | Lower CTR from search results | Meta Description 1 = empty |
| Images without alt text | Accessibility + minor SEO signal | Images tab, Alt Text column empty |
| Redirect chains | Wasted crawl budget, slow page loads | Redirect Chains report |

## What to Do Next

| What You Found | Next Action | Skill |
|----------------|-------------|-------|
| Location pages with thin content | Rewrite with unique, substantial content per location | `local-landing-pages` |
| Missing schema on location pages | Implement LocalBusiness schema | `local-schema` |
| Duplicate titles/metas | Rewrite with unique, keyword-targeted titles per location | `local-landing-pages` |
| Orphan location pages | Fix internal linking structure | `local-landing-pages` |
| Indexing issues (noindex, robots.txt, missing from sitemap) | Fix technical issues | `local-seo-audit` |
| NAP inconsistencies found via custom extraction | Fix on-page NAP to match GBP exactly | `gbp-optimization`, `local-citations` |
| All technical issues documented | Package into audit report for client | `client-deliverables` |

**Default next step:** Screaming Frog crawl data is a goldmine but it's raw. Always prioritize: indexing blockers → content issues → structural issues → optimization opportunities.

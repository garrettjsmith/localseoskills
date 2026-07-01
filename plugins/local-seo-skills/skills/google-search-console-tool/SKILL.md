---
name: google-search-console-tool
description: When the user wants to know what queries drive traffic to their site, which pages are indexed, click-through rates, organic search performance, or technical indexing issues. Trigger on "Search Console," "GSC," "what keywords am I getting traffic for," "what queries," "impressions," "click-through rate," "indexing issues," "is my page indexed," or "organic performance."
metadata:
  version: 1.0.0
  author: Garrett Smith
---

# Google Search Console Tool

GSC has official and community MCP servers available. When connected, use it for ground-truth organic search performance data — this is the only tool that shows ACTUAL clicks and impressions from Google.

## When to Use GSC vs Other Tools

| You Need | Use GSC | Use Instead |
|----------|--------|-------------|
| Actual clicks and impressions from Google | ✅ Only source of truth | — |
| What queries drive traffic to which pages | ✅ Only source of truth | — |
| Click-through rate per query/page | ✅ Only source of truth | — |
| Average position per query | ✅ Ground truth | Semrush/Ahrefs estimates |
| Is a specific page indexed? | ✅ | — |
| Core Web Vitals per page | ✅ | — |
| Crawl errors and issues | ✅ | Screaming Frog (more detailed) |
| Keyword search volume | ❌ No volume data | Semrush, DataForSEO |
| Competitor keyword data | ❌ Your site only | Semrush, Ahrefs |
| Backlink data | ❌ Very limited | Ahrefs |
| Local pack rankings | ❌ Organic only | Local Falcon |
| Citation data | ❌ | BrightLocal |

## Critical Distinction

GSC shows **organic search performance only** — not map pack, not LSA, not ads. A business can get zero clicks in GSC but rank #1 in the local pack (because map pack clicks don't show in GSC as organic clicks). Always pair GSC data with Local Falcon map pack data for complete visibility.

## Core Workflows

### Location Page Performance

**When:** User wants to know how their location pages perform in organic search.

**What to pull:**
1. Filter pages by URL containing "/locations/" or your location page pattern
2. Get clicks, impressions, CTR, average position per page
3. Get queries driving traffic to each location page

**How to interpret:**
- **High impressions, low clicks (low CTR)**: Title tag or meta description doesn't compel clicks — rewrite them
- **High position (>20), some impressions**: You're on page 2-3, close to breaking through — optimize content
- **Location page with zero impressions**: Page may not be indexed, or keywords don't trigger it
- **Impressions for queries you don't have a page for**: Content gap — create a page for that query

**CTR benchmarks by position (approximate):**
| Position | Expected CTR |
|----------|-------------|
| 1 | 25-35% |
| 2 | 12-18% |
| 3 | 8-12% |
| 4-5 | 5-8% |
| 6-10 | 2-5% |
| 11-20 | 0.5-2% |

If CTR is below expected for the position, the title/meta needs improvement.

### Local Keyword Discovery

**When:** User wants to find keywords they're already getting impressions for but not optimizing.

**What to pull:**
1. All queries with impressions, filtered to last 3 months
2. Sort by impressions descending
3. Look for queries containing city names, "near me," service terms

**What to look for:**
- Queries with high impressions but position 8+: Optimization targets — these have demand
- Queries with "near me" variations: Confirm GBP is optimized for these services
- Queries you rank for that you didn't expect: New keyword opportunities
- Queries with city names you don't have a page for: Location page gaps

### Index Coverage

**When:** User asks "is my page indexed?" or location pages aren't getting traffic.

**What to check:**
1. URL Inspection for specific pages — are they indexed?
2. Index coverage report — any errors affecting location pages?
3. Sitemap processing — is the sitemap submitted and processed?

**Common issues for local:**
- Location pages not in sitemap → add them
- Location pages marked "Discovered – currently not indexed" → thin content, Google didn't find them valuable enough
- Location pages blocked by robots.txt → fix robots.txt
- Location pages with "Duplicate, submitted URL not selected as canonical" → canonicalization issue between similar location pages

### Core Web Vitals

**When:** User's pages are slow or CWV failing.

**What to check:**
1. CWV report for location pages specifically
2. Which pages fail LCP, FID/INP, CLS
3. Mobile vs desktop performance

**For local:** Mobile CWV matters most — local searches are predominantly mobile. If mobile CWV fails, fix it before other optimization.

### Content Gap Identification

**When:** Looking for new content opportunities from actual search data.

**What to pull:**
1. Queries where you have impressions but no dedicated page
2. Queries with high impressions but position 15+
3. Compare queries to your existing page structure

**Example:** GSC shows 500 impressions/month for "emergency plumber Orchard Park" but you don't have a page specifically about emergency plumbing in Orchard Park → create one.

## Key Metrics and What They Mean

| Metric | What It Is | Local SEO Context |
|--------|-----------|-------------------|
| Clicks | Actual clicks from Google to your site | The number that matters — this is real traffic |
| Impressions | Times your page appeared in search results | Shows demand even if you're not getting clicks |
| CTR | Clicks ÷ Impressions | Low CTR = title/meta issue. Compare to position benchmarks |
| Average Position | Average ranking position for a query | Remember: this is organic only, not map pack |

## What to Do Next

| What You Found | Next Action | Skill |
|----------------|-------------|-------|
| Location pages with low CTR | Rewrite title tags and meta descriptions | `local-landing-pages` |
| Queries without dedicated pages | Create pages targeting those queries | `local-landing-pages` |
| Location pages not indexed | Fix technical issues (thin content, canonical, sitemap) | `local-seo-audit`, `screaming-frog-tool` |
| CWV failing on mobile | Fix page speed issues | `local-seo-audit` |
| Good organic performance, want to see map pack too | Run Local Falcon scans | `local-falcon-tool` |
| Competitor analysis needed | GSC is your-site only — use Semrush for competitor data | `semrush-tool` |
| Need this in a client report | Include GSC data in performance reports | `local-reporting` |

**Default next step:** GSC is the truth layer. Start every performance analysis with GSC data, then supplement with other tools. If GSC shows no impressions for a keyword, either the page doesn't exist, isn't indexed, or doesn't target the keyword properly.

---
name: semrush-tool
description: When the user wants keyword research with search volume, competitive keyword analysis, site audit data, position tracking, or competitor organic analysis. Trigger on "keyword research," "search volume," "keyword difficulty," "what keywords do they rank for," "site audit," "Semrush," or "competitive analysis." Use Semrush for keyword data and competitive intelligence — use Ahrefs for backlink-focused analysis.
metadata:
  version: 1.0.0
  author: Garrett Smith
---

# Semrush Tool

> **Note:** LocalSEOData (`localseodata-tool`) now covers keyword suggestions, search volume, keyword trends, and keyword opportunities. Use LocalSEOData as default. Semrush remains the stronger choice for advanced keyword gap analysis, Keyword Magic Tool, and combined keyword + site audit workflows.

Semrush has an official MCP server. When connected, use it for keyword research, competitive organic analysis, and technical site audits. This is your primary keyword intelligence tool.

## When to Use Semrush vs Other Tools

| You Need | Use Semrush | Use Instead |
|----------|------------|-------------|
| Keyword search volume for local terms | ✅ Best for this | — |
| Keyword difficulty scores | ✅ | Ahrefs (different scale, both valid) |
| What keywords a competitor ranks for | ✅ Best for this | — |
| Keyword gap (you vs competitor) | ✅ Best for this | — |
| Backlink analysis | ⚠️ Decent but not best | Ahrefs (larger index) |
| Link intersect / link gap | ⚠️ Can do it | Ahrefs (preferred for links) |
| Technical site audit | ✅ Good crawler | Screaming Frog (more detailed) |
| Position tracking by location | ✅ | Local Falcon (geogrid is better for local) |
| Citation management | ❌ | BrightLocal, Whitespark |
| Live SERP snapshot | ❌ | SerpAPI |
| Geogrid rankings | ❌ | Local Falcon |

## Core Workflows

### Local Keyword Research

**When:** User needs to find keywords to target with volume and difficulty data.

**What to pull:**
1. **Keyword Overview**: Volume, KD, CPC, SERP features for target keywords
2. **Keyword Magic Tool**: Related keywords from a seed term (e.g., "plumber buffalo" → generates hundreds of variations)
3. **Keyword Gap**: Compare user's domain vs 2-3 competitors to find keywords competitors rank for that user doesn't

**How to interpret for local:**
- Volume under 100/mo is common for local keywords — that's normal and still valuable
- KD under 40 for local service keywords is achievable
- CPC above $5 means high commercial intent — prioritize these
- Look for keyword clusters: same service, different locations (e.g., "dentist Orchard Park," "dentist Hamburg," "dentist West Seneca")

**What to do with the data:**
- Group keywords by service category
- Map keywords to existing or needed pages
- Identify gaps where competitors rank but you don't
- Feed into `local-keyword-research` skill for full keyword strategy
- Feed into `local-landing-pages` skill for page creation

### Competitor Organic Analysis

**When:** User wants to know what keywords competitors rank for or how they compare.

**What to pull:**
1. **Domain Overview**: Total organic keywords, traffic estimate, top keywords
2. **Organic Research**: All keywords a competitor ranks for with positions
3. **Keyword Gap**: Side-by-side comparison showing where competitor ranks and you don't

**What to look for:**
- Keywords where competitor ranks top 10 and you rank 11-20 (quick wins — you're close)
- Keywords where competitor ranks and you don't rank at all (content gaps)
- Keywords where you rank higher than competitor (protect these)
- Competitor's top traffic-driving keywords (understand their strategy)

### Technical Site Audit

**When:** User needs a crawl of their website for technical issues.

**What Semrush's audit catches:**
- Broken links (internal and external)
- Missing/duplicate title tags and meta descriptions
- Slow pages
- Redirect chains
- Missing schema markup
- Crawlability issues
- HTTPS issues

**For local specifically, check:**
- Location page titles: unique per location?
- Location page meta descriptions: unique per location?
- Internal linking to location pages
- Schema presence on location pages
- Canonical tags on similar location pages

**When to use Screaming Frog instead:** If you need custom extraction (NAP data, specific schema fields) or the site has 1000+ location pages, Screaming Frog gives more control.

### Position Tracking

**When:** User wants to track keyword rankings over time at a specific location.

- Set location to city/ZIP level
- Track target keywords weekly
- Compare against competitors in the same tracker

**When to use Local Falcon instead:** For local businesses, geogrid ranking (Local Falcon) is more meaningful than point-based position tracking (Semrush) because rankings vary by searcher location. Use Semrush position tracking for organic rankings, Local Falcon for map pack rankings.

## Key Data Points and What They Mean

| Metric | What It Is | What It Means for Local SEO |
|--------|-----------|---------------------------|
| Search Volume | Monthly searches | Under 100 is normal for local — still valuable if intent is high |
| Keyword Difficulty (KD) | How hard to rank organically | Under 40 = achievable for local businesses with good content |
| CPC | Cost per click in Google Ads | High CPC = high commercial intent = priority keyword |
| Competitive Density | How many advertisers bid on this keyword | High density = proven money keyword |
| SERP Features | What appears in results (local pack, ads, PAA, etc.) | Local pack present = GBP optimization matters for this keyword |
| Traffic | Estimated monthly organic visits | Relative metric — compare competitors to each other |

## What to Do Next

| What You Found | Next Action | Skill |
|----------------|-------------|-------|
| Keywords identified with volume data | Map keywords to pages and build content | `local-landing-pages` |
| Keyword gaps vs competitors | Prioritize gaps by volume × intent and create pages | `local-keyword-research` |
| Competitor ranking for keywords you're not | Analyze if it's a content gap or authority gap | `local-competitor-analysis` |
| Technical issues from site audit | Fix critical issues first (broken links, missing titles) | `local-seo-audit` |
| High-CPC keywords worth running ads for | Set up PPC campaigns | `local-ppc-ads` |
| Keywords with local pack in SERP | Optimize GBP for those keywords | `gbp-optimization` |

**Default next step:** Keyword data without a page plan is just a spreadsheet. Always map keywords → pages → publish → measure.

---
name: serpapi-tool
description: When the user wants to check live SERP results for a keyword, see what's in the local pack right now, check People Also Ask, see AI Overviews, verify SERP features, or do a quick spot-check of local search results. Trigger on "what shows up when you search," "check the SERP," "who's in the map pack," "what does the search results page look like," or "search for [keyword]."
metadata:
  version: 1.0.0
  author: Garrett Smith
---

# SerpAPI Tool

> **Note:** LocalSEOData (`localseodata-tool`) now covers live SERP data via `organic_serp`, `local_pack`, `maps`, and `local_finder` endpoints. Use LocalSEOData as default. SerpAPI remains useful if LocalSEOData is not connected, or for non-Google engines (Bing, Yahoo).

You have direct access to SerpAPI via MCP. This gives you live, real-time search results from Google, Bing, and other engines at any location.

## When to Use SerpAPI vs Other Tools

| You Need | Use SerpAPI | Use Instead |
|----------|------------|-------------|
| Live SERP snapshot right now | ✅ | — |
| What's in the local pack for a query | ✅ | Local Falcon for geographic grid coverage |
| People Also Ask questions | ✅ | — |
| AI Overview content | ✅ | Local Falcon GAIO scan for geographic coverage |
| Quick rank check at one location | ✅ | Local Falcon for systematic multi-point |
| SERP features present (ads, knowledge panel, etc.) | ✅ | — |
| Rankings across a geographic grid | ❌ Too slow point by point | Local Falcon |
| Keyword volume/difficulty | ❌ | Semrush, Ahrefs, DataForSEO |
| Historical ranking trends | ❌ Snapshot only | Local Falcon trends |

## Core Workflows

### Check Live SERP for a Local Keyword

**When:** User wants to see what Google shows right now for a search.

```json
{
  "params": {
    "q": "emergency plumber",
    "engine": "google",
    "location": "Buffalo, New York, United States"
  },
  "mode": "compact"
}
```

**What to extract from results:**
- `local_results` — the map pack (positions, business names, ratings, reviews)
- `organic_results` — organic listings below the map
- `ads` — paid ads present (indicates commercial value)
- `related_questions` — People Also Ask (content opportunity)
- `ai_overview` — AI Overview content if present
- `knowledge_graph` — knowledge panel for branded searches

### Check Google Maps Results Specifically

**When:** User wants to see local business listings specifically.

```json
{
  "params": {
    "q": "dentist",
    "engine": "google_maps",
    "location": "Orchard Park, New York"
  }
}
```

Use `google_maps` engine when you want more than the top 3 map pack — this returns the full local finder results.

### Check Local Results from a Specific Location

**When:** User wants to see results as if searching FROM a specific place.

```json
{
  "params": {
    "q": "chiropractor near me",
    "engine": "google_local",
    "location": "Amherst, New York"
  }
}
```

**Important:** Location parameter simulates searching FROM that location. "Near me" queries will show results near that location.

### Quick Competitive SERP Analysis

**When:** User wants to understand the competitive landscape for a keyword.

Run the search, then analyze:
1. **Are there ads?** → Keyword has commercial value
2. **Is there a local pack?** → Google sees local intent
3. **How many reviews do map pack businesses have?** → Review benchmark
4. **Is there an AI Overview?** → Content needs to be AI-optimizable
5. **What are the PAA questions?** → Content/FAQ opportunities
6. **Who's ranking organically?** → Directories vs. actual businesses

### Verify SERP Features for Keyword Research

**When:** Building keyword strategy and need to know which keywords trigger which features.

Run searches for each target keyword and note:
- Local pack present → prioritize GBP optimization for this keyword
- Ads present → keyword has conversion value, consider PPC
- AI Overview present → optimize content for AI citation
- Featured snippet → structured content opportunity
- PAA questions → FAQ content opportunities
- No local pack → keyword may not have local intent, reconsider targeting

## Engine Selection Guide

| Engine | When to Use |
|--------|-------------|
| `google` | Default — full SERP with all features including local pack |
| `google_maps` | Want full local/maps results beyond top 3 |
| `google_local` | Local finder results specifically |
| `google_light` | Quick check, less data, faster response |
| `google_news` | Check if keyword has news coverage |
| `google_images` | Check image results for a query |
| `bing` | Check Bing results (relevant for Copilot/AI search) |

## Interpreting Results for Local SEO

### Local Pack Analysis
- **Position 1-3**: These businesses dominate — note their review counts, ratings, categories
- **No local pack**: Google doesn't see local intent for this query — reconsider keyword strategy
- **Ads above local pack**: Competitive keyword — organic alone may not be enough

### People Also Ask (PAA)
- Each PAA question is a content opportunity
- If your target keyword generates PAAs like "How much does [service] cost in [city]?" — create content answering that
- PAA questions often become FAQ schema candidates

### AI Overview
- If present: Google is summarizing content for this query
- Note which sources are cited — those sites have the content structure Google prefers
- Your content needs to be factual, well-structured, and directly answering the query

## What to Do Next

| What You Found | Next Action | Skill |
|----------------|-------------|-------|
| Local pack shows competitors with more reviews | Build review strategy | `review-management` |
| No local pack for target keyword | This isn't a local keyword — adjust strategy | `local-keyword-research` |
| AI Overview present, user not cited | Optimize content for AI visibility | `ai-local-search` |
| PAA questions found | Create FAQ content targeting those questions | `local-landing-pages` |
| Ads present, user not running ads | Consider PPC for this keyword | `local-ppc-ads` |
| Want geographic ranking data, not just this one point | Run a proper geogrid scan | `local-falcon-tool` |
| User in map pack but wrong position | Diagnose with geogrid analysis | `geogrid-analysis` |

**Default next step:** SerpAPI gives you a snapshot. For ongoing tracking, set up Local Falcon scans. Use SerpAPI for exploration and spot-checks, Local Falcon for measurement.

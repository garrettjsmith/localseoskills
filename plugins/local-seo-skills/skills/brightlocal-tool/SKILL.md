---
name: brightlocal-tool
description: When the user wants citation audits, citation building, review monitoring across platforms, GBP audit scoring, or white-label local SEO reports. Trigger on "citation audit," "check my citations," "NAP consistency," "where am I listed," "BrightLocal," "directory listings," "review monitoring," or "client report."
metadata:
  version: 1.0.0
  author: Garrett Smith
---

# BrightLocal Tool

> **Note:** LocalSEOData (`localseodata-tool`) now covers citation audits (`citation_audit`), multi-platform reviews (`multi_platform_reviews`), and reputation auditing (`reputation_audit`). Use LocalSEOData as default for data pulls. BrightLocal remains useful for citation building/submission and review monitoring dashboards.

BrightLocal has an official MCP server. When connected, use it for citation management, review aggregation, GBP auditing, and client reporting. This is your primary citation intelligence tool.

## When to Use BrightLocal vs Other Tools

| You Need | Use BrightLocal | Use Instead |
|----------|----------------|-------------|
| Citation audit (where is this business listed?) | ✅ Best for this | — |
| NAP consistency check across directories | ✅ Best for this | — |
| Citation building (submit to directories) | ✅ Managed service | Whitespark (alternative) |
| Review monitoring across multiple platforms | ✅ | — |
| GBP profile audit/scoring | ✅ | — |
| White-label client reports | ✅ | — |
| Keyword search volume | ❌ | Semrush, Ahrefs |
| Backlink analysis | ❌ | Ahrefs |
| Geogrid rankings | ❌ | Local Falcon |
| Live SERP data | ❌ | SerpAPI |
| Technical site audit | ❌ | Screaming Frog |

## Core Workflows

### Citation Audit

**When:** User asks "where am I listed?" or "are my citations consistent?" or this is part of a local SEO audit.

**What to pull:**
1. **Citation Tracker**: All found citations for the business
2. **Accuracy scores**: NAP match percentage per directory
3. **Directory coverage**: Which directories have listings vs which don't
4. **Duplicate detection**: Multiple listings on the same directory

**How to interpret:**
- Accuracy score above 90%: Good — minor fixes needed
- Accuracy score 70-90%: Moderate issues — old phone numbers, address variations
- Accuracy score below 70%: Serious problems — inconsistent data confusing Google
- Missing from major directories (Google, Yelp, Facebook, Apple Maps, Bing): Critical gaps
- Duplicates on same directory: Splitting ranking signals — need to merge or remove

**Priority directories to check:**
1. Google Business Profile (the #1 citation)
2. Apple Maps / Apple Business Connect
3. Bing Places
4. Yelp
5. Facebook
6. Industry-specific directories (Healthgrades, Avvo, Angi, etc.)
7. Data aggregators (Data Axle, Neustar/Localeze, Foursquare)

### Citation Building

**When:** Audit reveals missing directories or user needs new citations built.

BrightLocal offers managed citation building — they submit to directories on your behalf.

**What to specify:**
- Business NAP (must be exactly consistent with GBP)
- Categories
- Description
- Photos
- Target directories (or let BrightLocal recommend based on industry)

**Timeline:** Most submissions process in 2-4 weeks. Some directories take longer.

**After building:** Re-audit in 6-8 weeks to verify submissions were accepted and data is accurate.

### Review Monitoring

**When:** User wants to track reviews across Google, Yelp, Facebook, and industry platforms.

**What to pull:**
1. **Review feed**: All reviews across connected platforms
2. **Review count and rating per platform**
3. **New review alerts**: Recent reviews needing responses
4. **Sentiment trends**: Rating direction over time

**What to look for:**
- Platforms where reviews are accumulating but no one is responding
- Rating discrepancies between platforms (4.8 on Google but 3.2 on Yelp — investigate)
- Review velocity compared to competitors
- Negative review patterns (recurring complaints = operational issue)

### GBP Audit

**When:** Need a quick health check on the Google Business Profile.

**What BrightLocal checks:**
- Profile completeness (photos, description, hours, categories, attributes)
- NAP consistency with website and citations
- Review response rate
- Post activity
- Category accuracy

**Scoring:** BrightLocal generates an audit score. Use this as a starting point, then apply `gbp-optimization` skill for the detailed playbook.

### Client Reporting

**When:** Need to generate a client-facing report.

**What to include:**
- Citation health score and changes
- Review summary (count, rating, new reviews)
- GBP audit score
- Ranking data (if using BrightLocal's rank tracker)

**Note:** BrightLocal reports are white-labelable. For agencies, brand them before sending.

## Interpreting Citation Data

### NAP Consistency Scoring

| Score | Status | Action |
|-------|--------|--------|
| 95-100% | Excellent | Monitor quarterly |
| 85-94% | Good | Fix remaining inconsistencies |
| 70-84% | Needs work | Prioritize top directories, fix data aggregators |
| Below 70% | Critical | Full citation cleanup needed before other optimization |

### Common Citation Issues

| Issue | What Causes It | How to Fix |
|-------|---------------|-----------|
| Old phone number | Business changed numbers, aggregators have old data | Update aggregators first (Data Axle, Neustar, Foursquare), then individual directories |
| Old address | Business moved, aggregators propagated old address | Same — fix at aggregator level |
| Name variations | "Smith Plumbing" vs "Smith Plumbing LLC" vs "Smith's Plumbing" | Standardize to match GBP exactly |
| Duplicate listings | Multiple submissions over time, or auto-generated listings | Claim and merge or request removal |
| Wrong category | Directory auto-assigned category | Manually update on each directory |

### Aggregator Priority

Fix data aggregators FIRST — they feed data to hundreds of downstream directories:
1. **Data Axle** (formerly Infogroup) — feeds the most directories
2. **Neustar/Localeze** — second-largest aggregator
3. **Foursquare** — feeds Apple Maps and many apps
4. **Yelp** — both a directory and a data source for Apple Maps

## What to Do Next

| What You Found | Next Action | Skill |
|----------------|-------------|-------|
| NAP inconsistencies across directories | Fix aggregators first, then individual directories | `local-citations` |
| Missing from key directories | Build citations on missing directories | `local-citations` |
| Low review count on Google | Build review generation strategy | `review-management` |
| GBP audit shows incomplete profile | Optimize the profile | `gbp-optimization` |
| Citations clean but still not ranking | Citations aren't the issue — check other factors | `geogrid-analysis`, `local-seo-audit` |
| Need to present findings to client | Package citation report with recommendations | `client-deliverables` |

**Default next step:** Citation cleanup is a slow process (4-8 weeks for aggregator changes to propagate). Start the cleanup, then work on other optimization while waiting.

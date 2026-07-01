---
name: multi-location-seo
description: When the user manages SEO across multiple business locations (10-500+). Also use when the user mentions "multi-location," "franchise SEO," "enterprise local SEO," "managing multiple GBPs," "chain store SEO," "location at scale," or "bulk GBP management." For single-location GBP work, see gbp-optimization. For location pages, see local-landing-pages.
metadata:
  version: 1.0.0
  author: Garrett Smith
---

# Multi-Location SEO

> **Default data tool:** LocalSEOData (`localseodata-tool`). Run endpoints per location for audits, rankings, and reviews. For recurring multi-location scanning, use Local Falcon campaigns.

You are an expert in managing local SEO at scale across multiple business locations. Your goal is to create systems and processes that maintain quality across 10-500+ locations while identifying location-specific opportunities.

## Initial Assessment

1. **Scale**: How many locations? Geographic spread?
2. **Structure**: Corporate-owned, franchise, dealer/affiliate?
3. **Current state**: Are all GBPs claimed? Who has access?
4. **Resources**: Centralized marketing team vs. local managers?
5. **Tech stack**: GBP management tools, CMS, citation management?

---

## Management Framework

### Tier 1: Foundation (All Locations)
Applied uniformly via bulk operations:
- GBP claimed and verified for every location
- Accurate NAP across all profiles
- Consistent primary and secondary categories
- Standardized business descriptions (with local variables)
- Core citation submissions for all locations
- LocalBusiness schema on every location page
- Review response SOP distributed

### Tier 2: Optimization (Priority Locations)
Applied to top-revenue or highest-opportunity locations:
- Custom photo sets per location
- Location-specific GBP posts
- Targeted review generation campaigns
- Local link building
- Local content creation
- Geogrid scan monitoring

### Tier 3: Advanced (Competitive Markets)
For locations in saturated or strategic markets:
- Competitor analysis per market
- Custom landing pages with unique content
- Market-specific citation strategy
- Local PR and sponsorships
- Weekly geogrid tracking

---

## Bulk GBP Management

### Access Structure
- Use organization-level access in GBP (not individual Gmail accounts)
- Assign roles: Owner (corporate), Manager (regional), Communications Manager (local)
- Maintain a master access spreadsheet
- Audit access quarterly

### Bulk Operations
- **Bulk updates**: Hours, descriptions, attributes via GBP bulk upload
- **Bulk photos**: Standard brand photos deployed across locations
- **Bulk posts**: Template posts with location variables
- **Bulk verification**: Request bulk verification for 10+ locations

### Data Hygiene
- Master location database: single source of truth for NAP + coordinates
- Validate against USPS/postal database
- Monthly automated checks for unauthorized GBP edits
- Duplicate listing detection and resolution

---

## Location Page Strategy at Scale

### URL Structure Options
```
/locations/state/city/          (geo hierarchy)
/locations/location-name/       (flat structure)
/city-st/                       (simple, short)
```

### Scaling Unique Content
For 10-50 locations: hand-written unique content per page.
For 50-200: template + required unique sections (local team, local reviews, area info).
For 200+: programmatic with data-driven unique content blocks.

### Minimum Content Requirements Per Page
- Location-specific H1 and title tag
- 300+ words of unique copy
- Location-specific team or staff info
- Embedded Google Map
- Location-specific reviews/testimonials
- Local schema markup
- Unique photos of that location

---

## Reporting at Scale

### KPIs Per Location
- GBP impressions (Maps + Search)
- GBP actions (calls, directions, website clicks)
- Review count and rating
- SoLV for priority keywords (via geogrid)
- Organic traffic to location page

### Aggregated KPIs
- Average SoLV across all locations
- Locations above/below target review count
- Citation accuracy percentage
- Location page traffic trends
- Year-over-year improvement per location

### Segmentation
Group locations by:
- Performance tier (top/middle/bottom third)
- Market competitiveness
- Location type (urban, suburban, rural)
- Revenue or priority level

---

## Common Multi-Location Issues

- **Inconsistent branding**: Each location doing their own thing
- **Orphan GBPs**: Unverified or abandoned profiles
- **Duplicate listings**: Multiple GBPs for the same location
- **Employee turnover**: Local managers losing GBP access
- **NAP drift**: Addresses and phones changing without updating citations
- **Review neglect**: Some locations responding, others ignoring
- **Cannibalization**: Location pages competing with each other

---

## Task-Specific Questions

1. How many locations and in which markets?
2. Corporate-owned or franchise model?
3. Who currently manages GBPs?
4. Is there a master location data spreadsheet?
5. What's the current state of location pages on the website?

---

## What to Do Next

| What You Found | Next Action | Skill |
|----------------|-------------|-------|
| Individual locations need GBP optimization | Apply optimization standards per-location | `gbp-optimization` |
| Need location pages on the website | Build unique pages per location | `local-landing-pages` |
| Need to measure rankings per location | Run geogrid scans per location for priority keywords | `geogrid-analysis` |
| Citation inconsistencies across locations | Clean up citations per-location — aggregators may have old data | `local-citations` |
| Review counts vary wildly by location | Build per-location review generation plans | `review-management` |
| Need to manage at scale via API | Set up GBP API for bulk operations | `gbp-api-automation` |

**Default next step:** For multi-location, start by auditing the worst-performing locations (lowest review count, incomplete profiles). Fixing the bottom performers yields the biggest portfolio-level improvement.

## Tools for This Skill

See `docs/tool-routing` to pick based on what's connected.

- **Geogrid scans** (per-location ranking measurement) → Local Falcon (only option — use campaigns for recurring multi-location scans)
- **Citation audit** (per-location NAP accuracy) → citation tools (multiple options)
- **Review monitoring** (per-location review tracking) → review monitoring tools (multiple options)
- **Technical audit** (location page quality at scale) → technical audit tools (multiple options)
- **Keyword data** (per-location keyword targeting) → keyword research tools (multiple options)
- **Bulk operations** (100+ locations/keywords) → bulk data tools for scale

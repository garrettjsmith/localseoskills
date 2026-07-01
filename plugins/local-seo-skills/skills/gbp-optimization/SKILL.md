---
name: gbp-optimization
description: When the user wants to set up, optimize, or manage a Google Business Profile, or improve visibility in Google's local map pack. Also use when the user mentions "GBP," "Google Business Profile," "Google My Business," "GMB," "business listing," "Google Maps listing," "optimize my profile," "map pack," "local pack," "3-pack," "Google Maps ranking," or "why am I not in the map pack." For review strategy, see review-management. For GBP posts, see gbp-posts. For suspension issues, see gbp-suspension-recovery.
metadata:
  version: 1.1.0
  author: Garrett Smith
---

# GBP Optimization & Map Pack Visibility

You are an expert in Google Business Profile optimization with deep knowledge of how GBP signals impact local rankings and map pack visibility.

## Initial Assessment

1. **Business Type**: Storefront, SAB, or hybrid? Single or multi-location?
2. **Current State**: Claimed/verified? Last updated? Suspensions? Current map pack position?
3. **Goals**: Target keywords? Calls/directions/visits? Geographic coverage?

---

## The Local Ranking Algorithm

Three pillars: **Proximity** (distance to searcher — can't control), **Relevance** (GBP matches query — primary category is strongest signal), **Prominence** (trust/authority — reviews, citations, links, engagement).

### Ranking Signal Categories (Current Industry Consensus)
Ranked by influence on local pack/Maps rankings. Specific percentages shift year to year — what matters is the relative weight.

1. **GBP Signals** (Strongest): Primary category, business name, completeness, hours/openness
2. **On-Page/Website Signals** (Rising): NAP, local keywords, domain authority, page content quality, internal linking
3. **Review Signals** (Critical): Recency and velocity (top-tier — recent reviews matter more than total count), rating, keywords in reviews, response rate
4. **Behavioral/Engagement Signals** (Rising fast): Clicks, calls, direction requests, post engagement, photo engagement. Google rewards profiles that "look alive"
5. **Link Signals**: Local links, domain authority, anchor text
6. **Citation Signals**: NAP consistency, volume, quality. Regaining importance because AI models pull from diverse web sources
7. **Business Hours/Openness** (Confirmed 2023, now top-5): Being open at search time boosts rankings. Rankings degrade in the final hour before closing
8. **Social Signals** (Confirmed 2026): Social engagement is now measurable. Google testing prominent display of social posts on GBP
9. **AI Search Signals** (New category): Entity clarity, web presence breadth, content structure. See `ai-local-search` for strategy

---

## Optimization Priority Order

1. Business Information Accuracy (foundation)
2. Category Selection (ranking signal)
3. Business Description & Services (relevance)
4. Photos & Visual Content (engagement)
5. Reviews & Reputation (trust signal)
6. Posts & Updates (freshness signal)
7. Q&A Management (content + trust)
8. Products & Services Catalog (relevance)

---

## Business Information

**Name**: Must match real-world name exactly. Keyword stuffing = #1 spam tactic. Report competitors who do it.

**Address**: Match USPS formatting. Consistent suite/unit numbers everywhere. SABs hide address, set service areas. Multi-location: separate profile per location.

**Phone**: Local number (not toll-free) as primary. Same number across all citations. Enable messaging if staffed.

**Hours**: Now a confirmed ranking factor — not just informational. Businesses open at search time rank higher. Set accurate regular hours. Special hours for holidays BEFORE the holiday. "More hours" for service-specific hours. Consider whether legitimate hour extensions are possible — every additional hour of operation is an additional hour of ranking visibility. Rankings begin to degrade in the final hour before closing.

**Website URL**: Most relevant page (homepage single-location, location page multi). Add UTM: `?utm_source=google&utm_medium=organic&utm_campaign=gbp`

---

## Category Selection

### Primary Category
Single most important ranking factor after proximity.
- Must describe what the business IS, not what it DOES
- Choose most specific available
- Check top-ranking competitors' categories
- Research: search target keywords in Maps, use GMB Spy or Pleper tools

### Additional Categories
- Up to 9 additional — add all legitimately applicable
- More categories = more keyword associations
- Only active services, not aspirational

---

## Business Description (750 chars)

1. What the business does + primary service area
2. Key services/specialties
3. Differentiators (years, certifications, awards)
4. CTA

No keyword stuffing, URLs, phone numbers, promotional language, or all-caps.

---

## Services & Products

**Services**: Every service with descriptions, grouped logically. Natural keyword variations. Pricing if competitive.

**Products**: Physical products or service packages with photos and prices. Link to website pages.

---

## Photos & Visual Content

**Priorities**: Cover photo (16:9) → Logo → Interior (3+) → Exterior → Team → Service/product → At-work

**Guidelines**: 10-15 minimum, add 2-3/month. Geo-tag EXIF data. Descriptive filenames. No stock photos. 720px+ wide. JPG or PNG.

**Video**: 30s-3min, upload directly, under 75MB.

---

## Q&A Management

Seed with common questions. Answer everything (owner answers show first). Upvote your answers. Monitor weekly for competitor/spam Q&A. Use keywords naturally.

---

## Attributes

Complete ALL applicable. Categories determine availability. Key: accessibility, ownership, service-specific (free estimates, emergency, online booking), payment methods.

---

## Map Pack Optimization Playbook

### Quick Wins (Week 1-2)
1. Fix primary category
2. Complete all GBP fields
3. Add photos to 10+ minimum
4. Respond to all unanswered reviews
5. Fix NAP on website
6. Add/fix LocalBusiness schema

### Month 1
1. GBP posting 1-2/week
2. Review generation campaign
3. Top-tier citations (Apple, Bing, Yelp, Facebook)
4. Create/optimize location page
5. Fix citation inconsistencies

### Month 2-3
1. Industry-specific citations
2. Service-area content
3. Local link opportunities
4. Seed Q&A, add video

### Ongoing
Weekly: reviews, Q&A, posts, edit monitoring. Monthly: photos, insights, hours check. Quarterly: competitor audit, category review.

---

## Diagnosing Map Pack Issues

**Not showing at all**: Verified? Suspended? Category correct? Location page exists? Website linked?

**Strong nearby, weak at distance**: Normal proximity. Strengthen relevance/prominence. Citations + content + reviews mentioning weak areas.

**Dropped rankings**: Check for unauthorized GBP edits. Algorithm update? Competitor improved? Lost reviews? Website changes?

**Outranked by competitor with fewer reviews**: Check their category (more specific?). Keyword in name (spam?). Stronger citations? Better website? Closer proximity?

---

## Common Mistakes

- Keyword-stuffed business name (suspension risk)
- Wrong primary category (biggest lever)
- Stale profile (no posts/photos in months)
- Inconsistent NAP across web
- Ignoring Q&A
- Stock photos
- Incomplete services section

---

## Task-Specific Questions

1. Storefront, SAB, or hybrid?
2. Primary services/keywords?
3. Geographic coverage needed?
4. Verified and active? Suspension history?
5. How many locations?
6. Current map pack position?

---

## What to Do Next

After optimizing a GBP profile, the next step depends on what you found:

| What You Found | Next Action | Skill |
|----------------|-------------|-------|
| Profile is optimized but rankings are weak | Run a geogrid scan to see WHERE you rank and WHERE you don't | `geogrid-analysis` |
| Review count is low vs. competitors | Build a review generation strategy | `review-management` |
| Website has no LocalBusiness schema | Implement structured data matching GBP exactly | `local-schema` |
| No recent posts or engagement | Start weekly post cadence | `gbp-posts` |
| Business has multiple locations | Apply this process per-location with centralized standards | `multi-location-seo` |
| Profile is at suspension risk (keyword-stuffed name, address issues) | Follow suspension prevention steps before making changes | `gbp-suspension-recovery` |
| Also need Apple Maps and Bing coverage | Optimize those platforms too — they share some signals but have different requirements | `apple-business-connect`, `bing-places` |
| Managing 10+ locations | Use the GBP API for bulk operations | `gbp-api-automation` |

**Default next step:** If the profile looks good, run a geogrid scan. Profile optimization without ranking measurement is guesswork.

## Tools for This Skill

See `docs/tool-routing` to pick based on what's connected.

- **Geogrid scan** (measure ranking impact of optimization) → Local Falcon (only option)
- **Live SERP check** (verify how profile appears in results) → live SERP tools (multiple options)

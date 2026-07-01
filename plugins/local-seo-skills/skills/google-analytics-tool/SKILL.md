---
name: google-analytics-tool
description: When the user wants traffic data, conversion tracking, user behavior on location pages, GBP traffic attribution, or geographic traffic patterns. Trigger on "Google Analytics," "GA4," "traffic," "conversions," "how many leads," "phone calls," "form submissions," "where is my traffic coming from," or "is my website converting."
metadata:
  version: 1.0.0
  author: Garrett Smith
---

# Google Analytics (GA4) Tool

GA4 has an official MCP server from Google. When connected, use it for website traffic analysis, conversion attribution, and user behavior data. GA4 answers "what happens AFTER someone finds you."

## When to Use GA4 vs Other Tools

| You Need | Use GA4 | Use Instead |
|----------|--------|-------------|
| Traffic to location pages | ✅ | — |
| Conversion tracking (calls, forms, bookings) | ✅ | — |
| Traffic source attribution (organic vs paid vs GBP) | ✅ | — |
| Geographic traffic patterns | ✅ | — |
| User behavior (bounce rate, engagement, time on page) | ✅ | — |
| GBP-specific traffic (via UTM) | ✅ | — |
| What keywords people searched to find you | ❌ Very limited | GSC (query data) |
| Search rankings | ❌ | Local Falcon, Semrush |
| Backlinks | ❌ | Ahrefs |
| SERP features | ❌ | SerpAPI |

## Critical Distinction

GA4 shows what happens ON YOUR WEBSITE. It does NOT show:
- GBP interactions that don't reach your website (calls from GBP, directions from GBP, map views)
- Map pack clicks that go to the GBP profile, not the website
- Local Falcon/ranking data

For complete local performance: GA4 (website) + GSC (organic queries) + GBP Insights (profile interactions) + Local Falcon (map rankings).

## Core Workflows

### Location Page Traffic Analysis

**When:** User asks "how are my location pages performing?" or "which locations get the most traffic?"

**What to pull:**
1. Landing page report filtered to location page URLs
2. Metrics: Sessions, users, engaged sessions, engagement rate, conversions
3. Compare across location pages

**How to interpret:**
- Location page with high traffic but low engagement: Content doesn't match what visitors expect — check title alignment
- Location page with high engagement but low conversions: Missing or weak CTA (call button, form, booking link)
- Location page with no traffic: Not indexed (check GSC) or no keyword targeting (check `local-keyword-research`)
- Big traffic differences between location pages: Might reflect market size, or some pages are better optimized

### Conversion Tracking

**When:** User asks "how many leads am I getting?" or wants to measure ROI.

**Key local conversions to track:**
| Conversion Event | How to Track | Setup Required |
|-----------------|-------------|----------------|
| Phone calls (click-to-call) | Event on `tel:` link clicks | Yes — event must be configured |
| Form submissions | Event on form submit/thank-you page | Yes — event or thank-you page trigger |
| Direction requests | Event on directions link clicks | Yes — event on link |
| Booking/scheduling | Event on booking completion | Yes — depends on booking system |
| Chat initiated | Event on chat widget open | Yes — event on widget |

**If conversions aren't set up:** Tell the user. GA4 doesn't track conversions automatically. Without configured events, you can only report traffic, not leads.

**What to look for:**
- Conversion rate per traffic source (organic vs paid vs direct vs referral)
- Conversion rate per location page
- Which pages generate the most conversions (not just traffic)
- Conversion trends over time (improving or declining?)

### GBP Traffic Attribution

**When:** User wants to know how much traffic comes specifically from their Google Business Profile.

**How it works:** GBP website links should include UTM parameters. Common patterns:
- `utm_source=google&utm_medium=organic&utm_campaign=gbp`
- `utm_source=gmb` (older convention)

**What to pull:**
1. Filter by source/medium matching GBP UTM parameters
2. Sessions, users, conversions from GBP specifically
3. Compare GBP traffic to overall organic traffic

**If no UTM tracking:** Most businesses don't set this up. Recommend adding UTM parameters to the GBP website URL so future data can be attributed.

### Geographic Traffic Analysis

**When:** User wants to know where their website visitors are located.

**What to pull:**
1. Geographic report by city/region
2. Filter to organic traffic only
3. Compare against service area

**How to interpret for local:**
- Traffic concentrated in one city but business serves a wider area: Need service area pages for other cities
- Traffic from cities outside service area: Content attracting non-local visitors (may or may not be useful)
- No traffic from a city in the service area: No content targeting that area, or not ranking there

### Traffic Source Comparison

**When:** User wants to understand their traffic mix.

**Pull traffic by source/medium:**
- Organic search (Google/Bing) → SEO working
- Direct → Brand awareness / repeat visitors
- Referral → Links from other sites sending traffic
- Paid search → Google Ads / PPC
- Social → Social media channels

**Healthy local business traffic mix:**
- Organic: 40-60% (should be the largest source)
- Direct: 20-30% (brand recognition)
- Referral: 5-15% (healthy backlink profile)
- Paid: varies by budget
- If organic is under 30%, SEO needs work

## Key Metrics and What They Mean

| Metric | What It Is | Local SEO Context |
|--------|-----------|-------------------|
| Sessions | Website visits | Total demand reaching your site |
| Engaged Sessions | Sessions with meaningful interaction | More important than raw sessions |
| Engagement Rate | Engaged sessions ÷ Total sessions | Below 50% on location pages = content problem |
| Conversions | Completed goal actions | THE metric — everything else is a means to this |
| Conversion Rate | Conversions ÷ Sessions | Benchmark: 3-5% for local service businesses |
| Bounce Rate | Sessions with no interaction | GA4 bounce = not engaged. High bounce on location pages = bad signal |
| Average Engagement Time | Time actively on page | Under 30 seconds = content isn't connecting |

## What to Do Next

| What You Found | Next Action | Skill |
|----------------|-------------|-------|
| Location pages with low traffic | Check GSC for indexing, then check keyword targeting | `google-search-console-tool`, `local-keyword-research` |
| Traffic but no conversions | Add/fix CTAs, forms, click-to-call | `local-landing-pages` |
| No conversion tracking set up | Configure GA4 events before anything else | Technical setup needed |
| GBP traffic not being tracked | Add UTM parameters to GBP website URL | `gbp-optimization` |
| Good traffic from organic but bad conversion rate | Landing page content/design issue | `local-landing-pages` |
| Geographic gaps in traffic | Build location pages for underserved cities | `local-landing-pages`, `service-area-seo` |
| Need this in a client report | Include traffic and conversion data in reports | `local-reporting` |

**Default next step:** Traffic without conversion tracking is vanity metrics. If GA4 events aren't configured, that's the first thing to fix — before any SEO work, you need to be able to measure results.

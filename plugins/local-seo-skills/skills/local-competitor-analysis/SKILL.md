---
name: local-competitor-analysis
description: When the user wants to analyze local search competitors, benchmark against map pack rivals, or understand why competitors outrank them. Also use when the user mentions "competitor analysis," "who's outranking me," "competitor GBP," "local competition," or "competitive audit." For geogrid-specific ranking data, see geogrid-analysis. For general map pack strategy, see map-pack-optimization.
metadata:
  version: 1.0.0
  author: Garrett Smith
---

# Local Competitor Analysis

> **Default data tool:** LocalSEOData (`localseodata-tool`). Use `competitor_gap` for ranking/review comparison, `backlink_gap` for link opportunities, `competitor_ads` for ad intelligence, `business_listings` for market overview. For deep backlink analysis, use Ahrefs.

You are an expert in local search competitive intelligence. Your goal is to identify what competitors are doing to rank, find gaps and opportunities, and build an actionable strategy to outperform them.

## Initial Assessment

1. **Target keywords**: What searches matter most?
2. **Current competitors**: Who's in the local 3-pack now?
3. **Market**: Geographic area and business type
4. **Your position**: Current ranking vs. competitors

---

## Competitor Identification

### Map Pack Competitors
- Search target keywords on Google Maps
- Note the top 3-5 businesses for each keyword
- Check from multiple locations across the service area (geogrids)
- Competitors may differ by keyword and location

### Organic Local Competitors
- Search target keywords in regular Google results
- Note who ranks for localized organic results
- May differ from map pack competitors

### Emerging Competitors
- New businesses in the area
- Businesses recently investing in SEO (new reviews, new content)
- Franchises entering the market

---

## Analysis Framework

### Per Competitor, Evaluate:

**GBP Signals**
- Primary category (use GMB Spy or similar to check)
- Additional categories
- Business name (keyword-stuffed? legitimate?)
- Business description completeness
- Photo count and recency
- Post frequency and recency
- Q&A presence
- Services/products listed
- Attributes completed

**Review Signals**
- Total review count
- Average rating
- Review velocity (recent review frequency)
- Response rate and quality
- Keyword mentions in reviews
- Reviews with photos

**Citation Signals**
- Presence on major directories
- NAP consistency
- Industry-specific directory coverage
- Data aggregator presence

**Website Signals**
- Domain authority
- Location page quality
- Service page depth
- LocalBusiness schema
- NAP on website
- Blog/content strategy
- Site speed and mobile experience

**Link Signals**
- Local backlinks (chamber, associations, sponsors)
- Industry-relevant links
- Press/media links
- Total referring domains

---

## Competitive Comparison Matrix

Create a matrix for the top 3-5 competitors:

| Signal | Your Business | Competitor A | Competitor B | Competitor C |
|--------|--------------|-------------|-------------|-------------|
| Primary Category | | | | |
| Google Reviews | | | | |
| Avg Rating | | | | |
| Review Velocity (/mo) | | | | |
| GBP Photos | | | | |
| GBP Posts (last 30d) | | | | |
| Domain Authority | | | | |
| Location Page? | | | | |
| Schema Markup? | | | | |
| Citation Count (est) | | | | |

---

## Finding the Gap

### Where You're Behind
- Fewer reviews → launch review generation campaign
- Weaker category → research more specific categories
- Less content → build service/location pages
- Fewer citations → citation building campaign
- No local links → local link building

### Where You Can Leapfrog
- Competitors with stale GBPs (no recent posts/photos)
- Competitors ignoring reviews (not responding)
- Competitors with thin websites (no location pages)
- Competitors with NAP inconsistencies
- Keywords none of them are targeting

### Spam to Report
- Keyword-stuffed business names
- Fake business addresses (virtual offices, UPS stores)
- Fake reviews
- Multiple listings for the same business
- Categories that don't match actual services

---

## Output Format

### Competitive Analysis Report
- Market overview and keyword landscape
- Per-competitor breakdown with scores
- Comparison matrix
- Gap analysis (where you're behind, where you can win)
- Spam findings to report
- Prioritized action plan

---

## Task-Specific Questions

1. What are your target keywords?
2. Who do you consider your main competitors?
3. What geographic area?
4. What's your current ranking position?
5. What local SEO work have you already done?

---

## What to Do Next

| What You Found | Next Action | Skill |
|----------------|-------------|-------|
| Competitors have more reviews | Build a review generation strategy to close the gap | `review-management` |
| Competitors rank better geographically | Run geogrid scans to see exactly WHERE they beat you | `geogrid-analysis` |
| Competitors have better GBP profiles | Optimize your profile to match or exceed their setup | `gbp-optimization` |
| Competitors have citation sources you're missing | Build citations on those same directories | `local-citations` |
| Competitor has a keyword-stuffed business name | Report the violation to Google, then outperform them on legitimate signals | `gbp-optimization` |

**Default next step:** Competitive analysis without action is just research. Pick the top 2-3 gaps and immediately start closing them.

## Tools for This Skill

See `docs/tool-routing` to pick based on what's connected.

- **Backlink comparison** → backlink tools (multiple options)
- **Keyword gap analysis** → keyword research tools (multiple options)
- **Ranking comparison** → Local Falcon (only option for geogrid), live SERP tools for spot-checks
- **LSA competitive data** → LSA Spy (only option)
- **Citation comparison** → citation tools (multiple options)

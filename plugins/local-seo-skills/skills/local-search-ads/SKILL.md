---
name: local-search-ads
description: When the user wants to run ads that appear inside the Google Maps local pack / map pack results. Also use when the user mentions "local search ads," "map pack ads," "ads in the map results," "local pack ads," "Google Maps ads," "location extensions ads," or "promoted pins on Google Maps." For LSAs (pay-per-lead), see lsa-ads. For standard geographic PPC, see local-ppc-ads.
metadata:
  version: 1.0.0
  author: Garrett Smith
---

# Local Search Ads (Map Pack Ads)

You are an expert in the Google Ads format that places ads inside the local map pack / local pack results. Your goal is to help businesses get visibility in map results through paid placement when organic map pack ranking is insufficient.

## What Are Local Search Ads?

Local search ads are Google Ads that appear within the local pack (map results) on Google Search and on Google Maps. They look like organic map pack listings but with a small "Sponsored" label.

### How They Differ from Regular Ads
- Appear **inside the map pack**, not above or below it
- Show business name, rating, address, hours — like an organic listing
- Driven by Google Ads campaigns + location assets (formerly location extensions)
- Pay per click (not per lead like LSAs)
- Require a linked Google Business Profile

### Where They Appear
- Google Search local pack (the map + business results)
- Google Maps search results
- Google Maps navigation suggestions
- "Promoted pins" on the Google Maps interface

---

## Requirements

### Must Have
1. **Google Ads account** with active campaigns
2. **Google Business Profile** claimed and verified
3. **Location assets** (location extensions) enabled in Google Ads
4. **GBP linked to Google Ads** account
5. Bidding on relevant local keywords

### How Linking Works
- In Google Ads: Assets → Location assets → Link to Google Business Profile
- GBP must be verified and in good standing
- Can link multiple GBP locations to one Ads account
- Each location can show in map pack ads for its service area

---

## Campaign Setup

### Campaign Types That Support Local Search Ads

**Search Campaigns with Location Assets**
- Standard search campaign targeting local keywords
- Add location assets linking to GBP
- Bid on service + location terms
- Ads eligible to show in map pack AND regular search results

**Performance Max (Local)**
- Google's AI-driven campaign type
- Automatically places ads across Search, Maps, Display, YouTube, Gmail
- Requires linked GBP locations as "store visits" or "local actions" goals
- Less control over placement but broader reach

**Local Campaigns (Legacy)**
- Being phased into Performance Max
- If still available, optimized specifically for local actions
- Drives store visits, calls, directions

### Keyword Strategy
- `[service] near me` — high intent
- `[service] [city]` — explicit local
- `[service] in [neighborhood]` — hyperlocal
- `best [service] [city]` — comparison intent
- Category terms: `plumber`, `dentist`, `auto repair` (with location targeting)

### Bidding
- Start with Maximize Clicks or Maximize Conversions
- Use location bid adjustments for priority areas
- Bid higher during business hours
- Bid higher on mobile (map pack ads are heavily mobile)
- Monitor CPC vs. organic traffic — sometimes organic investment is more efficient

---

## Optimization

### GBP Quality Matters for Ad Performance
Even though these are paid, your GBP quality affects ad performance:
- **Star rating shown in the ad** — higher rating = higher CTR
- **Review count visible** — more reviews = more trust
- **Photos** — some formats show a photo
- **Hours** — "Open now" improves click-through
- **Categories** — must match the keywords you're bidding on

### Location Asset Optimization
- Ensure every location you want ads for is linked
- Keep GBP data accurate and complete
- Use location-specific phone numbers (for call tracking)
- Set correct business hours (ads show "Open" / "Closed")

### Ad Copy Tips
- Can't control map pack ad copy directly (Google uses GBP data)
- But your search ads that trigger map pack placement use your ad copy
- Include city/area in ad headlines
- Include service specifics
- Strong CTAs: "Call Now," "Free Estimate," "Same-Day Service"

### Negative Keywords
- `jobs`, `salary`, `hiring`, `career` — people searching for employment
- `DIY`, `how to`, `tutorial` — informational intent
- `free` — unless you offer free estimates
- `[competitor names]` — unless running competitor targeting intentionally
- `reviews`, `complaints` — research intent, low conversion

---

## Measuring Performance

### Key Metrics
- **Map pack impressions**: How often your ad showed in local results
- **Clicks**: Clicks on the ad (call, directions, website)
- **Click-through rate (CTR)**: Map pack ad CTR vs. regular search ads
- **Cost per click (CPC)**: Usually higher than regular search due to high intent
- **Local actions**: Calls, direction requests, website visits from the ad
- **Store visits** (if enabled): Estimated in-person visits attributed to the ad

### Attribution Challenges
- Google lumps local search ad clicks with regular search ad clicks
- Segment by "Click type" to see calls, directions, website clicks
- Use call tracking to attribute phone calls
- "Store visits" metric requires enough location data (large advertisers only)

---

## Local Search Ads vs. Organic Map Pack

| Factor | Paid (Local Search Ads) | Organic (Map Pack) |
|--------|------------------------|-------------------|
| Speed | Immediate visibility | Months of optimization |
| Cost | Per click | Free (time/effort) |
| Position | Marked "Sponsored" | Organic results |
| Control | Keywords, bids, schedule | Indirect (GBP, reviews, citations) |
| Trust | Lower (ad label) | Higher (organic placement) |
| Sustainability | Stops when budget stops | Maintains with upkeep |

**Best approach**: Run local search ads for immediate visibility while building organic map pack presence for long-term.

---

## Multi-Location Considerations

- Link all locations to Google Ads via location assets
- Use location groups to manage which locations show for which campaigns
- Set location-specific bid adjustments
- Budget allocation per market based on opportunity and competition
- Performance varies significantly by location — don't apply uniform bids

---

## Common Mistakes

- **No GBP linked** — ads can't appear in map pack without location assets
- **Poor GBP quality** — low ratings/reviews kill ad CTR
- **Not bidding on local terms** — generic keywords won't trigger map pack placement
- **Ignoring mobile** — majority of map pack views are mobile
- **No call tracking** — missing the primary conversion action
- **Same strategy as regular search** — map pack ads need local-specific optimization

---

## Task-Specific Questions

1. Is GBP claimed, verified, and linked to Google Ads?
2. What keywords/services to target?
3. What geographic areas?
4. Single or multi-location?
5. Current Google Ads setup (new or existing campaigns)?
6. Monthly budget for local ads specifically?

---

## What to Do Next

| What You Found | Next Action | Skill |
|----------------|-------------|-------|
| Running map ads but no LSAs | LSAs appear above everything — add them for maximum SERP coverage | `lsa-ads` |
| Need standard PPC beyond the map pack | Set up geographically targeted search ads | `local-ppc-ads` |
| GBP profile is weak (hurts ad quality) | Optimize GBP — ad performance depends on profile quality | `gbp-optimization` |
| Want to compare paid vs. organic map pack visibility | Run geogrid scans to see organic rankings alongside paid | `geogrid-analysis` |
| Need to report ad performance to clients | Build ad metrics into local reporting framework | `local-reporting` |

**Default next step:** Local Search Ads work best when the GBP profile is already strong. Optimize the profile first, then amplify with ads.

## Tools for This Skill

See `docs/tool-routing` to pick based on what's connected.

- **Geogrid scan** (compare organic vs paid map pack visibility) → Local Falcon (only option)

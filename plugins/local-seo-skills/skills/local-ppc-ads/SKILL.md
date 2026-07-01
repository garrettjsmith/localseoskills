---
name: local-ppc-ads
description: When the user wants to run geographically targeted Google Ads (PPC) campaigns for a local business. Also use when the user mentions "local PPC," "geotargeted ads," "radius targeting," "Google Ads for local business," "local search campaigns," "geographic PPC," or "Google Ads location targeting." For LSAs (pay-per-lead), see lsa-ads. For map pack ads specifically, see local-search-ads.
metadata:
  version: 1.0.0
  author: Garrett Smith
---

# Local PPC Ads (Geographically Targeted Google Ads)

You are an expert in running Google Ads campaigns with geographic targeting for local businesses. Your goal is to drive local leads and customers efficiently through search, display, and video campaigns targeted to specific service areas.

## What This Covers

Standard Google Ads campaigns (search, display, Performance Max, video) with geographic targeting to reach local customers. These are the regular search ads that appear above and below organic results — distinct from LSAs (pay-per-lead) and local search ads (inside the map pack).

---

## Geographic Targeting Options

### Targeting Methods

**Radius targeting**
- Set a radius around business location or any point
- Best for: SABs, businesses serving a defined surrounding area
- Example: 15-mile radius around your office

**Location targeting (named areas)**
- Target by city, county, state, ZIP code, DMA, metro area
- Can layer multiple locations
- Best for: businesses serving specific defined cities/regions

**Location groups**
- Target by places of interest, demographics, or business locations
- Example: target within 5 miles of all your store locations

### Critical Setting: Location Options

**"Presence or interest" vs. "Presence only"**

Google defaults to "Presence or interest" which shows ads to people who are IN your area OR who have shown INTEREST in your area. This means someone in another state searching "plumber buffalo ny" sees your ad.

For most local businesses: **Switch to "Presence: People in or regularly in your targeted locations."** This prevents wasted spend on people not actually in your area.

### Exclusions
- Exclude areas you don't serve
- Exclude areas where a different location handles service
- Exclude known low-converting zones
- Regularly review Geographic Reports for locations you should exclude

---

## Campaign Structure for Local

### Recommended Structure

```
Account
├── [Service A] - [Market 1] Campaign
│   ├── Exact match ad group
│   ├── Phrase match ad group
│   └── Broad match ad group (with smart bidding)
├── [Service A] - [Market 2] Campaign
│   ├── ...
├── [Service B] - [Market 1] Campaign
│   ├── ...
├── Brand Campaign (all markets)
└── Competitor Campaign (optional)
```

### Why Separate by Market
- Different CPCs and competition per market
- Different budgets per market
- Location-specific ad copy
- Easier performance analysis per market

### Single Location (Simpler)
```
Account
├── Core Services Campaign (radius targeting)
├── Emergency/Urgent Campaign (radius targeting, 24/7)
├── Brand Campaign
└── Competitor Campaign (optional)
```

---

## Keyword Strategy

### Keyword Types for Local
- **Service + location**: `plumber buffalo ny`, `dentist orchard park`
- **Near me**: `plumber near me`, `emergency dentist near me`
- **Service only** (with geo targeting): `emergency plumber`, `ac repair`
- **Problem-based**: `pipe burst`, `furnace not working`, `toothache`
- **Brand**: Your business name + variations

### Match Types
- **Exact**: Highest intent, highest control, start here
- **Phrase**: Moderate expansion, good for discovering queries
- **Broad** (with smart bidding): Let Google find converters, but monitor closely

### Negative Keywords (Essential)
- Jobs/careers: `jobs`, `salary`, `hiring`, `career`, `indeed`
- DIY/informational: `how to`, `DIY`, `tutorial`, `YouTube`
- Free: `free` (unless offering free estimates)
- Unrelated services: services you don't offer
- Wrong locations: cities you don't serve that share names
- Brands: competitor names (unless intentionally targeting)

---

## Ad Copy for Local

### Headlines
- Include city/area name: "Buffalo's Trusted Plumber"
- Include service: "24/7 Emergency Plumbing"
- Include differentiator: "Licensed & Insured Since 2005"
- Include CTA: "Call Now — Free Estimates"
- Use dynamic location insertion: `{LOCATION(City)}`

### Descriptions
- Mention specific services
- Include trust signals (years, reviews, certifications)
- Include offer if applicable
- CTA with phone number
- Mention service area

### Extensions / Assets
- **Call asset**: Phone number (use tracking number)
- **Location asset**: Link to GBP (enables map pack ads too)
- **Sitelink assets**: Service pages, reviews page, about page, contact
- **Callout assets**: "Licensed & Insured," "Same-Day Service," "Free Estimates"
- **Structured snippet assets**: Service types, brands served
- **Price assets**: If pricing is competitive

---

## Landing Pages

### Rules for Local PPC Landing Pages
- Send traffic to **specific service or location pages**, not homepage
- Match ad copy to landing page content (keyword, service, location)
- Include city/area prominently on the page
- Click-to-call phone number above the fold
- Short form (name, phone, service needed) above the fold
- Trust signals: reviews, certifications, years in business
- Mobile-optimized (most local searches are mobile)
- Fast loading (under 3 seconds)

### Landing Page per Campaign
Ideally:
- `[service] + [city]` campaign → `/plumbing/buffalo-ny/` landing page
- Brand campaign → homepage
- Emergency campaign → `/emergency-plumbing/` with urgent CTA

---

## Bidding Strategy

### Starting Point
- **Maximize Conversions** with target CPA if you have conversion data
- **Maximize Clicks** if starting fresh (switch to conversion-based once you have 30+ conversions)
- **Manual CPC** if you want full control (more work but more predictable)

### Bid Adjustments
- **Device**: Increase mobile bids 10-30% (local searches skew mobile)
- **Time of day**: Increase during business hours, decrease overnight
- **Location**: Increase bids for high-value areas, decrease for fringe
- **Audience**: Increase for remarketing lists

### Budget Allocation
- Weight budget toward highest-converting services
- Weight toward highest-value markets
- Reserve 10-20% for testing new keywords and markets
- Adjust seasonally (HVAC summer/winter, tax season, etc.)

---

## Conversion Tracking

### What to Track
- **Phone calls** (from ads, from website via dynamic number insertion)
- **Form submissions** (contact forms, quote requests)
- **Chat initiations** (if using chat widget)
- **Direction requests** (if relevant for storefront)
- **Bookings** (if using online scheduling)

### Setup
- Google Ads conversion tracking on all forms
- Call tracking with dynamic number insertion (CallRail, CallTrackingMetrics)
- Import Google Analytics goals into Google Ads
- Track offline conversions if possible (CRM → Google Ads import)

### Attribution
- Use data-driven attribution if enough conversion volume
- Default to last-click for smaller accounts
- Track phone call quality (not just volume) — listen to calls

---

## Measuring Performance

### Key Metrics
- **CPC**: Cost per click (benchmark: varies by industry)
- **CTR**: Click-through rate (benchmark: 3-5% for local search)
- **Conversion rate**: Clicks → leads (benchmark: 5-15% for local)
- **Cost per lead (CPL)**: Total spend ÷ leads
- **Cost per acquisition (CPA)**: Total spend ÷ customers
- **ROAS**: Revenue from PPC customers ÷ ad spend

### Weekly Optimization Checklist
- Review search terms report → add negatives
- Check geographic report → exclude non-converting areas
- Review ad performance → pause low CTR ads
- Check budget pacing → adjust if over/underspending
- Monitor CPC trends → adjust bids if needed

---

## Common Mistakes

- **"Presence or interest" targeting** — default wastes spend on non-local searchers
- **Sending to homepage** — always use specific landing pages
- **No call tracking** — phone calls are the primary local conversion
- **No negative keywords** — search terms report reveals massive waste
- **Ignoring mobile** — local PPC is mobile-dominant
- **Same ads for all areas** — localize ad copy per market
- **No conversion tracking** — flying blind without it

---

## Task-Specific Questions

1. What services to advertise?
2. What geographic areas to target? (cities, radius, ZIP codes)
3. Monthly budget?
4. What's an acceptable cost per lead?
5. Existing Google Ads account or starting fresh?
6. What conversion actions are available? (phone, form, booking)
7. Current landing pages — do service/location pages exist?

---

## What to Do Next

| What You Found | Next Action | Skill |
|----------------|-------------|-------|
| PPC running but no LSA presence | LSAs appear above PPC — set those up for maximum coverage | `lsa-ads` |
| Want ads inside the map pack specifically | Set up Local Search Ads (different from standard PPC) | `local-search-ads` |
| Ad traffic needs better landing pages | Build dedicated local landing pages for ad campaigns | `local-landing-pages` |
| Need to report PPC results alongside organic | Combine PPC and organic metrics in unified reports | `local-reporting` |
| GBP not optimized (hurts location extensions) | Optimize GBP to improve ad location assets | `gbp-optimization` |

**Default next step:** PPC is a visibility bridge while organic rankings build. Track both together and shift budget as organic improves.

## Tools for This Skill

See `docs/tool-routing` to pick based on what's connected.

- **Keyword data** (volume, CPC, competition for ad targeting) → keyword research tools (multiple options)

---
name: local-keyword-research
description: When the user wants to research keywords for a local business, find local search opportunities, build a keyword map for location pages, or understand local search intent. Also use when the user mentions "local keywords," "keyword research," "service area keywords," "near me keywords," "local search volume," "keyword map," "city keywords," "geo-modified keywords," "implicit local intent," or "local keyword strategy." For content creation from keywords, see local-landing-pages. For competitor keyword analysis, see local-competitor-analysis.
metadata:
  version: 1.1.0
  author: Garrett Smith
---

# Local Keyword Research

> **Default data tool:** LocalSEOData (`localseodata-tool`). Use `keyword_opportunities` for business-specific keyword ideas, `keyword_suggestions` for seed keyword expansion, `search_volume` for volume data, `keyword_trends` for seasonality, `keywords_for_site` for current rankings. For advanced gap analysis, use Semrush.

You are an expert in keyword research for local businesses. Your goal is to build comprehensive keyword strategies that capture local search demand across services, locations, and intent types — driving both map pack and organic local rankings.

## How Local Keyword Research Differs

Local keyword research isn't just "regular keyword research + city names." It has unique dynamics:

- **Implicit vs. explicit local intent** — "plumber" has local intent even without a city name
- **Map pack vs. organic** — different keywords trigger different SERP layouts
- **Near-me queries** — massive and growing, with no specific location in the query
- **Service area combinatorics** — 10 services × 30 cities = 300 keyword combinations
- **Micro-intent variations** — "emergency plumber" vs. "plumber" vs. "plumbing repair" attract different customers
- **Low volume ≠ low value** — "emergency plumber orchard park ny" may show 10 searches/month but converts at 40%

---

## Keyword Categories for Local

### 1. Core Service Keywords
The primary services the business offers, without location modifiers.

Examples:
- `plumber`
- `emergency plumbing`
- `drain cleaning`
- `water heater repair`
- `sewer line replacement`

These carry **implicit local intent** — Google shows local results without a city name.

### 2. Geo-Modified Keywords
Service + specific location.

**Formats:**
- `[service] [city]` — plumber buffalo
- `[service] in [city]` — plumber in buffalo
- `[service] [city] [state]` — plumber buffalo ny
- `[service] [neighborhood]` — plumber elmwood village
- `[service] [county]` — plumber erie county
- `[service] [zip]` — plumber 14075 (less common but real)

### 3. Near-Me Keywords
Location-less queries with explicit local intent.

- `plumber near me`
- `emergency plumber near me`
- `best plumber near me`
- `24 hour plumber near me`

**Important:** "Near me" queries are determined by the searcher's device location, not by your content. You can't "optimize for near me" with on-page content — you optimize by having strong GBP presence, reviews, and proximity.

### 4. Problem/Symptom Keywords
What the customer is experiencing, not what the business calls its service.

- `pipe burst` (they don't search "pipe repair")
- `furnace not turning on` (not "furnace repair")
- `tooth pain` (not "endodontics")
- `water in basement` (not "basement waterproofing")

These often have high urgency and conversion rates.

### 5. Qualifier Keywords
Modifiers that signal specific intent.

**Urgency:** emergency, 24 hour, same day, immediate
**Cost:** cheap, affordable, cost, pricing, free estimate
**Quality:** best, top rated, licensed, certified, experienced
**Comparison:** vs, alternative, reviews, near [competitor]

### 6. Question Keywords
Long-tail queries from People Also Ask and autocomplete.

- `how much does a plumber cost in buffalo`
- `do I need a permit for a water heater in ny`
- `how long does drain cleaning take`

Good for content/FAQ but rarely drive direct conversions.

### 7. Branded Procedure / Product Keywords
Many businesses offer proprietary or branded services that patients/customers search by name.

**Healthcare examples:** Discseel, Intracept, CoolSculpting, Invisalign, LASIK, Botox
**Home services examples:** Rinnai (tankless water heaters), Mitsubishi (mini-splits), Generac (generators)
**Legal examples:** specific legal programs or certifications by name

Why these matter:
- Patients/customers often research the procedure first, then search "Discseel near me" or "Invisalign plattsburgh ny"
- Very high intent — they already know what they want
- Lower competition than generic terms ("pain management")
- The manufacturer/brand often has its own "find a provider" directory — get listed there too

### 8. Insurance / Qualification Keywords
Searchers filtering by whether they can use/afford the service.

**Healthcare:** "[service] that accepts Medicaid," "[service] that takes Blue Cross," "workers comp pain management," "[specialty] accepting new patients"
**Legal:** "free consultation personal injury," "contingency fee lawyer," "pro bono attorney"
**Home services:** "licensed plumber," "insured roofing contractor," "financing available HVAC"
**General:** "[service] that takes [payment method]"

These keywords have very high conversion intent — the searcher has already decided they need the service, they're checking if they can access it.

### 9. Cross-Border / Bilingual Keywords (Market-Specific)
Businesses near national borders or in multilingual markets have a keyword category most competitors miss entirely.

**Examples:**
- Plattsburgh, NY (1 hour from Montreal): "gestion de la douleur Plattsburgh," "dentiste Plattsburgh NY"
- San Diego (near Tijuana): "dentist san diego," "[service] san diego desde mexico"
- Miami: Spanish-language service keywords
- Border towns, military bases near international borders, tourism destinations

Check: Does the business serve customers who search in another language? If yes, those keywords deserve their own category and potentially their own landing pages.

---

## The Keyword Research Process

### Step 1: Seed List from Business Intelligence

Before touching any tool, gather:

- **Full service list** from the business (every service they offer)
- **Service area** — every city, town, neighborhood they serve
- **Top revenue services** — what makes them the most money
- **Competitor names** — who they compete against
- **Customer language** — what customers actually call things (not industry jargon)

Ask the business: "When someone calls you, what do they say they need?" That language is your keyword seed.

### Step 2: Expand with Tools

**For each seed keyword, pull:**
- Search volume (monthly)
- Keyword difficulty
- SERP features (local pack? ads? AI overview?)
- CPC (indicates commercial value even for organic)
- Related keywords / suggestions

**Tool options:**
- Semrush Keyword Magic Tool
- Ahrefs Keywords Explorer
- DataForSEO keyword data API
- Google Keyword Planner (free, less precise on volume)
- Google Autocomplete (free, real-time suggestions)
- People Also Ask (free, question mining)
- SERP API for live SERP feature detection

### Step 2.5: Mine Competitor Keywords from SERP Data

When you search for the client's primary keywords, the SERP results contain competitor intelligence:

1. **Organic competitors** — Which competitors rank for the target keyword? Scrape their service pages to find keywords they target that the client doesn't
2. **Related searches** — Google's "Related searches" and "People also search for" at the bottom of results are keyword gold. These come directly from what real searchers look for
3. **People Also Ask** — Each PAA question is a potential content topic or FAQ entry
4. **Map pack competitors** — Check what categories and services the map pack competitors list. Different category = different keyword opportunity
5. **Ads competitors** — If someone is paying to rank for a keyword, it has commercial value. Note which keywords have ads running

This step is often skipped but it's free and produces the highest-quality keyword additions because it's based on actual search behavior, not tool estimates.

### Step 3: Build the Combinatoric Matrix

For local businesses, the keyword universe is a matrix:

```
Services × Locations × Modifiers = Keyword Universe

Example:
10 services × 25 cities × 3 modifiers = 750 keyword combinations
```

**Don't create a page for every combination.** Use the matrix to:
- Identify which combinations have real volume
- Decide which deserve dedicated pages vs. which are covered by broader pages
- Find gaps where competitors have pages but you don't

### Step 4: Classify Intent

Every keyword gets an intent tag:

| Intent | Example | Content Type |
|--------|---------|-------------|
| Emergency/urgent | "emergency plumber now" | GBP, dedicated emergency page |
| Transactional | "plumber buffalo ny" | Service + city landing page |
| Commercial investigation | "best plumber buffalo reviews" | Review/comparison content |
| Informational | "how to unclog drain" | Blog/FAQ content |
| Navigational | "[business name]" | Homepage, GBP |

**Priority order for local businesses:** Emergency > Transactional > Commercial > Informational

### Step 5: Map Keywords to Pages

Each keyword (or keyword cluster) maps to a specific page:

| Keyword Cluster | Target Page | Page Type |
|----------------|------------|-----------|
| plumber buffalo ny, plumber in buffalo, buffalo plumber | /plumber-buffalo-ny/ | Service + city |
| emergency plumber, 24 hour plumber, pipe burst | /emergency-plumbing/ | Service (urgent) |
| drain cleaning [cities] | /drain-cleaning/ | Service page |
| how much does plumbing cost | /blog/plumbing-cost-guide/ | Blog/FAQ |

**Rules:**
- One primary keyword per page
- Group related keywords that share SERP overlap onto the same page
- Don't create thin pages for keywords with <10 monthly searches unless high conversion value
- Every service page should target the service keyword AND 2-3 geo-modified variants

---

## Local Search Volume Realities

### Volume Data is Unreliable for Local

**Know this going in:** Keyword tools significantly undercount local search volume.

- Tools often can't distinguish "plumber" searched in Buffalo from "plumber" searched nationally
- "Near me" volume is aggregated nationally, not per-city
- Low-volume long-tail keywords often show 0-10 volume but still drive real traffic
- Google Keyword Planner groups similar terms, inflating some and hiding others

**What to do about it:**
- Use Search Console data for existing pages as ground truth
- Treat tool volume as directional, not absolute
- Never ignore a keyword just because the tool says "0 volume" if the intent is real
- CPC data is often a better signal of keyword value than volume

### Volume Benchmarks by Market Size

| Market Size | Service Keyword Volume | Geo-Modified Volume |
|-------------|----------------------|-------------------|
| Major metro (NYC, LA) | 5,000-50,000/mo | 500-5,000/mo |
| Mid-size city (Buffalo, Tampa) | 1,000-10,000/mo | 100-1,000/mo |
| Small city / suburb | 100-1,000/mo | 10-100/mo |
| Rural / small town | 10-100/mo | 0-10/mo |

---

## SERP Layout Analysis

Not all keywords produce the same SERP. Check what actually appears:

| SERP Feature | What It Means |
|-------------|--------------|
| Local pack (3-pack) | Implicit local intent — GBP optimization critical |
| LSAs at top | Pay-per-lead opportunity, high commercial intent |
| Ads in map pack | Local search ads opportunity |
| AI Overview | Content needs to be AI-parseable |
| People Also Ask | FAQ content opportunity |
| Organic only (no local pack) | Informational intent, blog/guide content |

**Run SERP checks for your top 20 keywords** to understand what you're competing for. A keyword that triggers a local pack requires different optimization than one that shows only organic results.

---

## Competitive Keyword Gap Analysis

### Find What Competitors Rank For That You Don't

1. Pull organic keywords for top 3 local competitors (Semrush/Ahrefs)
2. Filter for keywords containing service terms or city names
3. Identify keywords where competitors rank top 20 but you don't rank at all
4. Cross-reference with your service list — are these services you offer?
5. Prioritize gaps by volume × relevance × difficulty

### Find What Nobody Ranks For

Sometimes the best opportunities are keywords with decent volume but weak competition:
- Check top 3 results for the keyword — are they homepage rankings? (weak)
- Are the ranking pages thin or outdated? (opportunity)
- Is the keyword a newer phrasing that hasn't been targeted yet?

---

## Keyword Research for Multi-Location

For businesses with multiple locations, the research scales differently:

### Approach 1: Hub and Spoke
- One master keyword list per service
- Apply location modifiers per market
- Create location-specific pages using the master template
- Customize with local data, not just city name swaps

### Approach 2: Per-Market Research
- Research keywords independently per market
- Some markets have different terminology (soda vs. pop, HVAC vs. heating and cooling)
- Competition levels vary by market — priority keywords shift
- Better for 10-50 locations where markets are distinct

### Approach 3: Programmatic at Scale
- For 50-500+ locations, full per-market research isn't practical
- Build a master keyword template
- Pull volume data in bulk via API (DataForSEO, Semrush API)
- Flag markets with unusual patterns for manual review
- Use Search Console data from existing pages to validate

---

## Output: The Keyword Map

The final deliverable is a keyword map document:

| Keyword | Volume | KD | Intent | Target Page | Status | Priority |
|---------|--------|-----|--------|------------|--------|----------|
| plumber buffalo ny | 720 | 35 | Transactional | /plumber-buffalo-ny/ | Exists | High |
| emergency plumber | 480 | 42 | Emergency | /emergency-plumbing/ | Needs creation | High |
| drain cleaning buffalo | 210 | 28 | Transactional | /drain-cleaning-buffalo/ | Exists | Medium |
| how much does plumber cost | 590 | 22 | Informational | /blog/plumbing-costs/ | Needs creation | Medium |
| water heater repair near me | 880 | 38 | Transactional | /water-heater-repair/ | Needs update | High |

**Status options:** Exists (optimized), Exists (needs update), Needs creation, Low priority

---

## Task-Specific Questions

1. What services does the business offer? (full list)
2. What geographic area do they serve? (cities, radius, neighborhoods)
3. Single location or multi-location?
4. What are their highest-revenue services?
5. Do they have an existing website with pages to audit? (Search Console access?)
6. Who are the top 3-5 local competitors?
7. Any services they're trying to grow into?

---

## What to Do Next

| What You Found | Next Action | Skill |
|----------------|-------------|-------|
| Keywords identified, need pages for them | Create location and service pages targeting the keyword map | `local-landing-pages` |
| Found keyword gaps vs. competitors | Deep-dive competitive analysis on those gaps | `local-competitor-analysis` |
| Keywords have high CPC, worth running ads | Build PPC campaigns targeting high-value keywords | `local-ppc-ads` |
| Keywords trigger LSA results | Ensure LSA profile is set up for those service categories | `lsa-ads` |
| Keywords trigger AI Overviews | Optimize content for AI citation | `ai-local-search` |
| Need to know current rankings for these keywords | Run geogrid scans per keyword | `geogrid-analysis` |
| Keywords done, need full audit context | Feed keyword map into the audit framework | `local-seo-audit` |

**Default next step:** Keyword research without page creation is wasted effort. Map keywords → pages → publish → scan rankings.

## Tools for This Skill

This skill requires data from external tools. See `docs/tool-routing` to pick based on what's connected.

- **Keyword volume and difficulty** → keyword research tools (multiple options)
- **SERP feature detection** → live SERP tools (multiple options)
- **Existing keyword performance** → Google Search Console (only source of truth for actual clicks/impressions)
- **Bulk keyword pulls (100+)** → bulk data tools (best for scale)

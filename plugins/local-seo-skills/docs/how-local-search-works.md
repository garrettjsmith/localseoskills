# How Local Search Works

Foundational knowledge for reasoning about local SEO. Skills tell you WHAT to do. This doc tells you WHY it works, so you can reason through edge cases the skills don't explicitly cover.

---

## The Three Ranking Factors

Google's local algorithm ranks businesses on three pillars. Every local SEO action maps to one or more of these.

### 1. Relevance

How well a business matches what the searcher is looking for.

**What drives relevance:**
- GBP primary category (strongest single signal — "Pain management physician" matches "pain management near me" better than "Doctor" does)
- Additional GBP categories (broaden what you're relevant for)
- Business name (Google does weight keywords in the business name — which is why keyword-stuffed names rank well, even though it violates guidelines)
- GBP services and products
- Website content that matches the query
- Review text mentioning services and keywords (natural language, not stuffed)
- Schema markup confirming what the business does

**Key insight:** Relevance is binary before it's a spectrum. If Google doesn't think you're relevant for a query at all, no amount of prominence or proximity helps. That's why category selection is the highest-impact single change in local SEO.

### 2. Proximity

How close the business is to the searcher (or the location in the query).

**How proximity works:**
- Google estimates the searcher's location from GPS, IP address, or the location in their query
- Closer businesses get a ranking boost — this is the "proximity bubble"
- The strength of the proximity boost varies by keyword. "Coffee shop" has extreme proximity weighting (you want the nearest one). "Brain surgeon" has very little (you'll travel for quality).
- Service Area Businesses (SABs) don't show a physical address, so proximity is calculated from the centroid of their service area, which Google determines from their settings + signals
- A business can rank #1 at its front door and not appear at all 5 miles away. This is normal, not a problem — unless competitors with similar relevance and prominence outrank them at that distance

**Key insight:** Proximity is the one factor you can't optimize. The business is where it is. What you CAN do is strengthen relevance and prominence enough to extend the ranking radius — effectively widening the proximity bubble.

### 3. Prominence

How well-known, trusted, and authoritative Google considers the business.

**What drives prominence:**
- Review count and rating (the most visible prominence signal)
- Review recency and velocity — this is critical and underappreciated. A business with 200 reviews but none in the last 3 months will lose ground to one with 80 reviews getting 5-10/month. Review recency is a top-tier signal as of 2025, not just a tiebreaker
- Citation volume and consistency — mentions of the business across the web. AI search is reviving the importance of citations because AI models pull from diverse web sources to build entity understanding
- Backlinks to the website (especially from local, relevant sources)
- Brand search volume — how many people search for the business by name
- Age of the GBP listing — older, established listings have an advantage
- Engagement signals — clicks, calls, direction requests from GBP
- Website authority (domain authority/rating from Ahrefs/Moz perspective)
- Social engagement — social signals are now a confirmed, measurable ranking factor. Still not the strongest signal, but no longer ignorable

**Key insight:** Prominence is the tiebreaker. When two businesses are equally relevant and equidistant from the searcher, prominence decides who ranks higher. This is why reviews and citations matter so much in competitive markets.

### Business Hours as a Ranking Factor

Since late 2023, Google uses whether a business is currently open as a ranking factor in the local pack. It's now considered the 5th most influential local pack ranking factor.

**How it works:**
- Businesses that are open at the time of the search get a ranking boost
- Rankings begin to degrade in the final hour before closing
- The effect is stronger for competitive keywords than non-competitive ones
- This doesn't prevent closed businesses from ranking entirely — it prioritizes open ones

**Implications:**
- Business hours are no longer just informational — they directly affect visibility
- Businesses with extended hours have a structural ranking advantage
- This is especially impactful for industries where consumers expect immediate availability (restaurants, urgent care, locksmiths)
- Don't fake 24/7 hours to game this — Google can detect this and it damages trust when customers arrive to a closed business
- DO evaluate whether legitimate hour extensions are possible (earlier opens, later closes, weekend hours)

---

## How the Map Pack Gets Assembled

When someone searches a query with local intent, Google does this:

1. **Determines local intent** — Does this query need local results? (See "Local Intent" section below)
2. **Identifies candidate businesses** — Pulls all GBP listings whose categories and content match the query within a reasonable distance
3. **Applies the three factors** — Scores each candidate on relevance, proximity, and prominence
4. **Ranks and displays** — Shows the top 3 (the "3-pack" or "local pack") on the main SERP, with more available via "More places"

The map pack is separate from organic results. A business can rank #1 in the map pack and not appear in organic results at all (and vice versa). They're different algorithms with different signals, though they share some (website quality, links).

**What changes position within the map pack:**
- Position 1 vs 2 vs 3 matters enormously — click-through rates drop sharply after position 1
- The map pack can show different businesses depending on where the searcher is standing (proximity effect)
- The same query searched from two locations 3 miles apart can show completely different map pack results
- This is why geogrid scanning exists — to see ranking across geography, not just from one point

---

## Local Intent: When Google Shows Local Results

Not every search triggers local results. Understanding intent determines which keywords matter.

### Implicit Local Intent
The query has no location modifier, but Google shows local results anyway.

Examples: "plumber," "dentist," "pizza," "oil change"

Google has learned these queries almost always mean "near me." The searcher doesn't need to type a city — Google infers it. These are often the highest-volume local keywords.

### Explicit Local Intent
The query includes a location.

Examples: "plumber buffalo ny," "dentist in orchard park," "pizza near downtown"

These confirm local intent. Google matches to the specified area rather than the searcher's current location.

### No Local Intent
Some queries never trigger local results.

Examples: "what is a plumber," "plumbing certification requirements," "plumber salary"

These are informational, not transactional. No map pack, no local results. Good for content marketing but not for local ranking.

### Mixed Intent
Some queries trigger local results sometimes, depending on context.

Examples: "best plumber" (might show local OR national listicle articles), "plumber reviews" (might show local businesses OR review sites)

**Key insight for keyword research:** The best local keywords have strong implicit local intent AND reasonable volume. "Plumber" triggers a map pack without needing a city name — that's the ideal keyword to optimize for.

---

## Entity Resolution: How Google Connects the Dots

Google tries to build a unified understanding of each business as an "entity." It connects:

- **GBP listing** (name, address, phone, categories)
- **Website** (the URL linked from GBP, plus any pages about the business)
- **Citations** (mentions on Yelp, BBB, industry directories, data aggregators)
- **Social profiles** (Facebook, LinkedIn, etc.)
- **Reviews** (across platforms)
- **Schema markup** (structured data confirming business details)

When all these sources agree — same name, same address, same phone, same services — Google's confidence in the entity is high, and rankings benefit.

When sources disagree — different phone numbers, old addresses, inconsistent business names — Google's confidence drops. It may not know which information is correct, or it may split signals across what it thinks are different entities.

**This is why NAP consistency matters so much.** It's not a checklist item for the sake of it. Inconsistent NAP literally fragments the entity in Google's understanding, spreading ranking signals across multiple "versions" of the business instead of concentrating them on one.

**Duplicate listings are the worst version of this problem.** Two GBP listings for the same business means Google treats them as two separate entities. Reviews on one don't help the other. Citations pointing to one don't strengthen the other. The business is competing against itself.

---

## The GBP Ecosystem

GBP isn't just a listing — it's an ecosystem of signals Google uses to understand and rank local businesses.

### Profile Signals
- **Primary category** — Single most impactful ranking signal. Must be the most specific match for target keywords
- **Additional categories** — Expand relevance to secondary services. Usually 3-5 is sufficient
- **Business name** — Supposed to be the real-world name. Keyword-stuffed names rank better (but violate guidelines and risk suspension)
- **Address** — Determines proximity calculations. Must match website and citations exactly
- **Phone** — Local phone numbers preferred over toll-free. Must be consistent everywhere
- **Website URL** — Links to the business website. Only one primary URL allowed
- **Hours** — Now a confirmed ranking factor (not just informational). Businesses open at search time get a ranking boost. Accurate hours are critical. Special hours for holidays must be set BEFORE the holiday. Extended hours = extended visibility window
- **Attributes** — Varies by category. "Women-owned," "wheelchair accessible," "free Wi-Fi" etc.
- **Services/Products** — Structured data about what the business offers. Helps with relevance
- **Description** — 750 characters. Minimal direct ranking impact but affects conversion

### Engagement Signals
- **Photos** — Businesses with 100+ photos get more engagement. Recency matters
- **Posts** — Weekly posts signal an active listing. Can contain keywords naturally
- **Q&A** — Questions and answers visible on the listing. Business should seed and answer
- **Messaging** — Whether the business accepts messages through GBP
- **Reviews and responses** — Volume, velocity, rating, keywords, response rate

### Behavioral Signals
Google tracks how searchers interact with the listing:
- Click-through rate from search results
- Click-to-call rate
- Direction request rate
- Website click rate
- Time spent on listing
- Whether the searcher returns to search results (pogo-sticking = negative signal)

These behavioral signals create a feedback loop: businesses that get more engagement rank better, which gets them more engagement.

---

## How Citations Work

A citation is any mention of a business's Name, Address, and Phone number (NAP) on a third-party website.

### Structured Citations
Directory listings with organized business data: Yelp, BBB, Yellow Pages, industry-specific directories, data aggregators.

### Unstructured Citations
Mentions in blog posts, news articles, event listings, or other web pages that aren't business directories.

### Data Aggregators
Four major aggregators feed data to hundreds of smaller directories:
- **Data Axle** (formerly Infogroup)
- **Neustar/Localeze**
- **Foursquare**
- **Yelp** (functions as both a directory and an aggregator)

Submitting accurate data to aggregators cascades correct NAP to downstream directories automatically. This is more efficient than manually updating hundreds of individual directories.

### Why Citations Matter
Citations serve as third-party validation of a business's existence and location. Each consistent citation is a "vote" that tells Google: "Yes, this business exists at this address with this phone number."

The marginal value of citations decreases as you add more. Going from 0 to 50 quality citations has a dramatic ranking effect. Going from 200 to 250 has almost none. Focus on quality and consistency over raw count.

**AI is bringing citations back.** Despite a "citations are dead" narrative in some corners, AI models (Google AI Overviews, ChatGPT, Gemini) pull from diverse web sources to build entity understanding. Citations across directories, aggregators, and unstructured mentions give AI models more confidence in recommending your business. Neglected citations also become outdated and inconvenience real customers, costing conversions even if the direct ranking impact has diminished.

---

## How Reviews Impact Rankings

Reviews affect local rankings through multiple mechanisms:

### Direct Ranking Signals
- **Recency and velocity** — The number of reviews you've gotten THIS MONTH matters more than your total count. This is the most underappreciated review signal. A business that stops getting reviews will see rankings slip within weeks, and rankings recover when fresh reviews resume. Review recency is a top-5 ranking factor as of 2025-2026
- **Volume relative to competitors** — Not absolute count, but relative to others in the same market and category
- **Average rating** — Higher is better, but the difference between 4.5 and 4.8 is minimal compared to 3.5 vs 4.5
- **Keywords in review text** — When reviewers naturally mention services ("great AC installation" or "fixed my drain fast"), it reinforces relevance signals

### Indirect Ranking Signals
- **Response rate** — Google confirms that responding to reviews is a ranking factor
- **Sentiment** — Positive reviews may carry slightly more weight, though this is debated
- **Diversity** — Reviews on Google + Yelp + industry sites > same total count all on Google
- **Local Guides** — Reviews from Google's Local Guide program may carry more weight (unconfirmed but widely observed)

### Conversion Impact (Not Ranking, But Revenue)
Even beyond rankings, reviews determine whether someone clicks, calls, or chooses a competitor:
- Star rating is the first thing people see in map pack results
- Review count signals credibility (50 reviews at 4.7 is more trusted than 3 reviews at 5.0)
- Recent negative reviews without responses are conversion killers
- Photo reviews increase engagement significantly

---

## Website Signals for Local

The website connected to a GBP listing provides additional ranking signals.

### What Google Looks At
- **NAP on the site** — Must match GBP exactly. Footer NAP on every page is standard
- **Local schema markup** — Structured data (JSON-LD) confirming business information in machine-readable format
- **Location pages** — For multi-location businesses, unique pages per location with genuine local content
- **Service pages** — Dedicated pages for each core service, with natural location references
- **Title tags and H1s** — Including city/region in key pages reinforces geographic relevance
- **Topical authority** — Comprehensive content coverage of the business's domain builds authority
- **Technical health** — Mobile-responsive, fast-loading, HTTPS, properly indexed
- **Internal linking** — Service pages linking to location pages and vice versa

### The GBP-to-Website Connection
Google follows the website URL in GBP and treats that site as the "official" web presence for the entity. If the website is on a different domain than what's in GBP, or if the website has conflicting NAP information, it weakens the entity connection.

For this reason, the GBP website URL should point to a page that clearly displays the same NAP data as the GBP listing. For single-location businesses, this is usually the homepage or a dedicated location page. For multi-location businesses, each GBP listing should link to its specific location page.

---

## Service Area Businesses (SABs) vs. Storefronts

### Storefronts
- Display their address on GBP
- Customers visit the physical location
- Proximity is calculated from the street address
- Pin placement in Google Maps is visible to searchers
- Examples: restaurants, retail stores, medical offices, law firms

### Service Area Businesses (SABs)
- Hide their address on GBP (only show service area)
- Travel to the customer's location
- Proximity is calculated from Google's estimate of the service area centroid
- No pin visible to searchers (just a service area boundary)
- Examples: plumbers, electricians, mobile dog groomers, house cleaners

### Hybrid Businesses
- Some businesses serve customers at their location AND travel to customers
- Can show their address AND define a service area
- Get benefits of both models
- Examples: HVAC companies with a showroom, landscapers with a nursery, auto mechanics with mobile service

### Ranking Implications
SABs are harder to rank, and there's a real tension between Google's guidelines and ranking reality:
- **The hidden address penalty:** A large-scale study of 8,186 businesses across 200 cities (December 2025) found a direct negative correlation between hiding your address and local pack ranking. Google's guidelines say SABs should hide their address, but doing so demonstrably hurts ranking. This is one of the most frustrating dynamics in local SEO — complying with guidelines costs you visibility
- Google's centroid calculation for SABs isn't always accurate to where the business actually operates
- No visible address means fewer natural citation opportunities
- Proximity signals are weaker because there's no precise point-location
- Geogrid scans for SABs often show weaker, more scattered patterns than storefronts

**Service area settings as a potential ranking factor:** Emerging data (2025) suggests that tightly configured service areas in GBP may now influence SAB ranking radius. Previously, service area settings were considered to have zero ranking impact. However, practitioners have documented ranking improvements after tightening service area settings to focus on target areas rather than casting a wide net. This is not yet conclusive, but worth testing for SABs struggling with ranking radius.

---

## AI Search Signals: The New Ranking Dimension

AI search signals are now recognized as a distinct ranking factor category. This isn't just about "showing up in ChatGPT" — it reflects a fundamental shift in how Google itself evaluates and presents local businesses.

**What's happening:**
- Google AI Overviews appear in over half of local search queries
- AI Overview prominence is rooted to industry rather than city — if AI Overviews appear for plumbing queries in Houston, they appear for plumbing queries in Denver too
- ChatGPT, Gemini, and other AI platforms are generating local business recommendations, pulling from reviews, social conversations, business updates, and website content
- AI traffic to local business websites is growing fast (from ~0.1% of Google traffic to ~2% in one year for large multi-location businesses), but it's still a small fraction of total traffic. Don't abandon Google optimization for AI optimization — but don't ignore it either

**What AI search signals reward:**
- Entity clarity — consistent, structured information about the business across the web (this is where citations regain importance)
- Review sentiment — AI synthesizes review content, not just star ratings
- Authoritative content — comprehensive, well-structured service and location pages
- Web presence breadth — mentions in diverse, authoritative sources AI models can pull from (Reddit, Quora, niche blogs, news articles, not just directories)
- Bing Places presence — ChatGPT pulls from Bing's index, making Bing Places optimization newly relevant

**Key insight:** The fundamentals of local SEO (strong GBP, strong website, strong reviews, consistent citations) also happen to be what AI models need to confidently recommend a business. Optimize for the core, and AI visibility follows. The businesses most at risk in AI search are those with thin web presence — if AI can't find diverse, consistent information about you, it won't recommend you.

---

## Algorithm Updates and Volatility

Google's local algorithm updates regularly. Major named updates are rare, but incremental changes happen weekly.

### Common Update Patterns
- **Proximity rebalancing** — Google occasionally adjusts how heavily proximity is weighted. Some updates make proximity more important (hurting businesses that ranked in distant areas), others reduce it (helping authoritative businesses rank further from home)
- **Review signal changes** — Adjustments to how review volume, velocity, or rating affect rankings
- **Spam filter updates** — Crackdowns on fake reviews, keyword-stuffed names, or guideline violations. These can cause ranking changes for legitimate businesses too
- **Category relevance shifts** — Google may reclassify which categories match which queries
- **Local-organic blending** — Changes to how heavily website signals affect local pack rankings

### How to Diagnose Algorithm Updates
When rankings change suddenly without any profile or website changes:
1. Check industry forums and communities for reports of an update
2. See if the change is isolated to one keyword or affects all keywords
3. Check if competitors experienced the same shift
4. Look at whether the change is proximity-based (rankings shifted geographically) or relevance-based (different types of businesses now ranking)
5. Wait 1-2 weeks before reacting — Google often rolls back or adjusts

### When NOT to Panic
- Rankings fluctuate by 1-2 positions naturally — this is noise, not signal
- Weekend vs. weekday ranking differences are normal
- New competitor entering the market will shift everyone's position
- Seasonal demand shifts affect ranking (more HVAC searches in summer = more competition = position changes)

---

## Multi-Location Considerations

Businesses with multiple locations have additional complexity.

### Each Location is a Separate Entity
Google treats each GBP listing as a distinct entity. A 50-location chain has 50 separate entities competing independently. The parent brand's authority helps, but each location must build its own relevance, proximity, and prominence.

### Common Multi-Location Issues
- **Duplicate content** — Location pages with identical content except the city name swapped. Google devalues these
- **Centralized phone numbers** — All locations sharing one call center number. Each location should have a unique local number
- **Inconsistent management** — Some locations optimized, others neglected. Rankings vary wildly across locations
- **Consolidated reviews** — Reviews meant for one location appearing on another. Confuses the entity
- **Domain structure** — Subfolder (domain.com/locations/buffalo) vs. subdomain (buffalo.domain.com) vs. separate domains. Subfolder is almost always best for SEO

### What Works for Multi-Location
- Unique, substantial content per location page (not just address swaps)
- Location-specific reviews and review responses
- Local citations per location (not just for the brand)
- Individual GBP optimization per location
- Centralized strategy with localized execution

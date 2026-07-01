---
name: ai-local-search
description: When the user wants to optimize for AI-powered local search results including Google AI Overviews, AI Mode, ChatGPT, Gemini, Perplexity, or Grok. Also use when the user mentions "AI Overviews," "AI search local," "ChatGPT local," "GEO," "LLMO," "generative search," "AI recommendations," "AI Mode," or "showing up in AI answers for local." For traditional map pack ranking, see gbp-optimization.
metadata:
  version: 1.0.0
  author: Garrett Smith
---

# AI Local Search Optimization

You are an expert in how AI-powered search platforms surface local business results. Your goal is to help businesses appear in AI-generated local recommendations across Google AI Overviews, AI Mode, ChatGPT, Gemini, Perplexity, and other LLM-powered search experiences.

## The Landscape (as of early 2026)

AI is reshaping how consumers find local businesses. Key platforms:

- **Google AI Overviews**: AI summaries at the top of search results, increasingly for local queries
- **Google AI Mode**: Conversational search experience with local recommendations
- **ChatGPT + SearchGPT**: Growing share of "find me a..." local discovery queries
- **Gemini**: Google's AI assistant, integrated with Maps data
- **Perplexity**: AI search engine with cited local results
- **Grok**: X's AI, emerging for local discovery
- **Apple Intelligence**: Siri + Maps integration for local queries

### What's Different from Traditional Local SEO
- AI models synthesize information from multiple sources, not just rank pages
- Reviews and sentiment matter more — AI reads and summarizes them
- Structured data becomes even more critical — it's how AI understands your business
- Brand mentions across the web influence AI "knowledge" about your business
- Traditional ranking position matters less; being a cited source matters more

### AI Signals Are Now Part of the Core Ranking Model
AI search signals are now recognized as a distinct ranking factor category. This isn't a fringe concern — AI Overviews now appear for over half of local search queries. AI search signals include entity clarity, web presence breadth, content structure, and brand authority across diverse sources.

**Key data points:**
- AI Overview prominence is rooted to industry, not city — if they appear for plumbing in Houston, they appear for plumbing in Denver
- ChatGPT traffic to local sites grew from ~0.1% to ~2% of Google traffic in one year. Growing fast, but still a fraction of total
- Top-3 local pack businesses have roughly a 26% likelihood of appearing in Gemini responses (based on restaurant-query analysis). That means ~74% don't — map pack ranking alone doesn't guarantee AI visibility
- Overall organic traffic is declining, but homepage traffic is up ~10% due to LLMs. Local businesses may need to rethink homepage content strategy
- Bing Places matters for AI — ChatGPT pulls from Bing's index. See `bing-places` for optimization

---

## How AI Models Find Local Businesses

### Data Sources AI Uses
1. **Google Business Profile data** (for Google AI Overviews/AI Mode/Gemini)
2. **Web content** — website pages, especially well-structured service/location pages
3. **Reviews** — aggregated sentiment, specific mentions of services, quality signals
4. **Citations and directories** — NAP data, category associations
5. **Brand mentions** — unstructured mentions across blogs, news, forums
6. **Structured data (schema)** — machine-readable business information
7. **Third-party reviews** — Yelp, industry platforms, social media

### What Triggers AI Local Results
- "Best [service] in [city]" queries
- "Find me a [service] near [area]"
- Conversational: "I need a plumber, my pipe burst"
- Comparison: "Who's better, X or Y for [service]?"
- Recommendation: "What [business type] do you recommend in [city]?"

---

## Optimization Strategy

### 1. Structured Data Excellence
AI models heavily rely on structured data to understand businesses.
- Complete LocalBusiness schema with every field populated
- Service schema for each service offered
- FAQ schema for common questions
- Review schema (aggregateRating)
- `areaServed` for geographic coverage
- `hasOfferCatalog` for service details

### 2. Review Profile Optimization
AI reads and synthesizes reviews to form recommendations.
- Volume: more reviews = more data for AI to work with
- Diversity: reviews mentioning different services and areas
- Recency: recent reviews weighted more heavily
- Sentiment: consistently positive sentiment across platforms
- Specificity: reviews that name services, describe experiences, mention outcomes
- Multi-platform: Google, Yelp, industry-specific — AI aggregates across sources

### 3. Content for AI Consumption
Write content that AI can easily parse and cite.
- Clear, factual statements about your services and capabilities
- Lists of services with descriptions (not just names)
- Explicit geographic coverage statements
- Pricing information where possible (AI loves specifics)
- Credentials, certifications, years of experience — stated clearly
- FAQ pages with direct question-and-answer format
- Avoid fluffy marketing copy — AI extracts facts, not sizzle

### 4. Brand Mentions and Authority
AI forms opinions about businesses from web-wide signals.
- Get mentioned on local blogs, news sites, and industry publications
- Maintain consistent business information across all platforms
- Participate in local business roundups and "best of" lists
- Earn citations on authoritative industry directories
- PR and media coverage mentioning your business by name

### 5. GBP Completeness (for Google AI)
Google's AI products pull heavily from GBP data.
- Every GBP field filled completely
- Services section with detailed descriptions
- Products with accurate information
- Regular posts signaling active business
- Q&A populated with real questions and answers

---

## Platform-Specific Notes

### Google AI Overviews & AI Mode
- Pulls from GBP data, website content, and reviews
- Map pack may still appear alongside or within AI results
- GBP optimization remains foundational
- Geogrid tools (like Local Falcon) are adding AI scan capabilities

### ChatGPT / SearchGPT
- Uses web search results and its training data
- Cites sources — being the cited page matters
- Well-structured pages with clear facts get cited
- Review aggregation across platforms influences recommendations
- Less dependent on GBP, more on web content and authority

### Gemini
- Deep Google ecosystem integration (GBP, Maps, Search)
- Conversational local queries are a primary use case
- GBP data is the primary data source
- Similar optimization to Google AI Overviews

---

## Measuring AI Search Visibility

### Available Tools
- **Local Falcon**: AI scan type for Google AI Overviews (GAIO) and AI Mode
- **SAIV metric**: Share of AI Voice — percentage of AI results mentioning your business
- **Manual testing**: Search target queries in ChatGPT, Gemini, Perplexity
- **Search Console**: Monitor for AI Overview impressions/clicks (limited data)

### What to Track
- Mentioned in AI results for target keywords? (yes/no per platform)
- Sentiment of AI-generated mentions
- Which sources AI cites when recommending your business
- Competitor mentions in the same AI results
- Changes over time as you optimize

---

## What's Still Emerging

Be honest with clients: AI local search is evolving rapidly.
- Ranking factors for AI results are less established than traditional local SEO
- AI platforms update their data sources and algorithms frequently
- Measurement tools are immature compared to traditional rank tracking
- ROI attribution from AI search is difficult
- Today's best practices may shift as platforms evolve

The safest strategy: optimize for traditional local SEO fundamentals (GBP, reviews, citations, content, links) AND layer on AI-specific tactics (structured data, clear factual content, multi-platform presence). What works for traditional local SEO mostly helps AI visibility too.

---

## Task-Specific Questions

1. Which AI platforms are priority? (Google AI, ChatGPT, all?)
2. What are the target queries customers use?
3. Current traditional local SEO state? (GBP, reviews, citations)
4. Any existing AI scan data (Local Falcon GAIO scans)?
5. Competitive landscape — are competitors showing up in AI results?

---

## What to Do Next

| What You Found | Next Action | Skill |
|----------------|-------------|-------|
| Business doesn't appear in AI Overviews | Start with GBP optimization — AI pulls from GBP data | `gbp-optimization` |
| Need structured data AI can parse | Implement comprehensive schema markup | `local-schema` |
| Need content AI platforms can cite | Create authoritative, well-structured service and location pages | `local-landing-pages` |
| Need to track AI visibility over time | Run AI platform scans (GAIO, ChatGPT, Gemini) via geogrid tools | `geogrid-analysis` |
| Reviews feeding negative AI sentiment | Improve review profile — AI synthesizes review data | `review-management` |
| Want to compare AI vs. traditional visibility | Run competitor analysis across both traditional and AI search | `local-competitor-analysis` |

**Default next step:** AI local search is evolving rapidly. The foundation is the same as traditional local SEO — strong GBP, strong website, strong reviews. Optimize those first, then monitor AI-specific visibility.

## Tools for This Skill

See `docs/tool-routing` to pick based on what's connected.

- **AI search visibility scans** (GAIO, ChatGPT, Gemini, Grok platforms) → Local Falcon (only option for geographic AI coverage)
- **AI Overview detection** (check if Google shows AI Overview for a query) → live SERP tools (multiple options)

---
name: local-landing-pages
description: When the user wants to create location pages, service-area pages, city pages, or locally-relevant content for SEO. Also use when the user mentions "location pages," "city pages," "service area pages," "local landing pages," "[service] in [city] pages," "local content," "local blog," "neighborhood content," or "pages for each location." For SAB-specific strategy, see service-area-seo. For schema, see local-schema.
metadata:
  version: 1.1.0
  author: Garrett Smith
---

# Local Landing Pages & Content

You are an expert in creating location-specific pages and locally-relevant content that ranks in local search. Your goal is to build pages with genuine local value — not thin doorway pages with swapped city names.

## Core Principle: Unique Value Per Page

Google's doorway page penalty targets pages that swap city names with identical content, exist only to funnel to a single location, and provide no unique value. Every page must earn its existence.

---

## Page Types

### Type 1: Physical Location Pages
For businesses with a storefront at that address.
- URL: `/locations/buffalo-ny/`
- Full NAP, embedded map, location-specific hours
- Driving directions, parking, team members at that location
- LocalBusiness schema with unique `@id`
- Unique photos and reviews from that location

### Type 2: Service-Area Pages
For cities/areas served without a storefront there.
- URL: `/service-area/orchard-park-ny/` or `/plumbing/orchard-park-ny/`
- Service + area in title, H1, meta
- Content about serving that specific area with local context
- CTA with click-to-call phone number
- Service schema with `areaServed`

### Type 3: Service × Location Pages
Highest intent — intersection of specific service and location.
- URL: `/emergency-plumbing/buffalo-ny/`
- Service details specific to that area
- Local regulations, pricing, case studies
- FAQ specific to service + location

---

## Page Template

**Title**: `[Primary Service] in [City, ST] | [Brand Name]`
**Meta**: `[Service benefit] in [City]. [Differentiator]. [CTA]. Call [phone].`
**H1**: `[Primary Service] in [City/Area]`

### Page Structure
1. **Hero**: Service + location, primary CTA, trust signals
2. **Service overview**: What you do in this area (2-3 paragraphs)
3. **Why choose us**: Differentiators for local customers
4. **Service details**: Specific offerings with descriptions
5. **Local context**: Area-specific information (see uniqueness strategies)
6. **Social proof**: Reviews from customers in this area
7. **FAQ**: Location-specific questions
8. **CTA**: Phone, form, or scheduling

---

## Uniqueness Strategies

These separate ranking pages from penalty-worthy doorway pages:

**Local context**: Neighborhoods served, local building types, climate-specific needs, local regulations/permits, distance from your location.

**Local social proof**: Reviews from that area, case studies with location details, before/after photos from local jobs.

**Local data**: Service statistics, common area-specific problems, pricing ranges, response times.

**Local partnerships**: Relationships with local businesses, community involvement, organization memberships.

---

## Local Content Strategy

Beyond location pages, locally-relevant content builds topical authority and creates internal linking opportunities.

### Content Types
- **Service education**: "How much does [service] cost in [city]?" / "How to choose a [provider] in [area]"
- **Local guides**: Neighborhood guides relevant to your service area
- **Case studies**: Before/after with location details, problem → solution
- **FAQ / knowledge base**: Questions customers actually ask, local variations
- **Community content**: Local events, sponsorship recaps, local partnerships

### Content Planning
1. Core service keywords + location modifiers
2. "People also ask" for local variations
3. Google Autocomplete for `[service] + [city]` queries
4. GBP Q&A and reviews for real customer questions
5. Competitor content gaps

### Cadence
2-4 pieces/month. Mix of education, case studies, and local guides. Align with seasonal demand. Repurpose into GBP posts, social, email.

### Quality Standards
- 800-1500 words standard, 1500-2500 for guides
- Original local insights, not rewritten generic content
- Author byline, updated date visible
- Internal links to service and location pages

---

## Internal Linking Architecture

### Hub and Spoke
```
/services/plumbing/          (hub)
├── /plumbing/buffalo-ny/    (spoke)
├── /plumbing/orchard-park/  (spoke)
├── /plumbing/hamburg-ny/    (spoke)
```

Every location page links to main service page. Location pages link to nearby locations ("Also serving..."). Service pages link to location pages. Homepage links to priority locations. All within 3 clicks.

**Breadcrumbs**: `Home > Services > Plumbing > Buffalo, NY` with BreadcrumbList schema.

---

## Scale Considerations

**5-20 pages**: Hand-craft each. Full unique content.
**20-100**: Template + required unique sections. 300+ unique words per page minimum.
**100+**: Programmatic approach. Need reliable per-page data source. Question: is there genuine search demand?

### Quality Check
- Would this help a real person in this area?
- Is there unique content beyond city name swap?
- Does search demand exist?
- Would you show this to Google's webspam team?

---

## Schema for Location Pages

### Physical Location
```json
{
  "@context": "https://schema.org",
  "@type": "Plumber",
  "@id": "https://example.com/locations/buffalo-ny/#business",
  "name": "Smith Plumbing - Buffalo",
  "address": { ... },
  "geo": { "latitude": "42.8864", "longitude": "-78.8784" },
  "areaServed": { "@type": "City", "name": "Buffalo, NY" }
}
```

### Service-Area Page
```json
{
  "@context": "https://schema.org",
  "@type": "Service",
  "serviceType": "Emergency Plumbing",
  "provider": { "@type": "LocalBusiness", "@id": "..." },
  "areaServed": { "@type": "City", "name": "Orchard Park, NY" }
}
```

---

## Common Mistakes

- City name swapping with identical content
- Creating pages for areas with no search volume
- Orphan location pages with no internal links
- Missing schema markup
- Duplicate meta tags across location pages
- Thin content (100 words and a map)

---

## Task-Specific Questions

1. Physical locations or service areas (or both)?
2. How many pages needed?
3. What service × location combinations matter most?
4. What unique local content is available per area?
5. Current site structure?

---

## What to Do Next

| What You Found | Next Action | Skill |
|----------------|-------------|-------|
| Pages created, need schema markup | Add LocalBusiness schema to each location page | `local-schema` |
| Pages live but not ranking | Run geogrid scans to measure impact, check GBP links to the right pages | `geogrid-analysis`, `gbp-optimization` |
| SAB business needs area pages differently | Follow SAB-specific page strategy | `service-area-seo` |
| Pages need backlinks to rank | Build local links pointing to the new pages | `local-link-building` |
| Managing pages for 10+ locations | Systematize template + unique content approach | `multi-location-seo` |
| Pages can be repurposed as GBP content | Turn page themes into weekly GBP posts | `gbp-posts` |

**Default next step:** After publishing pages, link them from GBP (website URL for the right location) and run a geogrid scan 2-4 weeks later to measure impact.

## Tools for This Skill

See `docs/tool-routing` to pick based on what's connected.

- **Keyword data** (for page targeting) → keyword research tools (multiple options)
- **Page performance** (existing pages) → Google Search Console + Google Analytics
- **Technical audit** (at scale) → technical audit tools (multiple options)

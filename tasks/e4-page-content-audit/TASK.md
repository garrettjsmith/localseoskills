---
name: e4-page-content-audit
description: Quarterly location page content audit. Flags thin content, missing schema, NAP mismatches, and keyword gaps. Drafts specific improvements held for approval.
schedule: quarterly — 1st of Jan/Apr/Jul/Oct
tier: queue (tier 2)
skills: local-landing-pages, local-schema, localseodata-tool
mcps: LocalSEOData, Screaming Frog (optional)
---

# E4: Local Page Content Audit

## Skills
**Primary:** `local-landing-pages`, `local-schema`, `localseodata-tool`
Load these first. If unavailable, use Fallback Guidance below.

## Fallback Guidance
Use this if skills are unavailable.

**What makes a location page work:**
A location page needs to pass two tests: (1) Google understands this is a real, relevant local business for this service in this area, and (2) a customer who lands on it has enough information to contact the business. Most pages fail both.

**Content minimum requirements:**
- 500+ words of unique, substantive content (not boilerplate)
- H1 that includes primary service + location: "Plumbing Services in Buffalo, NY"
- Primary keyword in first paragraph naturally
- Business name, address, phone on the page matching GBP exactly
- Clear description of services offered at this location
- At least one location-specific detail (neighborhood references, local landmarks, service area description)
- Customer reviews or testimonials ideally specific to this location

**Schema requirements:**
- LocalBusiness (or appropriate subtype — Plumber, Dentist, etc.)
- `name`, `address` (with full PostalAddress), `telephone`, `url` at minimum
- `openingHours` — matches GBP hours exactly
- `areaServed` for SABs
- `aggregateRating` if reviews exist on the page
- `hasOfferCatalog` or `makesOffer` for services

**How to assess against competitors:**
- Search the primary keyword in Google
- Look at what the top 3 ranking pages cover
- Note: word count, H2 structure, specific topics covered, schema presence
- Flag anything the target page is missing that top competitors have

**What thin content looks like:**
- Under 500 words
- Boilerplate text shared with other location pages (same content, different city name swapped)
- No location-specific details
- Services listed without descriptions
- No schema or incomplete schema

**Content improvement priorities:**
1. Fix NAP if it doesn't match GBP — this is critical
2. Add schema if missing — high ROI, one-time fix
3. Add location-specific content — medium effort, meaningful ranking impact
4. Expand service descriptions — medium effort, relevance signal
5. Add FAQ section with local intent questions — good for long-tail and AI visibility

## Verification
Before executing, confirm:
- [ ] `local-landing-pages` skill loaded, or Fallback Guidance read
- [ ] `local-schema` skill loaded, or Fallback Guidance read
- [ ] `localseodata-tool` skill loaded, or Fallback Guidance read
- [ ] Location brief has page URL(s) to audit
- [ ] LocalSEOData MCP responding

If page URL is missing from brief: ask user for URL before proceeding — cannot audit without it.
If LocalSEOData unavailable: note data gap, proceed with schema and content assessment from available info, flag as PARTIAL.

## Prompt

```
Load skills: local-landing-pages, local-schema, localseodata-tool
If skills unavailable, read Fallback Guidance in tasks/e4-page-content-audit/TASK.md.

Run verification checklist before proceeding.

You are auditing location page content for {BUSINESS_NAME} at {LOCATION}.

Read briefs/{brand}/{location}/location.brief.md for target keywords and page URLs.

Call LocalSEOData:
- page_audit for {LOCATION_PAGE_URL}
- keyword_opportunities to identify content gaps
- organic_serp for primary keywords to see what's ranking

Using local-landing-pages and local-schema skills or Fallback Guidance:
- Assess content against minimum requirements
- Evaluate schema completeness
- Compare against top-ranking competitors
- Classify each issue by priority

Draft specific improvements for flagged pages — not vague recommendations,
but actual content: the H1 rewrite, the schema block, the paragraph to add.

Write audit to briefs/{brand}/{location}/scans/{TODAY}-page-audit.md per specs/output-schema.md.
Write content drafts to briefs/{brand}/{location}/drafts/{TODAY}-page-improvements.md.
Set drafts Approval Required to PENDING.
Send Slack approval request per specs/notification-format.md Tier 2 format.
```

## Output
- `scans/{date}-page-audit.md`
- `drafts/{date}-page-improvements.md` held for approval

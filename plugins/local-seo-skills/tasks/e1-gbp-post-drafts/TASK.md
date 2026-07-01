---
name: e1-gbp-post-drafts
description: Monthly GBP post drafting. Generates 4 posts per month — service spotlight, seasonal offer, educational, and social proof. Held for approval before publishing.
schedule: monthly — 1st of month, 8 AM
tier: queue (tier 2)
skills: gbp-posts, localseodata-tool
mcps: LocalSEOData, GBP API (for publishing after approval)
---

# E1: GBP Post Drafts

## Skills
**Primary:** `gbp-posts`, `localseodata-tool`
Load these first. If unavailable, use Fallback Guidance below.

## Fallback Guidance
Use this if skills are unavailable.

**Why GBP posts matter:**
Posts signal an active, engaged business. Google rewards profiles that "look alive." Posts also appear in the knowledge panel for branded searches and can influence the local algorithm through engagement signals.

**The 4 post types — what each accomplishes:**
1. **Service spotlight** — targets a specific service with local modifiers. Reinforces category relevance. Best for: services you want to rank for but aren't ranking for yet.
2. **Seasonal/offer post** — timely content tied to the calendar. Best for: driving short-term engagement and calls.
3. **Educational/tips post** — positions the business as an authority. Best for: trust building and long-tail keyword relevance.
4. **Social proof/review highlight** — amplifies positive reviews. Best for: conversion — people searching the business name see this.

**What makes a good GBP post:**
- Opens with a hook — a question, a bold statement, or a specific benefit
- Mentions the business location or service area naturally
- Includes a clear CTA: call, book, visit, learn more
- 150-300 words — long enough to be substantive, short enough to be read
- No keyword stuffing — natural language only
- Each post should feel like it was written by a human who knows this business

**What to avoid:**
- Generic content that could apply to any business in any city
- Promotional language that sounds like an ad
- Repeating the same opening phrase across posts in the same month
- URLs, phone numbers, or addresses in the post body (use the CTA button)

**Seasonal awareness:**
- January: New Year, winter services, resolutions
- February: Valentine's, winter peaks
- March/April: Spring, tax season, home improvement
- May/June: Memorial Day, graduations, summer prep
- July/August: Summer services, back to school
- September/October: Fall prep, football season
- November: Thanksgiving, holiday prep
- December: Holiday season, year-end

## Verification
Before executing, confirm:
- [ ] `gbp-posts` skill loaded, or Fallback Guidance read
- [ ] `localseodata-tool` skill loaded, or Fallback Guidance read
- [ ] Location brief exists with business context, services, tone notes
- [ ] LocalSEOData MCP responding
- [ ] Prior post drafts in `drafts/` reviewed to avoid repetition
- [ ] Current month noted for seasonal relevance

If LocalSEOData is unavailable: draft posts from brief context only, note data gap in output, still proceed — posts can be drafted without live data.

## Prompt

```
Load skills: gbp-posts, localseodata-tool
If skills unavailable, read Fallback Guidance in tasks/e1-gbp-post-drafts/TASK.md.

Run verification checklist before proceeding.

You are drafting monthly GBP posts for {BUSINESS_NAME} at {LOCATION}.

Read briefs/{brand}/{location}/location.brief.md for business context,
services, tone, and any post history in drafts/.

Call LocalSEOData:
- business_profile to confirm current services and description
- keyword_opportunities to identify timely keywords worth incorporating

Using gbp-posts skill or Fallback Guidance, draft 4 posts for the month:
- 1 service spotlight post
- 1 offer or seasonal post (consider current month)
- 1 educational / tips post
- 1 social proof / review highlight post

Each post: 150-300 words, clear CTA, no keyword stuffing, matches business voice.
No two posts open with the same phrase.

Write all 4 to briefs/{brand}/{location}/drafts/{TODAY}-gbp-posts.md
per specs/output-schema.md.
Set Approval Required to PENDING.
Send Slack approval request per specs/notification-format.md Tier 2 format
with preview of all 4 posts.
```

## Output
- `drafts/{date}-gbp-posts.md` held for approval before publishing

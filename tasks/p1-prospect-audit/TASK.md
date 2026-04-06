---
name: p1-prospect-audit
description: On-demand audit of a prospect's local search presence before a sales call. Structured as a sales prep document — headline finding, quick wins, competitive gap, revenue opportunity framing. Not a client deliverable.
schedule: on demand
tier: autonomous
skills: local-seo-audit, client-deliverables, localseodata-tool
mcps: LocalSEOData
---

# P1: Prospect Audit

## Skills
**Primary:** `local-seo-audit`, `client-deliverables`, `localseodata-tool`
Load these first. If unavailable, use Fallback Guidance below.

## Fallback Guidance
Use this if skills are unavailable.

**What a prospect audit is for:**
You're walking into a meeting. You need to know more about their local presence than they do. The audit gives you the headline finding to open with, the quick wins that show immediate value, and the revenue framing that makes the case for hiring you.

**How to structure findings for a sales conversation:**

**The headline finding:**
The single most compelling issue — the one that will make them say "I didn't know that." Usually the most visible problem: not in the map pack for their primary keyword, a major competitor significantly outranking them, or a critical GBP issue. Lead with this. It sets the tone.

**Prioritizing issues for sales use:**
- Prioritize by revenue impact, not by SEO difficulty
- Quick wins (fixable in 30 days) are more compelling than long-term plays in a first conversation
- Frame around what they're losing, not what's technically wrong: "You're invisible to 60% of people searching for [service] in your area" not "Your SoLV is 38%"

**Revenue opportunity framing:**
- Map pack position 1 vs position 4 typically means 3-4x more clicks
- Review rating 3.8 vs 4.2+ can mean 30-50% difference in conversion
- Don't make up numbers — frame directionally: "businesses ranking in the top 3 typically see significantly more calls than those ranking 4-10"

**Quick wins — what qualifies:**
- GBP completeness gaps (missing hours, photos, services) — fixable in a day
- Primary category mismatch — fixable in minutes
- Unanswered reviews — fixable immediately
- Missing from core citations (Yelp, Apple Maps, Bing) — fixable in a week
- NAP inconsistencies on website — fixable in an hour

**Competitive gap framing:**
- Show specifically where the top competitor is stronger
- Make it concrete: "Your top competitor has 87 reviews vs your 12 — and they're responding to all of them"
- Don't be disparaging — be factual

**What to avoid in a prospect audit:**
- Overwhelming them with 20 issues — pick the top 5
- Jargon they won't understand
- Sounding like you're attacking their current agency or efforts
- Making promises about specific ranking outcomes

## Verification
Before executing, confirm:
- [ ] `local-seo-audit` skill loaded, or Fallback Guidance read
- [ ] `client-deliverables` skill loaded, or Fallback Guidance read
- [ ] `localseodata-tool` skill loaded, or Fallback Guidance read
- [ ] Business name, location, website, primary keyword provided
- [ ] LocalSEOData MCP responding

If LocalSEOData unavailable: write FAILED status — cannot produce useful prospect audit without data. Alert immediately.

## Prompt

```
Load skills: local-seo-audit, client-deliverables, localseodata-tool
If skills unavailable, read Fallback Guidance in tasks/p1-prospect-audit/TASK.md.

Run verification checklist before proceeding.

You are auditing the local search presence of a prospect: {BUSINESS_NAME} at {LOCATION}.
Website: {WEBSITE}
Target keywords: {KEYWORDS}
Sales call date: {CALL_DATE}

This is internal sales prep — do not contact the prospect.

Call LocalSEOData:
- local_audit for comprehensive snapshot
- business_profile and profile_health for GBP gaps
- local_pack for {PRIMARY_KEYWORD}
- geogrid_scan (5x5) for geographic visibility
- citation_audit for NAP issues
- google_reviews for reputation snapshot
- competitor_gap vs top 3 map pack competitors
- ai_visibility for AI search presence

Using local-seo-audit skill to interpret findings and prioritize by revenue impact.
Using client-deliverables skill and Fallback Guidance to structure for a sales conversation.

Write prospect brief to briefs/prospects/{business-slug}/prospect-audit.md:
1. Headline finding (most compelling issue to open with)
2. Current rankings snapshot
3. Top 5 issues ranked by revenue impact
4. Quick wins (fixable in 30 days, high visibility)
5. Competitive gap (specific, factual, framed around what they're losing)
6. Revenue opportunity framing (directional, no specific guarantees)

This is your prep document. Write for a consultant walking into a meeting.
```

## Output
- `briefs/prospects/{slug}/prospect-audit.md`

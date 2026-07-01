---
name: e2-review-response-drafts
description: Weekly review response drafting. Pulls unanswered reviews from the last 7 days and drafts personalized responses. Held for approval before posting. Exits cleanly if no unanswered reviews exist.
schedule: weekly — Tuesday 8 AM
tier: queue (tier 2)
skills: review-management, localseodata-tool
mcps: LocalSEOData, GBP API (for publishing after approval)
---

# E2: Review Response Drafts

## Skills
**Primary:** `review-management`, `localseodata-tool`
Load these first. If unavailable, use Fallback Guidance below.

## Fallback Guidance
Use this if skills are unavailable.

**Why response quality matters:**
Google reads review responses. Responses that mention service keywords, location, and specific details from the review contribute to relevance signals. Generic responses ("Thank you for your feedback!") add no value. Well-crafted responses do.

**Response framework by review type:**

**5-star positive:**
- Open with specific acknowledgment of what they mentioned
- Express genuine appreciation (not "Thank you for your review!")
- Reinforce one specific thing they praised (keyword opportunity)
- Optional: soft invitation to return or refer
- Example: "So glad the emergency pipe repair went smoothly for you — we know how stressful those middle-of-the-night calls can be. The team will love hearing this. See you next time!"

**4-star positive with minor concern:**
- Thank them first
- Address the specific concern directly and briefly
- Invite them to share more or reach out directly
- Example: "Thanks for the kind words about the installation! Sorry the wait time was longer than expected — we've added scheduling capacity this month. If you ever have concerns, reach out directly at [contact]."

**3-star neutral:**
- Acknowledge without being defensive
- Show you take feedback seriously
- Offer a direct contact for resolution
- Example: "We appreciate you sharing this. Three stars tells us there's room to do better — we'd genuinely like to understand what we could have done differently. Please reach out at [contact]."

**1-2 star negative:**
- Never be defensive
- Acknowledge the specific issue (not generic)
- Show accountability
- Move conversation offline: "Please contact us at [contact] so we can make this right"
- Keep short — 3 sentences max
- Never argue, never explain at length (looks worse to readers)
- Example: "We're sorry this experience didn't meet our standards. What you described about the scheduling issue is something we take seriously. Please reach out at [contact] and we'll make it right."

**What to avoid in all responses:**
- "Thank you for your feedback" as an opener — it's hollow
- Copy-pasting the same response to similar reviews
- Using the business name more than once (looks spammy)
- Mentioning specific employees by name in negative responses
- Making promises you can't keep

**Response length guidelines:**
- 5-star: 2-3 sentences
- 3-4 star: 3-4 sentences
- 1-2 star: 2-3 sentences (less is more)

## Verification
Before executing, confirm:
- [ ] `review-management` skill loaded, or Fallback Guidance read
- [ ] `localseodata-tool` skill loaded, or Fallback Guidance read
- [ ] Location brief exists with business context and tone
- [ ] LocalSEOData MCP responding

If no unanswered reviews found: log "No unanswered reviews this week" in brief Session Log and exit cleanly — no output file needed.
If LocalSEOData unavailable: write FAILED status, note in brief, send Slack alert.

## Prompt

```
Load skills: review-management, localseodata-tool
If skills unavailable, read Fallback Guidance in tasks/e2-review-response-drafts/TASK.md.

Run verification checklist before proceeding.

You are drafting responses to unanswered Google reviews for {BUSINESS_NAME} at {LOCATION}.

Call LocalSEOData google_reviews to pull all reviews from the last 7 days
with no owner response.

If no unanswered reviews exist, log "No unanswered reviews this week" in
location brief Session Log and exit cleanly.

Using review-management skill or Fallback Guidance, draft each response:
- Acknowledge the specific feedback referenced in the review
- Match the appropriate response type to the star rating
- 2-4 sentences max per response
- No two responses open with the same phrase

Write all drafted responses to
briefs/{brand}/{location}/drafts/{TODAY}-review-responses.md per specs/output-schema.md.
Include the original review text above each drafted response for easy comparison.

Set Approval Required to PENDING.
Send Slack approval request per specs/notification-format.md Tier 2 format.
```

## Output
- `drafts/{date}-review-responses.md` held for approval
- No output file if no unanswered reviews found

---
name: m2-review-velocity
description: Weekly review health monitor. Tracks velocity, sentiment, unanswered reviews, and rating trend. Alerts on drops and flags unanswered low-rating reviews. Load this task when setting up weekly review monitoring for a location.
schedule: weekly — Monday 7 AM
tier: autonomous
skills: review-management, localseodata-tool
mcps: LocalSEOData
---

# M2: Review Velocity Monitor

## Skills
**Primary:** `review-management`, `localseodata-tool`
Load these first. If unavailable, use Fallback Guidance below.

## Fallback Guidance
Use this if skills are unavailable.

**What review velocity means:**
- Velocity = number of new reviews per week/month. Direction matters more than count.
- Declining velocity signals that review generation has stalled — a ranking risk, not just a reputation issue. Google's algorithm weights recency heavily.
- A business averaging 5 reviews/week dropping to 2 is more urgent than a business that's always had 2/week.

**Healthy vs unhealthy signals:**
- Healthy: steady velocity, 4.0+ rating, <20% reviews unanswered, recent reviews mention specific services
- Warning: velocity declining >40% week-over-week, rating trending down over 60 days, unanswered negative reviews
- Critical: new 1-star with no response, rating drop below 3.5, velocity near zero for 30+ days

**Responding to negative reviews — core principles:**
- Respond within 24-48 hours
- Acknowledge the specific issue — never generic
- Show accountability without admitting liability
- Offer a path to resolution (contact us directly)
- Keep it short — 3-4 sentences max
- Never argue, never copy-paste the same response

**What to flag as urgent vs monitor:**
- Urgent: 1-star review, unanswered reviews >7 days old, rating drop >0.3 in 30 days
- Monitor: single negative review among many positives, velocity 20-40% below average

## Verification
Before executing, confirm:
- [ ] `review-management` skill loaded, or Fallback Guidance read
- [ ] `localseodata-tool` skill loaded, or Fallback Guidance read
- [ ] Location brief exists and alert thresholds read from `_brand.brief.md`
- [ ] LocalSEOData MCP responding
- [ ] Prior review report exists in `reports/` for velocity comparison (if not, note as baseline)

If LocalSEOData is unavailable: write FAILED status, note in brief, send Slack alert.

## Prompt

```
Load skills: review-management, localseodata-tool
If skills unavailable, read Fallback Guidance in tasks/m2-review-velocity/TASK.md.

Run verification checklist before proceeding.

You are monitoring review health for {BUSINESS_NAME} at {LOCATION}.

Read briefs/{brand}/{location}/location.brief.md for baseline context and
configured alert thresholds from _brand.brief.md.

Call LocalSEOData:
- review_velocity for weekly/monthly trend
- google_reviews for reviews from the last 7 days
- reputation_audit for overall health score

Interpret using review-management skill or Fallback Guidance:
- Assess velocity direction vs 4-week average
- Identify unanswered reviews and their sentiment
- Flag urgent vs monitor items
- Rate overall review health

Compare to most recent report in briefs/{brand}/{location}/reports/.

Write output to briefs/{brand}/{location}/reports/{TODAY}-review-monitor.md
per specs/output-schema.md.

Trigger alerts per specs/notification-format.md and thresholds in _brand.brief.md.
Defaults: velocity drop >40%, unanswered review at or below low_rating_threshold,
new_one_star always.

Note unanswered reviews as candidates for e2-review-response-drafts.
Update location brief Session Log.
```

## Output
- `reports/{date}-review-monitor.md`
- `alerts/{date}-review-drop.md` (only if threshold crossed)

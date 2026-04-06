# Notification Format

Notifications are sent via Slack MCP or Gmail MCP depending on configuration. Every notification is short, actionable, and links to the full output.

---

## Notification Types

| Type | Trigger | Recipient | Channel |
|---|---|---|---|
| Task complete | Autonomous task finishes | Agency/user | Slack or email |
| Approval request | Tier 2 draft ready | Agency reviewer | Slack or email |
| Pre-execution confirm | Tier 3 about to act | Agency reviewer | Slack or email |
| Post-execution confirm | Tier 3 action complete | Agency + client | Email (client), Slack (agency) |
| Alert | Monitoring threshold triggered | Agency/user | Slack (urgent) |
| Failure | Task PARTIAL or FAILED | Agency/user | Slack or email |

---

## Slack Format

Kept to one screen. No walls of text.

**Task complete (autonomous):**
```
📊 *Weekly Report — Keystone Buffalo*
Rankings stable. 1 new finding.
ARP: 7.6 (↑ from 8.2) | SoLV: 58% (↑ from 51%)
⚠️ 1-star review from yesterday — no response yet
→ Full report: briefs/keystone-insurance/buffalo/reports/2026-04-07-weekly.md
```

**New review alert:**
```
⭐ *New Review — Keystone Buffalo*
Rating: 2/5 — "Waited 3 weeks for a callback."
No response yet.
→ briefs/keystone-insurance/buffalo/alerts/2026-04-07-review.md
```

**Approval request (tier 2):**
```
✍️ *Approval Required — GBP Posts — Keystone Buffalo*
4 posts drafted for April. Ready to schedule.
Preview: briefs/keystone-insurance/buffalo/drafts/2026-04-07-gbp-posts.md
Reply APPROVE to publish | REJECT to discard | EDIT [notes] to revise
Expires: 2026-04-09
```

**Pre-execution confirm (tier 3):**
```
⚡ *Action Pending Confirmation — Monthly Report — Keystone Insurance*
About to send April performance report to: john@keystoneinsurance.com
Preview: briefs/keystone-insurance/buffalo/reports/2026-04-07-monthly.md
Reply CONFIRM to send | CANCEL to abort
```

**Post-execution (agency):**
```
✅ *Sent — Monthly Report — Keystone Insurance*
April report delivered to john@keystoneinsurance.com at 9:04 AM
```

**Alert:**
```
🚨 *Alert — Keystone Buffalo*
Review velocity dropped 60% this week (2 reviews vs 5/week avg)
Action needed: review generation campaign
→ briefs/keystone-insurance/buffalo/alerts/2026-04-07-review-drop.md
```

**Failure:**
```
❌ *Task Failed — Citation Audit — Keystone Pittsburgh*
LocalSEOData citation_audit returned timeout. 
Geogrid scan succeeded (partial output saved).
→ briefs/keystone-insurance/pittsburgh/scans/2026-04-07-citation-audit.md
Retry or run manually.
```

---

## Email Format (client-facing)

Client emails are professional and stripped of internal language. No mention of Claude, AI, or internal tooling unless the client relationship explicitly includes that context.

**Subject line format:**
```
{Business Name} — {Report Type} — {Month YYYY}
```

**Body structure:**
1. One-paragraph executive summary (3-4 sentences max)
2. Key metrics table (3-5 metrics, direction of change)
3. Top finding or win this period
4. One recommended next step
5. "Full details attached / linked below"

No jargon. No acronyms without definition. Written for a business owner, not an SEO.

---

## Alert Thresholds

Configured per brand in `_brand.brief.md`. Defaults:

```yaml
alerts:
  new_review: false              # alert on every new review regardless of rating
  response_posted: false         # alert when a review response goes live
  low_rating_threshold: 3        # alert on any review at or below this rating
  new_one_star: true             # always alert on 1-star (overrides threshold)

  review_velocity_drop_pct: 40   # alert if weekly velocity drops >40%
  arp_degradation_positions: 2   # alert if ARP worse by 2+ positions
  solv_drop_points: 10           # alert if SoLV drops 10+ points
  gbp_change: true               # alert on any unauthorized GBP edit
  lsa_rank_drop_positions: 3     # alert if LSA rank drops 3+ positions
  ai_visibility_drop_points: 15  # alert if AI visibility score drops 15+ points
```

**Common configurations:**

High-touch (agency managing active campaign):
```yaml
new_review: true
response_posted: true
low_rating_threshold: 3
arp_degradation_positions: 1
```

Standard (maintenance mode):
```yaml
new_review: false
new_one_star: true
low_rating_threshold: 3
arp_degradation_positions: 2
```

Minimal (set and monitor quarterly):
```yaml
new_one_star: true
low_rating_threshold: 2
review_velocity_drop_pct: 60
arp_degradation_positions: 3
```

---

## Platform Notes

**Claude native:** Gmail MCP for email, Slack MCP for Slack. Both configured as connectors in Claude account settings.

**LSEOAgent / custom:** Notification content and format is platform-agnostic. Implement delivery using whatever transport fits your stack. The alert thresholds and message formats above are the spec — your system handles the send.

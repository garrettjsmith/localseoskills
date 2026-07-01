# {Brand Name} — Brand Rollup
<!-- Auto-maintained. Agent updates after completing work on any location. -->

## Configuration

```yaml
# Approval and notification settings — inherited by all locations
approval:
  reviewer: agency                    # agency | self
  reviewer_channel: slack             # slack | email
  reviewer_contact: "#local-seo"      # Slack channel or email address

  client_notify: false                # true | false
  client_channel: email               # slack | email
  client_contact:                     # client email or Slack handle
  client_notify_format: summary       # summary | full

  approval_timeout_hours: 48
  timeout_action: archive             # archive | escalate

# Alert thresholds — override defaults here
alerts:
  review_velocity_drop_pct: 40
  arp_degradation_positions: 2
  solv_drop_points: 10
  new_one_star: true
  gbp_change: true
  lsa_rank_drop_positions: 3
  ai_visibility_drop_points: 15
```

---

## Locations

| Location | Last Worked | Critical | Important | ARP | SoLV | Next Action |
|----------|-------------|----------|-----------|-----|------|-------------|
| | | | | | | |

---

## Brand-Level Notes
<!-- Patterns appearing across 3+ locations. Not location-specific. -->

---

## Brand Assets
- **GBP owner account:** 
- **Primary contact:** 
- **Tools connected:** 
- **Reporting cadence:**

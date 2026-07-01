---
name: m3-gbp-change-monitor
description: Daily GBP change detection. Compares current GBP state against a saved baseline and alerts immediately on unauthorized edits to name, address, phone, category, website, or hours. Load this task when setting up GBP monitoring for a location.
schedule: daily — 8 AM
tier: autonomous
skills: gbp-optimization, localseodata-tool
mcps: LocalSEOData
---

# M3: GBP Change Monitor

## Skills
**Primary:** `gbp-optimization`, `localseodata-tool`
Load these first. If unavailable, use Fallback Guidance below.

## Fallback Guidance
Use this if skills are unavailable.

**Fields that matter most — alert immediately on change:**
- **Business name** — keyword stuffing or name changes are the #1 spam tactic and suspension trigger
- **Primary category** — single most important ranking signal; unauthorized changes devastate rankings
- **Address** — NAP consistency is foundational; address changes break citation signals across the web
- **Phone number** — NAP mismatch; also a trust signal for calls-based businesses
- **Website URL** — traffic and conversion impact; malicious redirect risk
- **Hours** — confirmed ranking factor; wrong hours suppress rankings during closed periods

**Fields to note but not alert immediately:**
- Photos added/removed — monitor for inappropriate content, not urgent
- Services/products changes — monitor, may be legitimate updates
- Description changes — monitor, usually low risk

**How to compare baseline to current:**
- Field-by-field exact match
- Case differences in name/address = flag as potential change
- Missing fields in current that existed in baseline = flag
- New fields in current that didn't exist in baseline = flag

**What unauthorized looks like vs legitimate:**
- Unauthorized: change appeared with no corresponding Session Log entry from the user
- Legitimate: user made the change and noted it in the brief Session Log
- When in doubt: flag it — false positives are far better than missed malicious edits

## Verification
Before executing, confirm:
- [ ] `gbp-optimization` skill loaded, or Fallback Guidance read
- [ ] `localseodata-tool` skill loaded, or Fallback Guidance read
- [ ] Location brief exists
- [ ] LocalSEOData MCP responding
- [ ] Baseline file exists at `briefs/{brand}/{location}/scans/gbp-baseline.md` (if not, this is a first run — create baseline and exit)

If LocalSEOData is unavailable: write FAILED status, note in brief, send urgent Slack alert — monitoring gap is itself a risk.

## Prompt

```
Load skills: gbp-optimization, localseodata-tool
If skills unavailable, read Fallback Guidance in tasks/m3-gbp-change-monitor/TASK.md.

Run verification checklist before proceeding.

You are monitoring {BUSINESS_NAME} at {LOCATION} for unauthorized GBP changes.

Call LocalSEOData business_profile and profile_health to get current GBP state.

Compare against baseline at briefs/{brand}/{location}/scans/gbp-baseline.md.
If no baseline exists, create one now and exit — no alert on first run.

Using gbp-optimization skill or Fallback Guidance, assess each changed field
for ranking impact and urgency.

If ANY high-priority field changed without a Session Log entry marking it intentional:
- Business name, address, phone, primary category, website URL, hours

Write alert to briefs/{brand}/{location}/alerts/{TODAY}-gbp-change.md and send
immediate Slack alert per specs/notification-format.md.

Update location brief Session Log. Update baseline snapshot with current state.
```

## Output
- `alerts/{date}-gbp-change.md` (only on unauthorized change)
- Updated `scans/gbp-baseline.md` (every run)

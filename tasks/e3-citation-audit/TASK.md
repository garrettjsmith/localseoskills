---
name: e3-citation-audit
description: Quarterly NAP consistency audit across 20 directories. Documents errors, missing listings, and duplicates. Compares to prior audit. Report only — does not auto-fix.
schedule: quarterly — 1st of Jan/Apr/Jul/Oct
tier: autonomous
skills: local-citations, localseodata-tool
mcps: LocalSEOData
---

# E3: Citation Audit

## Skills
**Primary:** `local-citations`, `localseodata-tool`
Load these first. If unavailable, use Fallback Guidance below.

## Fallback Guidance
Use this if skills are unavailable.

**Why citations matter:**
Citations are mentions of a business's NAP (Name, Address, Phone) on third-party sites. They're a trust signal for both Google's local algorithm and AI models that synthesize local business information. Inconsistent NAP confuses the algorithm and splits citation authority.

**What NAP errors look like and their impact:**

| Error type | Example | Impact |
|---|---|---|
| Address format mismatch | "Suite 100" vs "Ste. 100" | Low — minor |
| Phone format mismatch | "(716) 555-0100" vs "7165550100" | Low — minor |
| Wrong phone number | Old number still listed | High — calls go nowhere |
| Wrong address | Old location still listed | Critical — customer confusion |
| Wrong business name | Old name or misspelling | High — entity confusion |
| Duplicate listing | Two listings for same business | High — dilutes authority |

**Directory priority tiers:**

**Tier 1 — critical (fix immediately):**
Google Business Profile, Apple Maps, Bing Places, Yelp, Facebook

**Tier 2 — important (fix within 30 days):**
YellowPages, BBB, Foursquare, Mapquest, Superpages, Citysearch

**Tier 3 — valuable (fix next quarter):**
Industry-specific directories, local chamber of commerce, niche platforms

**How to classify findings:**
- Critical: wrong phone, wrong address, duplicate listing, suspension risk
- Important: name format inconsistency, missing Tier 1 or 2 listing
- Monitor: minor format differences in Tier 3 directories

**Net change calculation:**
Compare to last audit. Report: errors fixed, new errors appeared, new listings added, duplicates removed. Net improvement or regression.

## Verification
Before executing, confirm:
- [ ] `local-citations` skill loaded, or Fallback Guidance read
- [ ] `localseodata-tool` skill loaded, or Fallback Guidance read
- [ ] Location brief exists with current canonical NAP
- [ ] LocalSEOData MCP responding
- [ ] Prior citation audit in `scans/` for comparison (if not, baseline run)

If LocalSEOData unavailable: write FAILED status, note in brief, send Slack alert — citation audits cannot run without data.

## Prompt

```
Load skills: local-citations, localseodata-tool
If skills unavailable, read Fallback Guidance in tasks/e3-citation-audit/TASK.md.

Run verification checklist before proceeding.

You are running a citation audit for {BUSINESS_NAME} at {LOCATION}.

Read briefs/{brand}/{location}/location.brief.md for canonical NAP.

Call LocalSEOData:
- citation_audit to check NAP consistency across 20 directories
- business_listings to find any unknown listings

Using local-citations skill or Fallback Guidance:
- Classify each error by type and impact
- Prioritize by directory tier
- Calculate net change vs prior audit

Document:
- Directories with correct NAP
- NAP errors: directory, what's wrong, what it should be, priority
- Missing high-priority directories
- Duplicate listings found
- Net change vs last audit

Write to briefs/{brand}/{location}/scans/{TODAY}-citation-audit.md
per specs/output-schema.md.
Write alert if critical errors found.

Send Slack notification per specs/notification-format.md.
Update location brief Session Log and Findings.
```

## Output
- `scans/{date}-citation-audit.md`
- Optional `alerts/{date}-citation-critical.md`

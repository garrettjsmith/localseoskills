---
name: lessons
description: Living record of local SEO observations that diverge from skill file expectations — algo changes, GBP policy shifts, tool behavior discoveries, emerging AI search patterns. Load this when you observe something during a session that contradicts documented guidance or reveals a pattern not captured in the skill files.
metadata:
  version: 1.0.0
  author: Garrett Smith
---

# Local SEO Lessons

Living document. Updated when observed behavior diverges from skill file expectations.

## How This Works

**Agent proposes** a lesson during a session when something unexpected is observed.
**Human approves** in chat.
**Agent writes** the approved lesson here.

Lessons belong here if they are:
- Temporal — true now, may change (algo behavior, enforcement patterns, tool quirks)
- Exception — contradicts general skill file guidance in specific circumstances
- Emerging — new platform or signal behavior not yet in any skill file

Lessons do NOT belong here if they are:
- Already covered in a skill file
- A single data point without corroboration
- General best practice (put it in the relevant skill instead)

## Schema

```
## [DATE] [CATEGORY]: [Short title]
**Trigger:** What situation surfaced this
**Discovery:** What was learned / what changed
**Confidence:** High / Medium / Low
**Scope:** Which skills this affects
**Expires:** [date to re-verify] or "monitor"
```

**Categories:** `ALGO` `GBP_POLICY` `AI_SEARCH` `TOOL` `PATTERN` `WORKFLOW`

---

## Lessons

## 2026-04-09 TOOL: MCP server injects invalid fields into upstream requests
**Trigger:** Testing business_profile and profile_health via MCP server (mcp.localseodata.com/mcp) for Twin Trees Fayetteville
**Discovery:** The MCP server adds a `keyword` parameter when calling Google data source for business_profile and profile_health. This causes "Invalid Field: 'keyword'" errors. Same endpoints work perfectly via REST API. Additionally, the MCP server converts location strings to `location_code` integers internally, which breaks keyword_suggestions and ai_scraper when using canonical location formats. The REST API has no such issue.
**Confidence:** High (tested across 3 businesses, consistent behavior)
**Scope:** localseodata-tool, all skills that call business_profile, profile_health, keyword_suggestions, ai_scraper via MCP
**Expires:** monitor -- re-test after next MCP server update

---

## 2026-04-09 TOOL: Composite MCP endpoints timeout consistently
**Trigger:** Running local_audit, review_velocity, and local_finder via MCP for Twin Trees Fayetteville
**Discovery:** Endpoints that aggregate multiple data sources (local_audit 50cr, review_velocity 6cr) consistently timeout via MCP but work via REST API. The MCP server appears to have a tighter timeout window than direct REST calls. Geogrid_scan works because it uses async polling internally.
**Confidence:** High (local_audit failed 3/3, review_velocity failed 2/2)
**Scope:** localseodata-tool, local-seo-audit, review-management, any skill using composite endpoints
**Expires:** monitor

---

## 2026-04-09 TOOL: Location format requirements differ by endpoint group
**Trigger:** Testing keyword_suggestions and maps endpoints with various location string formats
**Discovery:** Three different location formats are needed across the API: (1) Maps/Local Finder need canonical format from location_search ("City,State,Country"), (2) keyword endpoints need full state name ("City, State"), (3) business endpoints accept free text ("City, ST"). Using the wrong format causes silent failures or wrong results. "City, ST" abbreviation format fails in location_search for many US cities (Fayetteville NY returns empty, Buffalo NY works). Bare city name is the most reliable format for location_search.
**Confidence:** High (tested 8+ location formats across 10+ endpoints, 3 businesses)
**Scope:** All skills that pass location parameters -- especially localseodata-tool, dispatch
**Expires:** 2026-07-09 (re-verify quarterly)

---

## 2026-04-10 TOOL: ai_scraper and ai_llm_response require specific platform enum values
**Trigger:** API testing returned 400 errors when calling ai_scraper without platform param and ai_llm_response with "chatgpt" (no underscore)
**Discovery:** `ai_scraper` requires a `platform` field (valid: `chat_gpt`, `gemini`). Omitting it returns 400. `ai_llm_response` requires `platform` from `chat_gpt | claude | gemini | perplexity`. Using `chatgpt` (no underscore) returns 400: "Invalid enum value. Expected 'chat_gpt'". Both return 0 credits on 400 errors (no cost for bad requests).
**Confidence:** High (tested and confirmed, error messages are explicit)
**Scope:** localseodata-tool, ai-local-search, any skill calling AI LLM endpoints
**Expires:** monitor

---

## 2026-04-10 TOOL: local_audit 502 timeouts charge credits despite returning no data
**Trigger:** Two consecutive local_audit REST API calls returned 502 during credit cost verification testing
**Discovery:** `local_audit` (composite endpoint, 50 credits) returned HTTP 502 on 2/2 attempts via REST API with 30-33s latency, hitting the upstream provider timeout ceiling. Despite returning no usable data, **50 credits were charged per failed request** (100 credits total lost). This is a billing bug -- failed requests should not deduct credits. The 502 occurs both via MCP (documented earlier) and via direct REST under load. `audit/citation` (50 credits, 41s) and `audit/reputation` (30 credits, 33s) succeeded in the same batch, suggesting `local_audit` has the tightest margin between its execution time and the timeout window.
**Confidence:** High (502 x2 with credits charged, verified in API dashboard)
**Scope:** localseodata-tool, local-seo-audit, any skill using local_audit
**Expires:** monitor -- flag to Garrett as billing bug

---

## 2026-04-10 TOOL: Credit costs were 10x wrong in multiple documentation sources
**Trigger:** User questioned geogrid pricing (5x5=50 credits but 7x7 was listed as 10). Source code shows formula is grid_points x 2.
**Discovery:** The localseodata frontend, docs site, and SKILL.md all had stale credit costs carried over from early development. Verified ALL 42 endpoints against live API and credits.ts source code. Found 9 wrong values in SKILL.md and 27+ wrong values across the localseodata site. Worst offenders: geogrid 7x7 listed as 10 credits (actual: 98), geogrid 9x9 listed as 18 (actual: 162), local_audit and citation_audit listed as 5 (actual: 50 each). The $0.005/credit PAYG rate means these errors understated costs by 10x in some cases.
**Confidence:** High (every endpoint tested against live API, cross-referenced with credits.ts)
**Scope:** localseodata-tool, geogrid-analysis, all cost-dependent workflows
**Expires:** 2026-07-10 (re-verify if pricing model changes)

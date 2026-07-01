---
name: whitespark-tool
description: When the user wants citation gap analysis, managed citation building, review generation campaigns, or local rank tracking. Trigger on "Whitespark," "citation finder," "where are my competitors listed," "citation gap," "build citations," "review generation tool," or "get more reviews." Note that Whitespark does NOT have an MCP server — it's dashboard-driven with limited API.
metadata:
  version: 1.0.0
  author: Garrett Smith
---

# Whitespark Tool

> **Note:** LocalSEOData (`localseodata-tool`) now covers citation audits via `citation_audit`. Use LocalSEOData as default for citation data. Whitespark remains the preferred tool for citation building and review generation campaigns (Reputation Builder).

Whitespark does NOT currently have an MCP server. It's primarily a dashboard tool with managed services. The agent's role is to guide what to do in Whitespark and interpret data the user provides from it.

## When to Use Whitespark vs Other Tools

| You Need | Use Whitespark | Use Instead |
|----------|---------------|-------------|
| Citation gap analysis (competitor vs you) | ✅ Local Citation Finder | BrightLocal (also does this, has MCP) |
| Managed citation building (done-for-you) | ✅ Best quality service | BrightLocal (also offers this) |
| Review generation campaigns (email/SMS) | ✅ Reputation Builder | — |
| Review monitoring | ✅ | BrightLocal (has MCP, may be better for agent access) |
| Local rank tracking | ✅ | Local Falcon (geogrid is superior for local) |
| Citation accuracy audit | ⚠️ Can do it | BrightLocal (better for NAP accuracy scoring) |
| Keyword research | ❌ | Semrush, Ahrefs |
| Backlink analysis | ❌ | Ahrefs |
| Technical audit | ❌ | Screaming Frog |
| Geogrid rankings | ❌ | Local Falcon |

## Whitespark vs BrightLocal

These two overlap significantly. Here's when to use which:

| Feature | Whitespark | BrightLocal |
|---------|-----------|-------------|
| Citation building quality | ✅ Higher quality (manual review) | Good but more automated |
| Citation gap finder | ✅ More thorough | ✅ Also good |
| NAP accuracy scoring | Basic | ✅ Better scoring system |
| MCP server available | ❌ No | ✅ Yes |
| Review generation | ✅ Reputation Builder | ✅ Also has this |
| White-label reports | Basic | ✅ Better reporting |
| Industry reputation | ✅ Citation specialists | ✅ All-in-one local SEO |
| Pricing | Per-service | Subscription |

**Recommendation:** If MCP connectivity matters (agent can pull data directly), use BrightLocal. If citation building quality is the priority and the user is willing to use the dashboard, Whitespark's managed service is excellent.

## Core Workflows

### Citation Gap Analysis

**When:** User wants to find directories where competitors are listed but they aren't.

**What to do in Whitespark:**
1. Run Local Citation Finder for target business AND 2-3 competitors
2. Compare citation sources across all businesses
3. Identify directories where competitors appear but user doesn't

**What the agent can do:**
- Guide the user on which competitors to check
- Interpret the citation gap report when the user shares results
- Prioritize which directories to target first

**Citation priority framework:**
1. **Tier 1** (must-have): Google, Apple, Bing, Yelp, Facebook, data aggregators
2. **Tier 2** (important): Industry-specific directories (Healthgrades, Avvo, Angi, etc.)
3. **Tier 3** (nice-to-have): Local directories, chamber of commerce, BBB
4. **Tier 4** (low priority): General web directories, niche sites

### Managed Citation Building

**When:** Citation gaps identified and user wants help building them.

**What Whitespark does:**
- Manual submission to directories (higher quality than automated tools)
- Verification that listings are live and accurate
- Ongoing maintenance options

**What to tell the user:**
1. Provide exact NAP (must match GBP)
2. Provide business description, categories, photos
3. Specify target directories from the gap analysis
4. Expect 2-4 week turnaround for most directories
5. Re-audit in 6-8 weeks to verify everything is live and accurate

### Review Generation (Reputation Builder)

**When:** User needs to systematically generate more Google reviews.

**How Reputation Builder works:**
- Import customer list (email or phone)
- Send automated review request via email or SMS
- Directs happy customers to Google review page
- Tracks who received requests, who left reviews

**What the agent should guide:**
1. **Timing**: Send review requests 1-3 days after service completion
2. **Message**: Keep it short, personal, include direct Google review link
3. **Volume**: Steady stream (5-10/week) is better than burst of 50
4. **Filtering**: Don't send to known unhappy customers (avoid negative reviews)
5. **Compliance**: Don't incentivize reviews, don't gate (filter based on rating)

**Review velocity targets by business type:**
| Business Type | Monthly Review Target | Rationale |
|---------------|----------------------|-----------|
| Restaurant | 15-30 | High transaction volume |
| Medical practice | 8-15 | Moderate patient volume |
| Home services | 5-10 | Lower transaction frequency |
| Legal | 3-5 | Fewer clients, harder to ask |
| B2B services | 2-4 | Low volume, high value |

### Local Rank Tracking

**When:** User uses Whitespark's rank tracker.

**Whitespark's rank tracker** is point-based (single location), not geogrid.

**What the agent should know:**
- This shows ranking at ONE point for a keyword — not geographic coverage
- For local businesses, Local Falcon geogrid is far more useful
- Whitespark rank tracking is fine for organic keyword tracking alongside geogrid

## What to Do Next

| What You Found | Next Action | Skill |
|----------------|-------------|-------|
| Citation gaps identified | Build missing citations, starting with Tier 1 | `local-citations` |
| Citations built, waiting for propagation | Work on other optimization while waiting (4-8 weeks) | `gbp-optimization`, `review-management` |
| Review generation campaign running | Monitor velocity and adjust messaging if response rate is low | `review-management` |
| Citation data needs to go in a report | Include in audit or monthly report | `client-deliverables`, `local-reporting` |
| Need MCP-accessible citation data | Use BrightLocal instead | `brightlocal-tool` |

**Default next step:** Whitespark's strength is managed citation services. If you need automated, agent-accessible citation data, use BrightLocal. If you need the highest-quality citation building, use Whitespark's managed service.

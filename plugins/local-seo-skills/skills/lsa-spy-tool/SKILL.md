---
name: lsa-spy-tool
description: When the user wants to check Local Services Ads rankings, see who's ranking in LSA results, monitor LSA competitive landscape, or track LSA ranking changes. Trigger on "LSA rankings," "Local Services Ads," "Google Guaranteed," "Google Screened," "who's ranking in LSAs," or "LSA competitors."
metadata:
  version: 1.0.0
  author: Garrett Smith
---

# LSA Spy Tool

You have direct access to LSA Spy via MCP. This skill tells you WHEN to use each operation and WHAT to do with the results.

## When to Use LSA Spy vs Other Tools

| You Need | Use LSA Spy | Use Instead |
|----------|------------|-------------|
| Who's ranking in LSA results right now | ✅ | — |
| LSA ranking changes over time | ✅ | — |
| Find a specific business in LSA results | ✅ | — |
| Which markets have LSA coverage | ✅ | — |
| Map pack / organic rankings | ❌ | Local Falcon |
| LSA ad setup and optimization strategy | ❌ Use LSA Spy for data, then | `lsa-ads` skill for strategy |
| Keyword search volume | ❌ | Semrush, Ahrefs |

## Core Workflows

### Check Current LSA Rankings

**When:** User asks "who's ranking in LSAs" or "how are we doing in LSAs" for a market.

1. `list_markets` — find the relevant market ID by category + city
2. `get_rankings` — current top-ranking businesses with positions
3. If looking for a specific business: `find_business` with the business name

**What the data tells you:**
- Position 1-3: These businesses get the vast majority of LSA leads
- Businesses appearing consistently: Strong review profile + responsiveness + budget
- Missing from results entirely: Either not running LSAs or profile issues

### Check Who's in a Market

**When:** User wants the full competitive landscape, not just who's ranking right now.

1. `list_markets` — find market ID
2. `get_businesses` — ALL businesses that have appeared, with average rank and appearance frequency
3. Sort by average rank to find consistent top performers
4. Look for businesses with high appearance frequency but mediocre rank (they're spending but not optimizing)

**What to look for:**
- Number of total competitors: Saturated markets (50+) vs thin markets (under 15)
- Average rank spread: Tight (competitive) vs wide (a few businesses dominate)
- New entrants: Businesses appearing recently that weren't there before

### Monitor Ranking Changes

**When:** User wants to track movement — who's going up, who's going down.

1. `list_markets` — find market ID
2. `get_ranking_changes` — set days parameter (7 for weekly, 30 for monthly view)

**What the changes tell you:**
- Business moved UP: Likely got more/better reviews, improved responsiveness, or competitors dropped
- Business moved DOWN: Lost reviews, slow response times, budget issues, or new competitors entered
- NEW entrant: Fresh competitor — check their review count and rating
- Business DISAPPEARED: Paused ads, lost Google Guaranteed/Screened badge, or got suspended

### Market Intelligence

**When:** User considering entering LSAs or wants strategic overview.

1. `list_markets` — see all tracked markets
2. `get_market_details` — see tracked search queries for a specific market
3. `get_rankings` + `get_businesses` — understand competitive density
4. Cross-reference top rankers' review counts against user's business

## Interpreting LSA Spy Data

### What Drives LSA Rankings

LSA rankings are NOT like organic/map pack. The primary factors:
1. **Reviews** — count and rating (most important)
2. **Responsiveness** — how fast you answer/respond to leads
3. **Proximity** — distance from searcher
4. **Business hours** — being open when someone searches
5. **Budget** — having sufficient weekly budget
6. **Badge status** — Google Guaranteed or Google Screened active

### Reading the Rankings

| What You See | What It Means |
|--------------|---------------|
| Same 3 businesses always in top 3 | They have review + responsiveness advantage — hard to displace without matching both |
| High turnover in rankings | Market is competitive, small changes in signals cause movement |
| Business with fewer reviews ranking higher | Likely better responsiveness score or closer proximity |
| Business disappeared suddenly | Badge issue, budget exhausted, or suspension |
| Many businesses with similar rank | Tight competition — reviews and responsiveness are the tiebreakers |

### Key Metrics to Track

- **Average rank**: Where a business typically appears (lower is better)
- **Appearance frequency**: How often they show up at all (consistency matters)
- **Rank trend**: Moving up or down over time
- **Market density**: Total competitors — affects cost per lead and difficulty

## What to Do Next

| What You Found | Next Action | Skill |
|----------------|-------------|-------|
| User not ranking in LSAs | Check if LSA profile is set up, verify Google Guaranteed/Screened badge | `lsa-ads` |
| User ranking but in position 5+ | Diagnose: reviews, responsiveness, budget | `lsa-ads`, `review-management` |
| Competitor has way more reviews | Build review generation strategy to close gap | `review-management` |
| User wants to enter a new LSA market | Assess competitive density, review requirements, estimated budget | `lsa-ads` |
| LSA data needs to go in a client report | Include LSA rankings alongside organic/map pack data | `local-reporting` |
| Want to compare LSA vs organic visibility | Run Local Falcon scan for same keywords | `local-falcon-tool` |

**Default next step:** LSA rankings without review context are incomplete. Always check the user's review count and rating against the top 3 LSA competitors before making recommendations.

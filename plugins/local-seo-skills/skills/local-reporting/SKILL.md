---
name: local-reporting
description: When the user wants to create local SEO reports, track local ranking performance, set up reporting dashboards, or communicate results to clients. Also use when the user mentions "local SEO report," "client reporting," "local metrics," "KPIs for local," "GBP insights," "how to measure local SEO," or "prove ROI on local." For geogrid-specific analysis, see geogrid-analysis. For competitor benchmarking, see local-competitor-analysis.
metadata:
  version: 1.1.0
  author: Garrett Smith
---

# Local SEO Reporting

You are an expert in measuring and communicating local search performance. Your goal is to help practitioners build reports that demonstrate value, identify opportunities, and guide strategy — not just dump data. You understand that different stakeholders need different reports, that multi-location reporting requires layered architecture, and that reports should drive action, not just document status.

## Reporting Philosophy

**Reports should answer three questions:**
1. Are we improving? (trend)
2. What's working? (attribution)
3. What should we do next? (action)

If a report doesn't answer these, it's a data dump, not a report.

---

## Core Local SEO Metrics

### Ranking Metrics
- **SoLV (Share of Local Voice)**: % of geogrid points where business appears. Best single metric for client-facing reports — intuitive and actionable.
- **ARP (Average Rank Position)**: Average ranking across geogrid. Lower = better. Good for internal tracking.
- **ATRP (Average Top Rank Position)**: Average of best 3 positions. Shows ceiling performance.
- **SAIV (Share of AI Voice)**: % of AI search results mentioning business. Emerging metric.
- **Map pack position**: Rank in local 3-pack for target keywords (location-specific).

### GBP Performance Metrics
- **Search impressions**: How often GBP appeared (Maps + Search)
- **Actions**: Calls, direction requests, website clicks
- **Discovery vs. Direct searches**: Brand searches vs. category/service searches
- **Photo views**: Engagement with visual content
- **Post impressions and clicks**: GBP post performance

**⚠️ GBP Click-to-Call Decline (2025-2026 Trend):** Analysis of 170+ business profiles across multiple verticals shows a clear downward trend in GBP click-to-call over the last 2 years — even for profiles that rank well. This decline is primarily mobile and doesn't apply equally to website clicks (desktop users still click websites). Causes include AI results intercepting clicks, Google's evolving SERP layout, and changing user behavior. **When reporting:** Don't present declining calls as an SEO failure if rankings are stable. Context matters. Track website clicks alongside calls, and consider adding website conversion tracking as a complementary KPI to GBP actions.

### Website Metrics
- **Organic traffic to location pages**: Traffic from local/organic search
- **Local keyword rankings**: Position for target service + city terms
- **Click-through rate from local results**: CTR from search to site
- **Conversions from local traffic**: Calls, forms, bookings from organic visitors

### Review Metrics
- **Total review count**: Absolute and vs. competitors
- **Average rating**: Current and trend
- **Review velocity**: New reviews per month
- **Response rate**: % of reviews with a business response
- **Response time**: Average time to respond

### Citation Metrics
- **Citation accuracy rate**: % of citations with correct NAP
- **Citation coverage**: Presence on tier 1-4 directories
- **New citations built**: Monthly activity

---

## Report Cadence

### Monthly Reports (Standard)
- Ranking changes (SoLV trend, keyword positions)
- GBP performance (impressions, actions)
- Review activity (new reviews, rating, velocity)
- Work completed this month
- Priorities for next month

### Quarterly Reports (Strategic)
- Everything in monthly, plus:
- 90-day trend analysis
- Competitive comparison
- Goal progress review
- Strategy adjustments
- ROI estimation if data supports it

### Annual Reports (Executive)
- Year-over-year comparisons
- Total improvement summary
- Business impact (leads, calls, revenue if attributable)
- Competitive position change
- Upcoming year strategy

---

## Report Structure Template

### Monthly Report Outline

**1. Executive Summary (1 paragraph)**
- Net-positive or net-negative month
- Biggest win
- Biggest concern or opportunity
- One sentence on next steps

**2. Rankings & Visibility**
- SoLV for each tracked keyword (with month-over-month change)
- Geogrid heatmap images (visual — clients love these)
- Map pack position for top keywords
- AI search visibility if tracked

**3. GBP Performance**
- Impressions trend (chart)
- Actions breakdown (calls, directions, website)
- Post performance
- Photo views

**4. Reviews**
- New reviews received
- Current rating and count
- Response rate
- Notable reviews (positive or negative)

**5. Work Completed**
- Optimization activities performed
- Citations built or fixed
- Content published
- Links earned

**6. Next Month Priorities**
- Top 3 action items with expected impact
- Any issues to address
- Client action items (if any)

---

## Presenting Metrics to Non-SEO Audiences

### Lead with SoLV
"Last month you were visible in 62% of local searches across your service area. This month it's 71%. That means 9% more potential customers are seeing your business." — This lands with every client.

### Translate Rankings to Business
- Don't say "ARP improved from 8.2 to 6.1"
- Say "We moved from the bottom of page 1 to the top half in most of your service area"

### Use Visuals
- Geogrid heatmaps (green = good, red = bad)
- Month-over-month comparison grids side by side
- Trend line charts for reviews and impressions
- Competitive comparison tables

### Avoid Jargon
- "Map pack" → "the map results on Google"
- "Citations" → "business directory listings"
- "NAP consistency" → "your business info matching everywhere online"
- "SoLV" → "your local visibility score"
- "Domain authority" → "your website's trust level"

---

## ROI & Attribution

### What You Can Directly Attribute
- GBP calls (from insights)
- GBP direction requests
- GBP website clicks
- Website conversions from organic local traffic (with UTM + analytics)
- LSA leads (if running)

### What You Can Correlate
- Ranking improvement → GBP action increase
- Review growth → map pack position improvement
- Citation cleanup → ranking stabilization

### What's Hard to Measure
- Walk-in traffic from Google Maps
- Phone calls not through GBP click-to-call
- Brand awareness from map pack visibility
- Multi-touch attribution (saw on Maps, then searched directly)

### ROI Framework
If you can get average customer value:
```
New GBP actions/month × conversion rate × average customer value = monthly value
Monthly value - monthly cost = ROI
```

Be honest about what's estimated vs. measured.

---

## Tools for Local Reporting

### Rank Tracking
- Local Falcon (geogrid scans, SoLV)
- BrightLocal (local rank tracker)
- Whitespark (local rank tracker)
- SE Ranking (local rank tracking)

### GBP Insights
- Google Business Profile dashboard
- GBP API for bulk data extraction
- Third-party aggregators (BrightLocal, AgencyAnalytics)

### Citations
- BrightLocal citation tracker
- Whitespark citation audit
- Moz Local

### Review Monitoring
- GBP notifications
- BirdEye, Podium, GatherUp
- Google Alerts for brand name

### Report Building
- Google Looker Studio (free dashboards)
- AgencyAnalytics (agency reporting platform)
- BrightLocal reports
- Manual (Google Slides / Docs for smaller operations)

---

## Multi-Location Reporting

Single-location reporting doesn't scale. When managing 10-500+ locations, you need layered reporting.

### The Three-Layer Model

**Layer 1: Portfolio Roll-Up (Executive View)**
One page showing the entire account at a glance.
- Total locations managed
- Portfolio-wide SoLV average and trend
- Portfolio-wide review count and rating average
- Top 5 performing locations, bottom 5 underperformers
- Aggregate GBP actions (total calls, directions, website clicks)
- Work completed summary (optimizations, citations, responses)

This is for CMOs, VPs, franchise corporate. They don't care about individual locations unless there's a problem.

**Layer 2: Location Scorecard (Operational View)**
Per-location summary with a health score.
- Location name, address, market
- SoLV for each tracked keyword
- Review count, rating, velocity (green/yellow/red)
- GBP completeness score
- Citation accuracy rate
- Last optimization date
- Flagged issues

Sortable and filterable. Operations managers use this to decide where to focus effort.

**Layer 3: Deep Dive (Per-Location)**
Full single-location report as described in the monthly template above. Only generated on-demand or for problem locations.

### Location Health Scoring

Assign a 0-100 health score per location based on weighted components:

| Component | Weight | Scoring |
|-----------|--------|---------|
| SoLV (primary keyword) | 25% | % directly maps to score |
| Review rating | 15% | 4.5+ = 100, 4.0 = 75, 3.5 = 50, <3.0 = 25 |
| Review velocity | 10% | Meeting target = 100, <50% of target = 50, declining = 25 |
| Response rate | 10% | 100% responded = 100, <50% = 25 |
| GBP completeness | 15% | All fields populated = 100, missing critical fields = lower |
| Citation accuracy | 10% | % accurate directly maps |
| GBP action trend | 15% | Growing = 100, flat = 60, declining = 30 |

Color-code: 80+ green, 60-79 yellow, <60 red. This gives operations a triage tool.

### Handling 50+ Locations in Reports

- Never list every location in the executive report — it becomes unreadable
- Use "top N / bottom N" approach with drill-down available
- Exception-based reporting: only surface locations that need attention
- Group by region, market, or brand if the client has logical clusters
- Provide a downloadable data export (CSV/Excel) alongside the visual report for clients who want to dig deeper

---

## Benchmarks: What's "Good"

Clients always ask "is this good?" Have reference points ready.

### SoLV Benchmarks
| Level | SoLV | Meaning |
|-------|------|---------|
| Dominant | 70%+ | Visible in most of service area |
| Strong | 50-69% | Above average, room to grow |
| Average | 30-49% | Competitive but not winning |
| Weak | 15-29% | Losing ground |
| Invisible | <15% | Barely showing up |

### Review Benchmarks
| Metric | Good | Needs Work |
|--------|------|-----------|
| Rating | 4.5+ | Below 4.0 |
| Total count | 2x nearest competitor | Less than top 3 competitors |
| Velocity | 4-8 new/month (SMB), 10-30/month (multi-location) | <2/month |
| Response rate | 100% | <75% |
| Response time | Within 24 hours | >72 hours |

### GBP Action Benchmarks (Monthly, Per Location)
Varies wildly by industry and market size. Use trend as primary indicator, not absolute numbers.

| Metric | Healthy Trend | Warning Sign |
|--------|--------------|-------------|
| Search impressions | Stable or growing MoM | Declining 3+ months |
| Calls | Growing or stable | >20% decline MoM |
| Direction requests | Stable | Sharp decline (possible data issue) |
| Website clicks | Growing with traffic | Declining while impressions grow (CTR problem) |

**Always benchmark against the client's own history first, competitors second, industry averages third.** Comparing a rural dentist to a Manhattan dentist is meaningless.

---

## Stakeholder-Specific Report Variants

### For the Business Owner / Operator
- Leads with calls, bookings, foot traffic — things they can feel
- "You got X calls from Google this month, up from Y"
- Minimize jargon, maximize business impact
- Include action items that require their input (respond to reviews, approve photos)
- Keep it to 1-2 pages

### For the Marketing Manager / Director
- More comfortable with data — include keyword positions, competitive comparisons
- Show ROI calculations and attribution methodology
- Highlight what's working so they can report up the chain
- Include strategic recommendations, not just status updates
- 3-5 pages with appendix if needed

### For the CMO / VP / C-Suite
- One page maximum. Executive summary only.
- 3-5 key numbers: total leads/calls from local, portfolio health score, competitive position
- YoY comparison, not MoM — they think in quarters and years
- Link to detailed report if they want to dig in
- Frame everything in revenue or opportunity cost language

### For the Franchise Owner / Operator
- Compare their location to the franchise average (creates healthy competition)
- Simple scorecard: green/yellow/red on 5-6 metrics
- Action items they can actually do (respond to reviews, upload photos)
- Keep it to 1 page — these people are running a business, not reading reports

### For Corporate Franchise / Multi-Brand
- Roll-up dashboard with per-brand and per-region cuts
- Identify systemic issues (brand-wide review decline, category-wide ranking drop)
- Compliance metrics: are franchisees following brand standards in GBP?
- Benchmark franchisees against each other (top quartile vs bottom quartile)

---

## Report Automation

### API-Driven Data Collection

For recurring reports, automate data collection:

| Data Source | Method | Cadence |
|------------|--------|---------|
| Local Falcon | MCP or API — pull SoLV, ARP, scan images | After each scan (daily/weekly/monthly) |
| GBP Performance | Business Profile Performance API | Weekly or monthly pull |
| Google Analytics | GA4 Data API — local traffic, conversions | Monthly pull |
| Search Console | Search Analytics API — local keyword clicks/impressions | Monthly pull |
| Reviews | GBP API or third-party scrape | Daily monitoring, monthly summary |
| Citations | BrightLocal API or manual audit | Quarterly |

### Automated Report Generation Pipeline

```
Scheduled data pull → Aggregate in database/spreadsheet → 
Template population → QA review → Client delivery
```

**Tools for automation:**
- Google Looker Studio with automated data source refresh
- AgencyAnalytics with scheduled PDF delivery
- Custom pipeline: API pulls → Supabase → report template → email via Resend
- n8n or Zapier for stitching data sources together

**Warning:** Fully automated reports without human review will eventually send something embarrassing or wrong. Always have a human QA step before delivery, even if everything else is automated.

### Report QA Checklist
Before sending any report:
- [ ] Date range is correct (not pulling last month's data)
- [ ] All locations accounted for (no missing data)
- [ ] Charts match the numbers in the text
- [ ] MoM comparisons use equivalent periods (same number of days)
- [ ] Negative trends are acknowledged and explained
- [ ] Action items are specific and achievable
- [ ] Client-specific context included (seasonal factors, known issues)
- [ ] Branding correct (right logo, right client name)

---

## Difficult Reporting Conversations

### When Rankings Drop
- Lead with the fact, don't hide it: "Rankings declined this month"
- Explain likely cause (algorithm update, new competitor, seasonal, GBP change)
- Show what you're doing about it
- Put it in context: "Still up 23% from where we started"
- Never blame the client in the report (even if it's their fault)

### When There's No Clear Progress
- Highlight leading indicators even when lagging indicators are flat
- "Rankings haven't moved but we built 15 citations and fixed 3 NAP inconsistencies — these typically take 4-8 weeks to impact rankings"
- Adjust expectations if the market is highly competitive
- Propose strategy changes if current approach isn't working after 3+ months

### When a Competitor Overtakes You
- Acknowledge it clearly — the client will notice
- Show what the competitor did (more reviews, new content, better GBP)
- Present a plan to respond
- Use it as leverage for additional budget or scope if warranted

### When the Client Questions Value
- Pull up the "before" state — always keep baseline data from onboarding
- Calculate cumulative improvement, not just last month
- Show the work log — volume of changes made
- If ROI calculation works in your favor, lead with it
- If ROI is unclear, be honest: "Here's what we can measure, here's what we estimate"

---

## Report-to-Action Pipeline

Reports that sit in email are useless. Build a system where reports drive work.

### After Every Report
1. Extract top 3 priorities from the report
2. Convert to specific tasks with assignees and deadlines
3. Track completion in next month's report ("last month we said we'd do X — here's the result")
4. Flag client action items separately and follow up

### Monthly Rhythm
```
Week 1: Data collection + report generation
Week 2: Report delivery + client call (if applicable)
Week 3-4: Execute on priorities identified in report
Week 1 (next month): Measure impact of last month's actions → new report
```

This creates a closed loop where every report generates work and every month's report shows the result of last month's work.

---

## Common Reporting Mistakes

- **Data dump without analysis**: Showing numbers without explaining what they mean
- **No month-over-month comparison**: Numbers without context are meaningless
- **Ignoring negative trends**: Address them proactively — clients will see them
- **Vanity metrics**: Impressions without actions, rankings without business impact
- **Inconsistent cadence**: Skipping months erodes client trust
- **No action items**: Every report should end with "here's what we're doing next"
- **Same report for every stakeholder**: The CMO and the franchise operator need different things
- **No baseline comparison**: Always show where the client started
- **Reporting on activity, not outcomes**: "We posted 8 GBP posts" isn't a result — "GBP posts drove 340 additional impressions" is
- **Over-reporting**: 15-page monthly reports get skimmed. Shorter reports with clear takeaways get read

---

## Task-Specific Questions

1. Who's the audience? (business owner, marketing manager, C-suite, franchise operator)
2. What metrics does the client care about most?
3. What reporting tools are currently in use?
4. Monthly, quarterly, or custom cadence?
5. Single location or multi-location reporting? How many locations?
6. What data sources are accessible? (GBP, analytics, rank tracker, Search Console)
7. Does the client want a call to walk through reports, or email-only delivery?
8. Is there a baseline/onboarding report to compare against?
9. Does this need to be white-labeled?

---

## What to Do Next

| What You Found | Next Action | Skill |
|----------------|-------------|-------|
| Report shows ranking data needs context | Interpret geogrid data properly before including it | `geogrid-analysis` |
| Competitor benchmarks needed for report | Run competitive analysis to give rankings context | `local-competitor-analysis` |
| Report reveals GBP issues to fix | Act on findings with profile optimization | `gbp-optimization` |
| Multi-location rollup needed | Structure reporting per-location with portfolio rollup | `multi-location-seo` |
| Need to package findings as a deliverable | Use audit/proposal templates for client-facing docs | `client-deliverables` |
| Report shows keyword gaps | Research new keyword opportunities | `local-keyword-research` |

**Default next step:** Reports should always end with "recommended next steps." Every metric that's below benchmark should link to a specific action the client can approve.

## Tools for This Skill

See `docs/tool-routing` to pick based on what's connected.

- **Geogrid ranking data** → Local Falcon (only option)
- **Organic search data** → Google Search Console (only source of truth)
- **Traffic and conversions** → Google Analytics (only option)
- **Citation health data** → citation tools (multiple options)
- **LSA ranking data** → LSA Spy (only option)
- **Keyword tracking** → keyword research tools (multiple options)

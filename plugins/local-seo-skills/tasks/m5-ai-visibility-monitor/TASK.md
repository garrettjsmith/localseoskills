---
name: m5-ai-visibility-monitor
description: Monthly AI search visibility tracking across Google AI Overviews, ChatGPT, Gemini, and Perplexity. Tracks citation presence and visibility score month-over-month.
schedule: monthly — 1st of month, 8 AM
tier: autonomous
skills: ai-local-search, localseodata-tool
mcps: LocalSEOData
---

# M5: AI Visibility Monitor

## Skills
**Primary:** `ai-local-search`, `localseodata-tool`
Load these first. If unavailable, use Fallback Guidance below.

## Fallback Guidance
Use this if skills are unavailable.

**How AI local search visibility works:**
- AI models synthesize from multiple sources — GBP data, website content, reviews, citations, brand mentions
- Being cited in AI results is different from ranking in the map pack — a business can rank #1 in maps but not appear in AI Overviews, and vice versa
- AI Overview prominence is industry-rooted — if Overviews appear for a service category in any city, they appear everywhere for that category

**What the data points mean:**
- **AI visibility score** — aggregate measure of how often and prominently the business appears in AI results for target keywords. Higher = better. Track direction month-over-month.
- **AI Overview present** — whether Google is showing an AI-generated summary for the keyword. If yes, the business needs to be in it.
- **AI mentions** — where the business name appears in AI model outputs. Multiple mentions across platforms = stronger entity recognition.

**Platform priority:**
- Google AI Overviews / AI Mode — highest priority, most traffic impact
- Gemini — deep Google integration, pulls from GBP heavily
- ChatGPT — growing share of "find me a..." queries, web-search dependent
- Perplexity — cites sources explicitly, being the cited page matters

**What drives AI visibility for local:**
- Strong GBP with complete services section
- Website with clear factual statements about services, location, credentials
- Review volume and diversity across platforms
- Brand mentions on authoritative local/industry sites
- Complete LocalBusiness schema

**What a visibility drop usually means:**
- A competitor improved their GBP or website content
- A new Review aggregation changed AI sentiment
- Google updated its AI Overview triggers for the category
- The business's website content changed in a way that reduced AI parsability

## Verification
Before executing, confirm:
- [ ] `ai-local-search` skill loaded, or Fallback Guidance read
- [ ] `localseodata-tool` skill loaded, or Fallback Guidance read
- [ ] LocalSEOData MCP responding
- [ ] Location brief exists
- [ ] Prior AI visibility report exists in `reports/` for comparison (if not, baseline run)

If LocalSEOData is unavailable: write FAILED status, note in brief, send Slack alert.

## Prompt

```
Load skills: ai-local-search, localseodata-tool
If skills unavailable, read Fallback Guidance in tasks/m5-ai-visibility-monitor/TASK.md.

Run verification checklist before proceeding.

You are monitoring AI search visibility for {BUSINESS_NAME} at {LOCATION}.

Call LocalSEOData:
- ai_visibility for domain {WEBSITE} and keywords [{KEYWORD_LIST}]
- ai_overview for top 3 primary keywords
- ai_mentions for brand name {BUSINESS_NAME}

Using ai-local-search skill or Fallback Guidance, interpret:
- Which platforms are citing the business and which aren't
- Direction of visibility score vs last month
- What signals are likely driving or blocking visibility
- One recommended action based on the biggest gap

Compare to last month's report in briefs/{brand}/{location}/reports/.

Write output to briefs/{brand}/{location}/reports/{TODAY}-ai-visibility.md
per specs/output-schema.md.

Alert if visibility score dropped >15 points vs last month.
Update location brief Session Log.
```

## Output
- `reports/{date}-ai-visibility.md`
- Optional alert if visibility drops significantly

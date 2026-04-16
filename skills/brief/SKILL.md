---
name: brief
description: Manages persistent work state (briefs) for local SEO engagements. Automatically load this skill when starting work on a specific business or location, when a user says "resume," "continue," "pick up where we left off," or references a specific client or location by name. Also load when any tool call is about to be made for a business, that's the trigger to create or update a brief. Load when receiving output from a scheduled task.
metadata:
  version: 3.0.0
  author: Garrett Smith
---

# Brief Management

Briefs are persistent work state for local SEO engagements. One brief per location. Brand rollup for multi-location work. Scheduled task outputs extend the brief over time, building a compounding history of every scan, audit, report, and finding for each business.

---

## Structure

```
briefs/
  {brand}/
    _brand.brief.md          ← config + rollup across all locations
    reports/                 ← brand-level rollup reports
    {location}/
      location.brief.md      ← always current, always lean
      reports/               ← weekly, monthly, QBR reports
      scans/                 ← geogrid scans, citation audits, page audits
      drafts/                ← GBP posts, review responses awaiting approval
      alerts/                ← monitoring alerts
```

---

## First Run Detection

**This is the most important section.** When a user mentions a specific business and no brief exists, do not proceed with their request yet. Run setup first, then circle back to what they asked for.

### Detection

Before doing any work for a specific business, check for an existing brief:
- Claude Code: look for `briefs/{brand-slug}/{location-slug}/location.brief.md`
- Claude Project: check Project knowledge base for a brief file for this business
- If found: go to **Resuming from a Brief**
- If not found: go to **First Run Setup**

### First Run Setup

Tell the user:

> "I don't have a brief for [Business Name] yet. Let me grab a few details so I can track everything going forward. This takes about 2 minutes."

Then ask these questions **one at a time**, not all at once:

**Q1:** "What's the primary keyword you want to rank for? (e.g. 'plumber buffalo ny')"

**Q2:** "What's the website URL?"

**Q3:** "How far does the service area extend? (e.g. 5 miles, 20 miles)"

**Q4:** "Are you managing this for a client, or is this your own business?"
- If client, ask: "What's the client's email for reports?"
- If own business, skip

**Q5:** "Do you want alerts and reports sent to a Slack channel?" (optional, skip if they say no)

That's it. Don't ask for more than these unless something is genuinely ambiguous.

### After Questions

1. Create brief folder structure:
   - `briefs/{brand-slug}/{location-slug}/location.brief.md`
   - `briefs/{brand-slug}/{location-slug}/reports/`
   - `briefs/{brand-slug}/{location-slug}/scans/`
   - `briefs/{brand-slug}/{location-slug}/drafts/`
   - `briefs/{brand-slug}/{location-slug}/alerts/`
   - `briefs/{brand-slug}/_brand.brief.md`

2. Populate Identity section from answers and any context already in the conversation

3. Configure `_brand.brief.md` approval block from Q4/Q5 answers

4. Run initial audit automatically, don't ask permission:
   - LocalSEOData `local_audit`
   - LocalSEOData `business_profile` + `profile_health`
   - LocalSEOData `geogrid_scan` (7x7, primary keyword, stated radius)
   - LocalSEOData `citation_audit`
   - LocalSEOData `review_velocity` + `google_reviews`
   - LocalSEOData `competitor_gap`

5. Populate Findings from audit results

6. Set Next Action to the single highest-priority fix

7. Offer scheduled task setup:
   > "Brief created and initial audit done. I found [X critical, Y important issues]. [Top finding in one sentence].
   >
   > Want me to set up automated monitoring? I can configure weekly ranking scans, review monitoring, GBP change detection, and monthly reports to run automatically."
   >
   > If yes, go through task list from `tasks/README.md`, recommend based on audit findings, configure via `/schedule`
   > If no, proceed with original request

8. Then return to what the user originally asked for:
   > "Now let me [original request]..."

### For Claude Project / Browser Users

If no filesystem access: run the same conversation and audit, then output the brief as formatted text at the end of setup:

> "Here's your brief. Add this to your Project knowledge base so I'll have it next time:"
> [brief content]

---

## When to Create a Brief (Non-First-Run)

Outside of first run, create a brief mid-session if:
- A tool call is about to be made for a business with no brief
- User explicitly asks to create one

Do not create briefs for:
- General local SEO questions with no specific business
- Tool or skill explanations
- Single-question answers with no live data

---

## Brief Location

**Claude Code / Cowork:**
```
briefs/{brand-slug}/{location-slug}/location.brief.md
```

**Claude Project:**
Upload brief file to Project knowledge base after creation. Tell user to do this if they haven't.

---

## Updating a Brief (Manual Sessions)

At end of every session:

1. **Session Log.** One line: date + what was worked on
2. **Tools Run.** Each tool call: date, tool, endpoint, one-line finding
3. **Findings.** New issues, categorized Critical / Important / Monitor
4. **Deliverables.** Mark completed, add new pending
5. **Next Action.** Overwrite with single most important next step

---

## Receiving Scheduled Task Output

When a scheduled task writes an output file:

1. Read the output file
2. Add one line to Session Log: `[DATE] | {task type} → {one-line finding} → see {output path}`
3. If new Critical findings: update Findings section
4. Update Next Action if the task surfaced a higher priority than current
5. Update `_brand.brief.md` Locations table row for this location

The brief stays lean. Detail lives in the output files. The brief is the index.

---

## Resuming from a Brief

When a user returns to a business:

1. Read the brief
2. Read the most recent output file in each subfolder for current state
3. Summarize in 2-3 sentences: what's been done, key findings, current state
4. State the Next Action
5. Ask: "Want to pick up from here, or something specific?"

Do not re-run tools with results in scans/ unless user asks or data is >30 days old.

---

## The Compounding Value

After months of scheduled tasks writing to a brief, the history is queryable:

- "Why did rankings drop in March?" reads scans/ for that period
- "How have reviews trended this year?" reads reports/ review monitors
- "When did this competitor appear?" reads competitor monitors

**Never delete output files.** Archive if the folder gets unwieldy. The history is the value.

---

## Lessons Flywheel

During every session, manual or scheduled, watch for:

- Tool returning data that contradicts a skill file
- A pattern emerging across 3+ locations not documented anywhere
- GBP, algo, or AI platform behavior differing from documented expectations
- A tool endpoint behaving unexpectedly

When observed, surface it explicitly:

> "I noticed [X] during this session. This pattern isn't in the skill files. Want me to add it to `meta/lessons.md` for review?"

Wait for confirmation. Then write the lesson.

---

## Multi-Location Brands

After each location session:
- Update that location's row in `_brand.brief.md` Locations table
- Add to Brand-Level Notes only if pattern appears in 3+ locations

---

## Slug Format

Lowercase, hyphens, obvious:
- Brand: `keystone-insurance`, `mikes-plumbing`
- Location: `buffalo`, `downtown-chicago`, `pittsburgh-pa`

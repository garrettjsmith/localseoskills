---
name: brief
description: Manages persistent work state (briefs) for local SEO engagements. Automatically load this skill when starting work on a specific business or location, when a user says "resume," "continue," "pick up where we left off," or references a specific client or location by name. Also load when any tool call is about to be made for a business — that's the trigger to create or update a brief. Load when receiving output from a scheduled task.
metadata:
  version: 2.0.0
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
      drafts/                ← GBP posts, review responses — awaiting approval
      alerts/                ← monitoring alerts
```

---

## When to Create a Brief

Create on the **first tool call** for a business in a session, if one doesn't exist.

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
Tell user: "I've created a brief for this business. Add it to your Project knowledge base so it persists across sessions."

---

## Creating a Brief

1. Identify business name, location, type from context — ask if unclear
2. Copy from `briefs/_templates/location.brief.md`
3. Fill Identity from whatever user has provided
4. Note session start in Session Log
5. Proceed with work

For multi-location brands, create or update `briefs/{brand}/_brand.brief.md`.

---

## Updating a Brief (Manual Sessions)

At end of every session:

1. **Session Log** — one line: date + what was worked on
2. **Tools Run** — each tool call: date, tool, endpoint, one-line finding
3. **Findings** — new issues, categorized Critical / Important / Monitor
4. **Deliverables** — mark completed, add new pending
5. **Next Action** — overwrite with single most important next step

---

## Receiving Scheduled Task Output

When a scheduled task writes an output file:

1. Read the output file
2. Add one line to Session Log: `[DATE] — {task type} → {one-line finding} → see {output path}`
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

Do not re-run tools that have results in scans/ unless user asks or data is >30 days old.

---

## The Compounding Value

After 6+ months of scheduled tasks writing to a brief, Claude has a complete history of that business. This is queryable:

- "Why did rankings drop in March?" → read scans/ for that period
- "How have reviews trended this year?" → read reports/ review monitors
- "When did this competitor appear?" → read competitor monitors

Design consequence: **never delete output files**. Archive them if the folder gets unwieldy, but the history is the value.

---

## Lessons Flywheel

This is important. During every session — manual or scheduled — watch for:

- Tool returning data that contradicts a skill file
- A pattern emerging across 3+ locations that isn't documented anywhere
- A GBP, algo, or AI platform behavior that differs from documented expectations
- A tool endpoint behaving unexpectedly

When you observe any of these, **surface it explicitly**:

"I noticed {X} during this session — this pattern isn't in the skill files. Want me to add it to `meta/lessons.md` for review?"

Wait for confirmation. Then write the lesson.

This is how the system gets smarter over time. The scheduled tasks running constantly across multiple locations will surface patterns faster than any manual engagement. Don't let those observations disappear into session history.

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

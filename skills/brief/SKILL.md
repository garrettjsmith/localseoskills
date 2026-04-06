---
name: brief
description: Manages persistent work state (briefs) for local SEO engagements. Automatically load this skill when starting work on a specific business or location, when a user says "resume," "continue," "pick up where we left off," or references a specific client or location by name. Also load when any tool call is about to be made for a business — that's the trigger to create or update a brief.
metadata:
  version: 1.0.0
  author: Garrett Smith
---

# Brief Management

Briefs are persistent work state for local SEO engagements. One brief per location. You create, update, and resume them automatically — the user should never have to manage this manually.

---

## When to Create a Brief

Create a brief on the **first tool call** for a business in a session, if one doesn't already exist.

Do not create briefs for:
- General local SEO questions with no specific business
- Tool or skill explanation requests
- Single-question answers that don't involve live data

---

## Brief Location

**Claude Code (filesystem):**
```
briefs/{brand-slug}/{location-slug}/location.brief.md
```
Single location, no brand needed:
```
briefs/{business-slug}/location.brief.md
```

**Claude Project or Browser:**
Tell the user: "I've created a brief for this business. Add it to your Project knowledge base so it persists across sessions." Then output the brief content so they can save it.

---

## Creating a Brief

1. Identify the business name, location, and type from context or ask if unclear
2. Copy from `briefs/_templates/location.brief.md`
3. Fill in Identity fields from whatever the user has provided
4. Note the session start and what was requested in Session Log
5. Proceed with the work

For multi-location brands, also create or update `briefs/{brand}/_brand.brief.md`.

---

## Updating a Brief

Update at the **end of every session** before closing out:

1. **Session Log** — add one line: date + what was worked on
2. **Tools Run** — add each tool call made: date, tool, endpoint, one-line finding
3. **Findings** — add any new issues discovered, categorized by severity
4. **Deliverables** — mark completed items, add new pending items
5. **Next Action** — overwrite with the single most important next step

Keep findings concise. "Citation audit found 7 NAP inconsistencies across 4 directories" not raw JSON.

---

## Resuming from a Brief

When a user returns to a business:

1. Read the brief
2. Summarize in 2-3 sentences: what's been done, key findings, where things stand
3. State the recorded Next Action
4. Ask: "Want to pick up from here, or is there something specific you want to work on?"

Do not re-run tools that already have results in the brief unless the user asks or the data is more than 30 days old.

---

## Multi-Location Brands

After completing a location session, update `_brand.brief.md`:
- Update that location's row in the Locations table
- Add any cross-location patterns to Brand-Level Notes (only if pattern appears in 3+ locations)

---

## Lessons Connection

If during a session you observe something that contradicts a skill file or reveals a new pattern not captured anywhere, propose it at session end:

"I noticed [X] during this session — this isn't in the skill files. Want me to add it to `meta/lessons.md` for review?"

Wait for confirmation before writing.

---

## Slug Format

- Lowercase, hyphens, no spaces
- Business name: `mikes-plumbing`, `keystone-insurance`
- Location: `buffalo`, `downtown-chicago`, `pittsburgh-pa`
- Keep it obvious, not clever

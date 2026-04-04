# Briefs

Persistent work state for local SEO engagements. One brief per location. Brand rollup for multi-location work.

## What a Brief Is

A brief captures what's been done, what was found, and what's next for a specific business or location. It means you never re-explain context, re-run tools you've already run, or lose findings between sessions.

## Structure

**Single location:**
```
briefs/
  business-name/
    location.brief.md
```

**Multi-location brand:**
```
briefs/
  brand-name/
    _brand.brief.md        ← rollup across all locations
    buffalo/
      location.brief.md
    pittsburgh/
      location.brief.md
```

Use hyphens, lowercase slugs. Match the business name closely enough to be obvious.

## How It Works

**Agent creates the brief automatically** on the first tool call for a business. No manual setup required.

**Agent updates the brief** at the end of every session — session log, tools run, findings, and next action.

**Agent resumes from the brief** when you return to a business. It reads the brief first, tells you where you left off, and asks what you want to do next.

**Brand rollup** is updated whenever a location session completes.

## Persistence By Context

| Context | Where briefs live |
|---|---|
| Claude Code | `briefs/` folder on disk (auto-created) |
| Claude Project | Upload `briefs/` to Project knowledge base after first session |
| Browser / Desktop (no Project) | Agent summarizes state at session end — paste into a doc or Project |

**Recommended setup for regular work:** Create a Claude Project per client or brand. Upload the brief file after the first session. Every subsequent chat in that Project starts with full context.

## Privacy

Briefs contain real business data. They are not part of the LocalSEOSkills repo and should never be committed to it.

If using Claude Code, add `briefs/` to your `.gitignore`.

## Templates

See `_templates/` for:
- `location.brief.md` — single location work
- `_brand.brief.md` — multi-location brand rollup

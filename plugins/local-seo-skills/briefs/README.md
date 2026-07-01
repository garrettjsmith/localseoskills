# Briefs

Client-facing work state for Local SEO Skills engagements. Briefs are created and maintained automatically by the `brief` skill; this README documents the shape, lifecycle, and conventions for humans reading the repo.

The canonical skill logic lives in [`skills/brief/SKILL.md`](../skills/brief/SKILL.md). This file describes the system at a higher level and documents the folder structure you'll see on disk.

**Briefs are gitignored.** Client data never enters the repository.

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

Each location has its own brief and subfolders. Brand-level state rolls up into `_brand.brief.md`. Scheduled tasks write output files into the appropriate subfolders; the brief itself stays lean and serves as an index.

---

## First-run setup

When a user mentions a business for the first time and no brief exists, Claude asks five short questions, runs an initial audit against [LocalSEOData](https://localseodata.com), and offers to configure scheduled tasks. The user does not need to create briefs manually.

The five questions:

1. Primary keyword to rank for
2. Website URL
3. Service area radius
4. Client engagement or own business
5. Slack channel for alerts (optional)

The initial audit covers local presence, business profile health, a 7x7 geogrid scan, citations, reviews, and competitor gaps. All of it lands in the brief.

---

## Ongoing lifecycle

- **Manual sessions.** At the end of each session, Claude updates Session Log, Tools Run, Findings, Deliverables, and Next Action.
- **Scheduled tasks.** Task outputs extend the brief over time. Every ranking scan, review monitor, GBP change alert, and monthly report writes a file and adds a one-line Session Log entry.
- **Resuming a client.** When the user returns, Claude reads the brief, reads the most recent output file in each subfolder, and summarizes what's been done and what's next.

The compounding value: after months of history, queries like *"why did rankings drop in March?"* or *"when did this competitor first appear?"* become answerable from the brief's scan and report history.

---

## Templates

Seed templates for new briefs live in `briefs/_templates/`. The `brief` skill uses these when scaffolding a new location or brand.

---

## Related

- [`skills/brief/SKILL.md`](../skills/brief/SKILL.md): canonical skill logic
- [`specs/output-schema.md`](../specs/output-schema.md): output file format for scheduled tasks
- [`tasks/README.md`](../tasks/README.md): the 15 scheduled task templates

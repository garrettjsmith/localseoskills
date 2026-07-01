---
name: local-content-strategy
description: Build a complete local content strategy from keyword research output. Use this skill when the user has completed keyword research and needs to organize keywords into concept clusters, assign each cluster to the right content vehicle (location page, GBP service, blog post, FAQ, near-me GBP signal), select geogrid tracking keywords, confirm GBP category and service additions, and design the internal linking architecture. Also trigger when the user asks "what content should I build", "how do I organize these keywords", "what pages do I need", "what should I track on geogrids", or provides a keyword list and asks what to do with it. This skill bridges keyword research and content brief production — it is the strategy layer between research and execution.
metadata:
  version: 1.0.0
  author: Garrett Smith
---

# Local Content Strategy Skill

## Purpose
Transform a keyword list into a complete local content architecture — organized concept clusters, content vehicle assignments, production priority order, geogrid tracking keyword selection, GBP optimization confirmations, and internal linking structure. This skill turns research into a plan.

## Position in the Workflow
```
local-keyword-research → [THIS SKILL] → local-content-briefs → local-landing-pages
```
Input: keyword list (from local-keyword-research or provided directly)
Output: complete content strategy document ready to brief and execute

## Core Principle: Keywords Are the Input, Concepts Are What You Build

A keyword list tells you what people are searching for. A content strategy tells you what to build, where to build it, how deeply to cover each topic, and in what order. The two most common mistakes practitioners make with a keyword list: (1) trying to target each keyword individually instead of grouping related terms into concept clusters, and (2) defaulting to "write a page for this" when many keywords are won through GBP signals and don't need a page at all.

This skill does the organizing work that usually happens in a spreadsheet over several hours — automatically, with reasoning attached to every decision.

---

## Process

### Step 1: Concept Clustering

Group the keyword list into concept clusters. A concept cluster is a set of keywords that share the same underlying topic and user intent — they would all be served by the same piece of content or the same GBP optimization.

**Clustering rules:**
- Geographic variants of the same term belong in the same cluster ("plumber Phoenix" + "plumber Scottsdale" + "plumber near me" are all the same concept at different geographic specificity levels)
- Service variants belong together ("drain cleaning" + "clogged drain" + "drain backup" = one cluster)
- A cluster should have one primary concept label — the plain-language name of the topic, not a keyword string
- Clusters should be mutually exclusive — if a keyword could belong to two clusters, assign it to the one where it represents the core intent

**Output per cluster:**
- Cluster name (plain language, not a keyword)
- Primary keyword (highest volume, most representative)
- Supporting keywords (variants, long-tail, geo-modified versions)
- Search volume range across the cluster
- User intent type (transactional, informational, navigational, near-me)
- Competitive level (high/medium/low based on available data)

### Step 2: Content Vehicle Assignment

For each concept cluster, assign the right content vehicle. This is the most consequential decision in the strategy — the wrong vehicle means the content either doesn't rank or doesn't convert.

**Content vehicle decision logic:**

**Location page** — assign when:
- Cluster has clear transactional local intent
- Primary keyword includes a city, neighborhood, or service area modifier
- Search volume justifies a dedicated page (generally 50+ monthly searches)
- The concept is specific enough to write genuinely unique content for each location

**GBP service entry** — assign when:
- Cluster represents a specific service the business offers
- Keyword has local service intent but lower volume (under 50 MSV)
- The concept is a service variant rather than a primary service (e.g., "tankless water heater installation" vs. "water heater repair")
- A dedicated page would be thin — better as a GBP service that expands category coverage

**GBP category** — assign when:
- Cluster maps to a GBP secondary category the business should claim
- Claiming the category expands query eligibility for the entire cluster
- Note: this is a GBP action, not a content action

**Blog post / FAQ content** — assign when:
- Cluster has informational intent (how-to, what-is, comparison, cost questions)
- User is in the research phase before making a local service decision
- Content could be cited in AI Overviews or answer PAA questions
- No transactional local intent — this is awareness/consideration stage content

**Near-me / GBP signal only** — assign when:
- Cluster contains near-me variants that can't be targeted with page content
- These keywords are won through GBP prominence, proximity, and completeness
- No content action needed — the GBP optimization work covers this cluster
- Note this explicitly so clients understand why there's no page for these terms

**Pillar page** — assign when:
- Cluster represents a broad primary topic the business should own completely
- Volume and competition justify comprehensive long-form treatment
- Multiple supporting clusters exist that would link to this as a hub
- Typically the primary service category for the business

**No action required** — assign when:
- Volume is negligible (under 10 MSV) and competition is low for a reason
- Cluster represents a service the business doesn't offer
- Keyword is navigational for a competitor

### Step 3: Coverage Gap Analysis

Compare the content vehicle assignments against the business's current content inventory (if provided) or against what would be needed for complete coverage.

Identify:
- **Missing coverage** — concept clusters with no current content vehicle
- **Thin coverage** — clusters with a page that doesn't fully cover the concept
- **Duplicate coverage** — multiple pages targeting the same cluster (cannibalization risk)
- **Misassigned coverage** — content in the wrong vehicle (a full page for a term that should be GBP-only, or vice versa)

### Step 4: Geogrid Tracking Keyword Selection

From the full concept map, select 3–5 keywords for geogrid tracking. These are not necessarily the highest-volume keywords — they are the keywords that best represent the business's concept coverage and for which geographic ranking variation is most meaningful.

**Geogrid keyword selection criteria:**
1. Clear local pack intent (not informational, not navigational)
2. One keyword per distinct concept cluster (don't track five plumbing variants — pick one per concept)
3. Competitive enough that current position matters (top 3 vs. position 8 changes lead volume significantly)
4. Representative of the business's primary revenue services (track what makes the business money)
5. Distinct geographic coverage (if the business has multiple service areas, select keywords that test coverage in each)

Output: ranked geogrid tracking list with reasoning per keyword selection.

### Step 5: GBP Confirmation

Confirm the GBP actions that fall out of the concept map:
- Secondary categories to add (each should correspond to a concept cluster)
- Services to add to the GBP service menu (each should be a cluster with a GBP service assignment)
- Attributes to claim (which attributes support which concept clusters)
- Description keywords (which concept clusters should appear naturally in the business description)

### Step 6: Internal Linking Architecture

Design the internal link structure that connects the content vehicles into a coherent topic cluster:

- **Hub page** — the pillar page or primary location page that all supporting pages link to
- **Spoke pages** — location pages and blog posts that link to the hub and to each other where topically relevant
- **GBP-to-website links** — which pages should receive the GBP website link (usually the primary location page or homepage depending on the query)
- **Anchor text guidance** — what concept-based anchor text to use for each internal link

---

## Output Format

```
# Local Content Strategy: [Business Name] — [Market]

## Concept Clusters (N total)

### Cluster 1: [Concept Name]
Primary keyword: [keyword] | MSV: [X]
Supporting keywords: [list]
Intent: [Transactional / Informational / Near-me]
Competition: [High / Medium / Low]
Content vehicle: [assignment]
Reasoning: [1-2 sentences explaining the assignment]

[repeat for all clusters]

---

## Content Vehicle Summary

### Location Pages to Build (N)
| Page | Primary Concept | Primary Keyword | Priority |
|------|----------------|-----------------|----------|
| [page slug] | [concept] | [keyword] | P1/P2/P3 |

### GBP Actions
Categories to add: [list]
Services to add: [list]
Attributes to confirm: [list]

### Blog / FAQ Content to Create (N)
| Topic | Primary Concept | Format | Priority |
|-------|----------------|--------|----------|

### Near-Me Clusters (GBP signal only, no content needed)
[list]

---

## Geogrid Tracking Keywords

1. [keyword] — reasoning: [why this represents the concept well for geogrid]
2. [keyword] — reasoning:
3. [keyword] — reasoning:
[4-5 total]

---

## Coverage Gaps (Priority Order)

1. [Gap description] — [impact on visibility if unaddressed]
2. [Gap description]
[continues]

---

## Internal Linking Architecture

Hub: [page] — receives links from all spokes
Spokes: [list of pages with their hub connection]
Cross-links: [relevant spoke-to-spoke connections]

---

## Production Priority Order

Phase 1 (immediate — GBP actions, no content needed):
[GBP changes that can be made today]

Phase 2 (first 30 days — high-impact content):
[Location pages and GBP services for primary concept clusters]

Phase 3 (30-90 days — supporting content):
[Blog/FAQ content, secondary location pages]

Phase 4 (ongoing):
[Long-tail content, content refresh, gap filling]
```

---

## Usage Notes

**When keyword list is not provided:**
Run local-keyword-research first, then pass the output directly into this skill. The two skills chain naturally.

**When business context is limited:**
Ask for: business type, primary services, locations served, and one or two competitors currently outranking them. This context improves cluster assignments significantly.

**When client has existing content:**
Request a URL list or sitemap. The skill will audit current coverage against the concept map and identify gaps, duplicates, and misassigned pages before recommending new content builds.

**Connection to local-content-briefs:**
This skill produces the strategy. The local-content-briefs skill takes each content vehicle assignment from this output and produces a full semantic content brief. The two skills are designed to chain: run local-content-strategy first, then run local-content-briefs for each piece identified.

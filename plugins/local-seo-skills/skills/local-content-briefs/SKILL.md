---
name: local-content-briefs
description: Generate complete semantic content briefs for local SEO content — location pages, service pages, blog posts, FAQ content, and pillar pages. Use this skill when the user needs a content brief for any piece of local SEO content, has a concept cluster from local-content-strategy and needs to brief the content, asks "what should this page cover", "brief me on [topic] for local SEO", "what concepts should my location page cover", or needs to know what depth to cover each topic at. Also trigger when producing briefs in bulk for a content production run. This skill combines semantic content brief methodology (concept coverage, entity requirements, depth assignments, question mapping) with local SEO specificity (geo-modified entities, local intent signals, GBP-to-page consistency, local schema requirements, AI visibility considerations). Output is a complete brief that a writer or Claude CLI generation loop can execute directly.
metadata:
  version: 1.0.0
  author: Garrett Smith
---

# Local Content Briefs Skill

## Purpose
Produce complete, execution-ready semantic content briefs for local SEO content — briefs that tell a writer (or Claude) exactly what concepts to cover, at what depth, with which entities, answering which questions, in which structure. Local-SEO-aware throughout: every brief accounts for local intent signals, geographic entities, GBP consistency requirements, schema needs, and AI visibility considerations.

## Position in the Workflow
```
local-keyword-research → local-content-strategy → [THIS SKILL] → local-landing-pages / writing
```
Input: concept cluster assignment from local-content-strategy (or a topic + business context directly)
Output: complete semantic content brief ready for execution

## Core Principle: Concepts Over Keywords, Completeness Over Length

A brief that says "target the keyword 'plumber Phoenix' 12 times" produces content Google correctly identifies as thin. A brief that says "cover the concept of emergency plumbing services completely — including response time expectations, licensing requirements, common emergency scenarios, what to do before the plumber arrives, and how to evaluate a plumber in an emergency — with these specific local entities mentioned in context" produces content that earns ranking by demonstrating genuine expertise.

Word count is a byproduct of complete concept coverage, not a target. Set word count ranges based on the depth that genuine concept coverage requires for this specific topic, not based on what competitors have.

---

## Process

### Step 1: Concept Decomposition

For the given topic/cluster, identify:

**Core concept** — the central idea the content must prove you understand. Not the keyword — the actual topic. For "emergency plumber Phoenix" the core concept is not the keyword string but: "how a property owner in Phoenix evaluates, contacts, and works with an emergency plumbing service when they have an urgent plumbing problem."

**Related concepts (10–15)** — adjacent ideas a genuine expert would naturally cover. These are NOT synonyms or keyword variants — they are genuinely distinct topics that someone who truly understands this subject would address. For emergency plumbing: response time expectations, after-hours pricing, what constitutes a plumbing emergency, temporary fixes to limit damage, how to shut off water supply, what to ask when calling, insurance and claim documentation, licensed vs. unlicensed contractors, common emergency scenarios (burst pipe, sewage backup, water heater failure), what to expect on arrival.

**Local-specific concepts** — concepts that are specific to this geographic market and distinguish this content from generic coverage: local water quality issues that affect plumbing, regional climate factors (freeze risk, monsoon flooding), local permit requirements, service area geography, locally-specific entities (neighborhoods served, local landmarks, regional service characteristics).

**Required entities (10–15)** — specific named things that belong in authoritative coverage: the business itself (with address and phone as natural mentions), the city and key neighborhoods, relevant tools and technologies, licensing bodies and credentials, competing concepts that the content should differentiate from, data sources and research that lend credibility, schema entity types that should appear naturally in the text.

### Step 2: Concept Depth Assignment

Not all concepts need equal coverage. Assign each concept a depth tier:

**Comprehensive (400–600 words):** Core concepts that are the reason someone reads this page. The primary service, the primary user question, the primary differentiator. These sections have full explanation, specific examples, local context, and data points. Typically 2–3 per piece.

**Standard (200–300 words):** Supporting concepts that complete the picture. Important context, related services, process explanation, qualification considerations. Typically 4–6 per piece.

**Brief (75–150 words):** Tertiary concepts that establish authority without requiring deep treatment. Mentions that demonstrate breadth of knowledge, contextual details, brief definitions. Typically 4–6 per piece.

**Entity mention (1–2 sentences):** Named things that simply need to appear in context — a tool, a certification, a local landmark, a related service — without requiring dedicated coverage.

### Step 3: Local SEO Specific Requirements

Every brief includes these local-specific elements:

**GBP consistency check** — concepts covered in the brief should align with GBP categories, services, and attributes. If the brief covers "emergency dental service," that concept should also exist as a GBP service. Flag any misalignments.

**NAP natural mention** — where in the content should the business name, address, and phone appear naturally? Not forced — in context. The brief specifies the sections where NAP elements fit naturally into the narrative.

**Local entity integration** — which neighborhoods, landmarks, nearby cities, or local references should appear naturally in the content? These geographic entities strengthen local relevance signals without keyword stuffing.

**Schema requirements** — what structured data types does this content support? LocalBusiness schema (required for location pages), FAQPage schema (for content with Q&A sections), HowTo schema (for process content), Review schema (if testimonials appear). The brief specifies which schema types to implement and which sections they map to.

**AI visibility considerations** — which sections of this content should be formatted for AI Overview inclusion? Direct-answer formatting (question as heading, 2–3 sentence direct answer) for the questions most likely to trigger AI Overviews. The brief identifies 3–5 questions that warrant this treatment.

**Internal linking targets** — which other pages on the site should this content link to? What anchor text is appropriate for each link? How does this page fit into the hub-and-spoke architecture from the content strategy?

### Step 4: Question Mapping

Identify 8–10 questions the target reader would have about this topic. For each question:
- State the question in natural language (as a user would actually ask it)
- Identify which concept section answers it
- Flag if the question warrants direct-answer formatting for AI Overview eligibility
- Note if it's a PAA-type question (short direct answer) vs. a deeper question (substantial section)

### Step 5: Structure Recommendation

Produce a recommended H1/H2/H3 structure that:
- Opens with the core concept before any other framing
- Sequences sections in the order a user making a decision would need the information
- Groups related concepts under logical H2s (don't create a new H2 for every concept)
- Places the highest-value content early (don't bury the most useful section at the bottom)
- Ends with a conversion-oriented section (contact, booking, next step)
- Names heading text as actual headings, not as descriptions of headings

---

## Output Format

```
# Local Content Brief: [Page Title / Topic]

## Core Concept
[1-2 sentences — the central idea this content must prove you understand]

## Content Vehicle
[Location page / Blog post / FAQ / Pillar page / Service page]

## Target Word Count
[Calculated from concept depth assignments — give a range]

## Primary Keyword
[keyword | MSV: X | Competition: High/Medium/Low]

## Supporting Keywords (weave in naturally — not targets)
[list — these are entities and related terms, not density targets]

---

## Concept Coverage Plan

### Comprehensive Coverage (400–600 words each)
1. [Concept] — [why this gets comprehensive treatment]
   Key points to cover: [3-4 specific sub-points]
   Local specificity: [what makes this concept local-specific]

2. [Concept] — [why]
   [continues]

### Standard Coverage (200–300 words each)
1. [Concept] — [what to cover]
2. [continues]

### Brief Coverage (75–150 words each)
1. [Concept] — [key point only]
2. [continues]

### Entity Mentions (natural, in-context)
[list of entities with brief note on context for mention]

---

## Required Local Entities

| Entity | Type | Context for Mention |
|--------|------|-------------------|
| [Business Name] | Business | Natural mention in intro and CTA sections |
| [City] | Geography | Throughout — geo-relevance signal |
| [Key neighborhoods] | Geography | In service area section |
| [Licensing body] | Credential | In qualifications section |
| [continues] | | |

---

## Questions This Content Answers

| Question | Section | Format | AI Overview candidate? |
|----------|---------|--------|----------------------|
| [Question] | [H2 section] | Direct answer | Yes / No |
| [continues] | | | |

---

## Local SEO Technical Requirements

**GBP consistency:**
[Which GBP services/categories this page should align with]

**NAP placement:**
[Where business name, address, phone should appear naturally]

**Schema to implement:**
- LocalBusiness: [required properties for this page]
- FAQPage: [which Q&A sections to mark up]
- [other schema types]

**Internal links:**
| Link to | Anchor text | Placement |
|---------|-------------|-----------|
| [page] | [text] | [section] |

**AI Overview formatting:**
These questions should use direct-answer format (H3 question, 2-3 sentence answer):
- [Question 1]
- [Question 2]
- [Question 3]

---

## Recommended Content Structure

H1: [Actual heading text — specific, not generic]

[Opening paragraph guidance — what to establish in the first 100 words]

H2: [Section 1 — core concept]
  H3: [Subsection if needed]
  H3: [Subsection if needed]

H2: [Section 2]
  [continues]

H2: Frequently Asked Questions
  H3: [Question in FAQ format]
  H3: [Question in FAQ format]
  [3-5 questions marked for FAQPage schema]

H2: [CTA section — contact / book / request quote]

---

## Quality Checklist
- [ ] 15+ distinct concepts covered
- [ ] All required local entities mentioned in context
- [ ] All 8-10 reader questions answerable from content
- [ ] NAP appears naturally in at least 2 locations
- [ ] At least 3 sections formatted for AI Overview direct-answer eligibility
- [ ] Internal links placed naturally with concept-based anchor text
- [ ] No keyword stuffing — concepts appear because they're relevant, not for density
- [ ] Opening 100 words establish core concept and local context
- [ ] CTA appears at end and optionally mid-page for long content
```

---

## Brief Types by Content Vehicle

### Location Page Brief
Emphasis: local entity density, GBP consistency, LocalBusiness schema, NAP placement, service area specificity, why this location specifically. The brief should produce content that is genuinely unique to this location — not a template with the city name swapped.

### Blog / FAQ Brief
Emphasis: informational intent, direct-answer formatting for AI Overview eligibility, FAQPage schema, depth on the research-phase question being answered, connection to transactional pages via internal links. The brief should produce content that answers a real question completely — not a thin blog post that gestures at the topic.

### Pillar Page Brief
Emphasis: comprehensive concept coverage across the full topic domain, hub-and-spoke internal linking, E-E-A-T signals, multiple schema types, coverage depth that signals genuine subject matter expertise. Target 2,500–4,000 words with 20+ distinct concepts covered.

### Service Page Brief
Emphasis: transactional intent, specific service scope, differentiators, trust signals, schema for the service type, conversion-oriented structure. The brief should produce content that converts a visitor who has already decided they need this service.

---

## Bulk Brief Production

When producing briefs for a full content strategy (multiple pieces from local-content-strategy output):

1. Produce pillar page brief first — establishes the concept framework all other briefs reference
2. Produce primary location page briefs second — highest traffic impact
3. Produce supporting location page briefs third — geographic coverage expansion
4. Produce blog/FAQ briefs last — informational content supports but doesn't lead

For CLI generation loops: each brief is self-contained and can be executed independently. Label each brief file with the content vehicle type and primary keyword for easy identification in the loop.

---

## Connection to Semantic Saturation

A complete set of briefs from this skill, fully executed, produces semantic saturation — comprehensive coverage of a topic across all relevant local search surfaces. The individual briefs ensure each piece of content covers its concept cluster completely. The aggregate of all briefs ensures the business's full content footprint covers the topic domain with no significant gaps.

The local-seo-audit skill can measure the current state of coverage. The local-content-strategy skill identifies what to build. This skill specifies what each piece must contain. Together they form the complete content coverage workflow.

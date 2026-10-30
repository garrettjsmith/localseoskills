# Skill Versions

Pulled from each `skills/*/SKILL.md` frontmatter. Bumped per skill as its SKILL.md or supporting content changes.

## Meta

| Skill | Version |
|-------|---------|
| brief | 3.0.1 |

## Strategy Skills (26)

| Skill | Version |
|-------|---------|
| ai-local-search | 1.0.0 |
| apple-business-connect | 1.0.0 |
| bing-places | 1.0.0 |
| client-deliverables | 1.0.0 |
| dispatch | 1.0.0 |
| gbp-api-automation | 1.0.0 |
| gbp-optimization | 1.1.0 |
| gbp-posts | 1.0.0 |
| gbp-suspension-recovery | 1.0.0 |
| geogrid-analysis | 1.1.0 |
| local-citations | 1.0.0 |
| local-competitor-analysis | 1.0.0 |
| local-content-briefs | 1.0.1 |
| local-content-strategy | 1.0.0 |
| local-keyword-research | 1.1.0 |
| local-landing-pages | 1.1.0 |
| local-link-building | 1.0.0 |
| local-ppc-ads | 1.0.0 |
| local-reporting | 1.1.0 |
| local-schema | 1.0.0 |
| local-search-ads | 1.0.0 |
| local-seo-audit | 1.1.0 |
| lsa-ads | 1.0.0 |
| multi-location-seo | 1.0.0 |
| review-management | 1.1.0 |
| service-area-seo | 1.0.0 |

## Tool Skills (12)

| Skill | Version |
|-------|---------|
| ahrefs-tool | 1.0.0 |
| brightlocal-tool | 1.0.0 |
| dataforseo-tool | 1.0.0 |
| google-analytics-tool | 1.0.0 |
| google-search-console-tool | 1.0.0 |
| local-falcon-tool | 1.0.0 |
| localseodata-tool | 1.0.0 |
| lsa-spy-tool | 1.0.0 |
| screaming-frog-tool | 1.0.0 |
| semrush-tool | 1.0.0 |
| serpapi-tool | 1.0.0 |
| whitespark-tool | 1.0.0 |

## v1.0.0 — Initial public release

**Package stats:** 38 skills (26 strategy + 12 tool) + 1 meta skill (`brief`), 15 scheduled task templates, 12 supported MCP providers.

**Prior milestones (pre-v1.0.0):**
- `brief` meta skill promoted to 3.0.0 (session state + first-run setup + brand brief + cross-location rollup).
- Added 3 strategy skills: `local-content-briefs`, `local-content-strategy`, `dispatch`.
- `localseodata-tool` integration — LocalSEOData (36 endpoints) is now the default data source. 13 strategy skills updated with LocalSEOData data source blocks; 7 tool skills updated with relationship notes.
- `docs/tool-routing` rewritten to position LocalSEOData as primary, other tools as specialists for gaps.

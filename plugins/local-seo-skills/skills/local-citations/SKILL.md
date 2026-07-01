---
name: local-citations
description: When the user wants to build citations, fix NAP inconsistencies, manage business directory listings, or audit citation presence. Also use when the user mentions "citations," "NAP consistency," "business directories," "listing management," "data aggregators," or "citation cleanup." For GBP profile work, see gbp-optimization. For full audit, see local-seo-audit.
metadata:
  version: 1.0.0
  author: Garrett Smith
---

# Local Citations

> **Default data tool:** LocalSEOData (`localseodata-tool`). Use `citation_audit` to check NAP consistency across 20 directories in one call (50 credits). For citation building/submission, use Whitespark or BrightLocal.

You are an expert in local citation strategy. Your goal is to build a consistent, authoritative citation profile that reinforces NAP data across the web and supports local ranking signals.

## What is a Citation?

A citation is any online mention of a business's Name, Address, and Phone number (NAP). Two types:

- **Structured citations**: Directory listings (Yelp, BBB, industry directories) with formatted NAP fields
- **Unstructured citations**: Mentions on blogs, news sites, or other pages where NAP appears in text

---

## NAP Consistency Rules

**Name**: Character-for-character match. "Smith's Plumbing" ≠ "Smiths Plumbing" ≠ "Smith Plumbing LLC"
**Address**: Exact formatting. "123 Main St Ste 200" everywhere — not "Suite" on some and "Ste" on others
**Phone**: Same primary number everywhere. If using a tracking number, it must also appear on your website

### Common Inconsistencies
- Old addresses from a previous location
- DBA vs. legal name variations
- Suite/unit number present on some, missing on others
- Toll-free vs. local number
- Different phone from call tracking implementations
- Abbreviation mismatches (St/Street, Ave/Avenue)

---

## Citation Building Priority

### Tier 1: Essential (Do First)
- Google Business Profile
- Apple Maps / Apple Business Connect
- Bing Places for Business
- Facebook Business Page
- Yelp

### Tier 2: Data Aggregators
These feed data to hundreds of smaller directories:
- Data Axle (formerly Infogroup)
- Neustar/Localeze
- Foursquare

### Tier 3: Major Directories
- BBB (Better Business Bureau)
- Yellow Pages / YP.com
- Angi (Angie's List)
- Thumbtack
- MapQuest
- Superpages
- Manta
- Citysearch

### Tier 4: Industry-Specific
Examples by vertical:
- **Healthcare**: Healthgrades, Vitals, WebMD, Zocdoc
- **Legal**: Avvo, FindLaw, Justia, Martindale
- **Home services**: HomeAdvisor, Porch, Houzz
- **Restaurants**: OpenTable, TripAdvisor, Zomato
- **Real estate**: Zillow, Realtor.com, Redfin
- **Auto**: CarFax, Cars.com, AutoTrader

### Tier 5: Local & Niche
- Local Chamber of Commerce
- Local business associations
- City/town business directories
- State professional association directories
- Niche industry directories

---

## Citation Audit Process

1. Search `"business name" "phone number"` to find existing citations
2. Search `"business name" "address"` for additional mentions
3. Check major directories manually
4. Use citation audit tools (BrightLocal, Whitespark, Moz Local)
5. Document every listing: URL, current NAP, accuracy status
6. Prioritize fixes: wrong info on high-authority sites first

---

## Citation Cleanup

### Fix Priority Order
1. Tier 1 directories (Google, Apple, Bing, Yelp, Facebook)
2. Data aggregators (Data Axle, Neustar, Foursquare)
3. High-authority directories with wrong information
4. Duplicate listings on any directory
5. Industry-specific directories
6. Lower-authority directories

### How to Fix
- **Claim and update**: Most directories allow you to claim the listing
- **Submit corrections**: Use the directory's correction/update form
- **Data aggregator updates**: Fix at the source — changes propagate downstream
- **Duplicate suppression**: Merge or mark duplicates on each platform

---

## Citation Building for Multi-Location

### At Scale
- Use data aggregator submissions to cascade to smaller directories
- Bulk submit to Tier 1-3 directories
- Prioritize industry-specific directories by location
- Maintain a master spreadsheet of all citations per location

### Per-Location Tracking
Track per location:
- Total citations
- Percentage accurate
- Missing from which Tier 1 directories
- Industry-specific directory coverage

---

## Output Format

### Citation Audit Report
- Total citations found
- Accuracy rate (% consistent NAP)
- Tier-by-tier coverage
- Specific listings needing correction
- Missing directory opportunities
- Prioritized action plan

---

## Task-Specific Questions

1. What is the exact NAP (as it should appear everywhere)?
2. Has the business moved, changed names, or changed phone numbers?
3. Single location or multi-location?
4. What industry? (determines industry-specific directories)
5. Has any citation work been done previously?

---

## What to Do Next

| What You Found | Next Action | Skill |
|----------------|-------------|-------|
| Citations are clean but GBP isn't optimized | GBP is the #1 citation — optimize it first | `gbp-optimization` |
| Found NAP inconsistencies during audit | Fix citations as part of the broader audit action plan | `local-seo-audit` |
| Website schema doesn't match citation data | Align schema with corrected NAP | `local-schema` |
| Managing citations for multiple locations | Build a citation management system per-location | `multi-location-seo` |
| Citations are clean but still not ranking | Citations alone won't fix ranking — run a geogrid scan to diagnose | `geogrid-analysis` |

**Default next step:** After citation cleanup, wait 4-8 weeks for changes to propagate through aggregators and downstream directories, then re-audit to verify.

## Tools for This Skill

See `docs/tool-routing` to pick based on what's connected.

- **Citation audit** (find listings, check accuracy) → citation tools (multiple options)
- **Citation building** (submit to directories) → citation tools (multiple options — quality varies)

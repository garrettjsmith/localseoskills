---
name: bing-places
description: When the user wants to optimize their Bing Maps listing, set up Bing Places for Business, or improve visibility in Microsoft's search ecosystem. Also use when the user mentions "Bing Places," "Bing Maps," "Bing local," "Microsoft local listings," or "Copilot local." For Google Business Profile, see gbp-optimization. For Apple Maps, see apple-business-connect.
metadata:
  version: 1.0.0
  author: Garrett Smith
---

# Bing Places for Business

You are an expert in Bing Places for Business and Bing Maps optimization. Your goal is to maximize a business's visibility across Microsoft's ecosystem — Bing Search, Bing Maps, Microsoft Copilot, and Windows integrations.

## Why Bing Matters

- ~10% US desktop search market share (higher than most people think)
- Default search on Microsoft Edge, Windows devices, Xbox
- Microsoft Copilot uses Bing data for local recommendations
- Older/wealthier demographics over-index on Bing
- Less competition — most businesses ignore Bing optimization
- Free to claim and optimize

---

## Bing Places Overview

Bing Places for Business is Microsoft's tool for managing how your business appears on Bing Search and Bing Maps.

### What You Can Manage
- Business name, address, phone, hours
- Categories
- Photos
- Business description
- Service areas
- Social media links
- Special hours

### Access
- bingplaces.com
- Requires Microsoft account
- Free to claim and manage
- Bulk upload available for multi-location

---

## Setup & Claiming

### Claim Your Listing
1. Go to bingplaces.com
2. Sign in with Microsoft account
3. Search for your business
4. Claim the listing
5. Verify ownership (phone, email, or postcard)

### Import from Google
Bing Places offers direct GBP import:
1. In Bing Places dashboard, select "Import from Google"
2. Sign in with your Google account
3. Select locations to import
4. Bing pulls all data from GBP
5. Review and confirm

**This is the fastest setup path** — import from Google, then customize for Bing-specific features.

### Verification Methods
- Phone call to business number
- Email verification
- Postcard with PIN
- Bulk verification for 10+ locations

---

## Profile Optimization

### Business Information
- **Name**: Exact match to real-world name (same rules as GBP)
- **Address**: Accurate, consistent with other listings
- **Phone**: Same number as GBP and other citations
- **Hours**: Accurate regular and special hours
- **Website**: Primary URL
- **Description**: Up to 300 words, keyword-rich but natural

### Categories
- Bing uses its own category taxonomy
- Select primary + additional categories
- Import from Google maps reasonably well but verify
- Some Google categories don't have Bing equivalents

### Photos
- Add logo, cover, and additional photos
- Similar quality standards to GBP
- Bing supports fewer photo types than Google

### Attributes & Features
- Social media links (Facebook, Twitter, Instagram, etc.)
- Payment methods accepted
- Service area definition
- Amenities and features

---

## Bing Maps Ranking Factors

Less documented than Google, but observed factors:

1. **NAP consistency**: Matching data across Bing, website, and citations
2. **Category accuracy**: Correct business categorization
3. **Completeness**: Fully filled profile
4. **Website quality**: Bing indexes and evaluates your website
5. **Citation signals**: Third-party directory listings
6. **Review signals**: Bing doesn't have native reviews but pulls from third-party sources
7. **Engagement**: Clicks, direction requests, calls from Bing results

### Key Difference: Reviews
Bing Places doesn't have its own review system. It aggregates from:
- TripAdvisor
- Yelp (in some cases)
- Other third-party platforms

Maintaining good reviews on TripAdvisor and other platforms benefits Bing visibility.

---

## Microsoft Copilot & Local

- Microsoft Copilot uses Bing data for local queries
- Well-optimized Bing Places profiles appear in Copilot responses
- Similar to Google AI / ChatGPT dynamic — structured business data helps AI understand and recommend your business
- This is an emerging opportunity most competitors ignore

---

## Multi-Location Management

### Bulk Upload
- CSV/TSV file upload for 10+ locations
- Template available from Bing Places dashboard
- Map fields to Bing's required format
- Bulk verification available

### Ongoing Management
- Dashboard supports managing multiple locations
- No robust API equivalent to Google's GBP API
- Third-party platforms (Yext, BrightLocal) can manage Bing listings
- Import from Google can be re-run to sync updates

---

## Common Mistakes

- **Ignoring Bing entirely** — most common mistake, easy win
- **Not importing from Google** — fastest path, most people don't know about it
- **Inconsistent data** — different info on Bing vs. Google vs. website
- **Set and forget** — Bing profiles need updates when business info changes
- **Missing categories** — Bing categories don't always auto-map from Google

---

## Task-Specific Questions

1. Has the business claimed its Bing Places listing?
2. Single or multi-location?
3. Is GBP already optimized? (Import from Google is fastest path)
4. What third-party review platforms are active? (TripAdvisor, Yelp)
5. Is there an existing citation management platform?

---

## What to Do Next

| What You Found | Next Action | Skill |
|----------------|-------------|-------|
| Bing done, Google not optimized yet | Google is the priority — Bing is supplementary | `gbp-optimization` |
| Also need Apple Maps coverage | Claim and optimize Apple Business Connect | `apple-business-connect` |
| Citations feeding wrong data to Bing | Fix citation and aggregator data | `local-citations` |
| Need to manage Bing + Google + Apple for multiple locations | Build cross-platform management workflow | `multi-location-seo` |
| Copilot showing AI results for local queries | Optimize for AI-powered local search across platforms | `ai-local-search` |

**Default next step:** Bing Places can be auto-imported from Google. Do that, verify the data, then focus ongoing effort on Google. Revisit Bing quarterly to catch data drift.

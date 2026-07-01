---
name: gbp-api-automation
description: When the user wants to programmatically manage Google Business Profiles at scale via API, automate GBP updates, build GBP management tools, or integrate GBP data into their systems. Also use when the user mentions "GBP API," "Google Business Profile API," "bulk GBP management," "automate GBP," "GBP integration," or "programmatic GBP." For manual GBP optimization, see gbp-optimization. For multi-location strategy, see multi-location-seo.
metadata:
  version: 1.0.0
  author: Garrett Smith
---

# GBP API & Automation

You are an expert in Google Business Profile API capabilities and programmatic management at scale. Your goal is to help businesses and agencies automate GBP operations for 10-500+ locations efficiently and safely.

## API Landscape Overview

Google has split GBP functionality across multiple APIs:

### Google My Business API (Legacy)
- Being deprecated in favor of newer APIs
- Some endpoints still active during transition
- Check current deprecation status before building

### Current APIs (as of early 2026)

**Business Profile API**
- Account and location management
- Location verification
- Read/update business information

**Business Information API**
- Categories, attributes, chains
- Location details CRUD operations
- Search for locations

**Business Profile Performance API**
- Impressions, actions, direction requests
- Search keyword data
- Historical performance metrics

**My Business Notifications API**
- Webhook notifications for profile changes
- Review notifications
- Question notifications

**My Business Q&A API**
- Read and respond to Q&A

**My Business Lodging API**
- Hotel-specific data and features

**My Business Verifications API**
- Initiate and complete verification

### What Requires Separate APIs
- **Reviews**: Read via API, but responding requires different access
- **Posts**: GBP post creation via API
- **Photos**: Upload and manage media
- **Insights**: Performance data extraction

---

## Authentication & Setup

### Requirements
1. Google Cloud project
2. Enable relevant Business Profile APIs
3. OAuth 2.0 credentials (service account or web app flow)
4. GBP account access (Owner or Manager role)
5. API quota approval (for higher limits)

### Access Levels
- **Owner**: Full API access, can manage users
- **Manager**: Most operations except ownership transfer
- **Communications Manager**: Limited to posts, Q&A, reviews

### Rate Limits
- Default quotas are restrictive for bulk operations
- Request quota increases through Google Cloud Console
- Batch requests to reduce API calls
- Implement exponential backoff for rate limit errors
- Cache responses where appropriate

---

## Common Automation Patterns

### Bulk Information Updates
```
For each location:
  1. Read current data
  2. Compare to master database
  3. Patch only changed fields
  4. Log changes for audit
```

**Caution**: Updating too many locations simultaneously can trigger automated review. Stagger updates across hours/days.

### Automated Posting
```
For each location:
  1. Generate post from template + location variables
  2. Attach location-specific photo
  3. Create post via API
  4. Log post ID and timestamp
  5. Schedule next post
```

**Cadence**: 1-3 posts per location per week. Don't post identical content across all locations simultaneously.

### Review Monitoring
```
On schedule (hourly/daily):
  1. Fetch new reviews for all locations
  2. Classify sentiment and urgency
  3. Route negative reviews for immediate response
  4. Queue positive reviews for batch response
  5. Track metrics (count, rating, velocity)
```

### Performance Data Extraction
```
Monthly:
  1. Pull performance metrics for all locations
  2. Aggregate into reporting database
  3. Generate comparison reports
  4. Flag locations with declining metrics
```

### Verification Management
```
For new locations:
  1. Create location
  2. Initiate verification
  3. Track verification status
  4. Retry if verification expires
  5. Alert on failures
```

---

## Suspension Risk from API Usage

### High-Risk Actions
- Bulk name changes (even legitimate ones trigger review)
- Mass category changes
- Rapid creation of many new locations
- Updating address for many locations simultaneously
- Automated content that looks templated/spammy

### Risk Mitigation
- Stagger bulk operations over days/weeks
- Change one major field at a time (don't batch name + address + category)
- Monitor for suspension flags after bulk operations
- Keep detailed audit logs of all API changes
- Test changes on a small batch before full deployment
- Avoid making changes during known Google update periods

### Safe Operations (Low Suspension Risk)
- Reading/exporting data
- Updating hours
- Adding photos
- Creating posts (reasonable cadence)
- Responding to reviews
- Updating descriptions
- Adding services/products

---

## Third-Party Platforms

For teams that don't want to build custom API integrations:

### Location Management Platforms
- **Yext**: Enterprise location data management
- **Uberall**: Multi-location marketing platform
- **Rio SEO**: Enterprise local marketing
- **Synup**: Location management and analytics
- **BrightLocal**: Agency-focused local SEO tools

### GBP-Specific Tools
- **Whitespark**: Listing management and tracking
- **Local Viking**: GBP management and posting
- **Publer / Loomly**: Social + GBP posting

### Build vs. Buy Decision

| Factor | Build Custom | Use Platform |
|--------|-------------|-------------|
| Locations | 50+ with specific needs | Any count |
| Budget | Dev resources available | Monthly SaaS budget |
| Customization | Need unique workflows | Standard workflows OK |
| Maintenance | Can maintain ongoing | Want managed solution |
| Data ownership | Need raw data access | Reports sufficient |

---

## Data Architecture for Multi-Location

### Master Location Database
Essential fields:
- Location ID (internal)
- Google Place ID
- GBP account/location reference
- Business name (canonical)
- Address (USPS-formatted)
- Phone (E.164 format)
- Primary category
- Additional categories
- Service areas
- Hours (regular + special)
- Website URL
- Status (active, suspended, pending)
- Last updated timestamp

### Sync Logic
```
Master DB → API → GBP
         ↑
API reads ← GBP (detect unauthorized edits)
```

Monitor for discrepancies between your master data and what's live on GBP. Google and users can suggest edits that override your data.

---

## Monitoring & Alerting

### What to Monitor
- **Unauthorized edits**: Someone (Google or users) changed your data
- **Suspension events**: Location suspended or disabled
- **Review alerts**: New reviews (especially negative)
- **Verification status**: Locations losing verification
- **Performance anomalies**: Sudden drops in impressions or actions
- **API errors**: Failed operations, rate limits, auth issues

### Alert Priority
- **P0 (immediate)**: Suspension, verification loss, business name change
- **P1 (same day)**: Negative review, address edit suggestion, hours change
- **P2 (next business day)**: Performance drop, new Q&A, positive review
- **P3 (weekly review)**: Photo suggestions, attribute changes, category suggestions

---

## Task-Specific Questions

1. How many locations need API management?
2. What operations need automation? (updates, posts, reviews, reporting)
3. Build custom or use a platform?
4. What's the current tech stack?
5. Who manages the Google Cloud project and API credentials?
6. What's the change management process for bulk updates?

---

## What to Do Next

| What You Found | Next Action | Skill |
|----------------|-------------|-------|
| API is set up, need to know WHAT to optimize | Define optimization standards per location | `gbp-optimization` |
| Need to automate posts across locations | Build post templates with location variables | `gbp-posts` |
| API operations triggered a suspension | Stop API calls immediately, follow recovery process | `gbp-suspension-recovery` |
| Need to extract performance data for reports | Pull metrics via API and feed into reporting | `local-reporting` |
| Need to manage reviews at scale | Set up review monitoring and response workflows | `review-management` |

**Default next step:** API is a delivery mechanism. Define your optimization strategy first (`gbp-optimization`, `multi-location-seo`), then automate it.

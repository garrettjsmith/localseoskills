# Approval Workflow

Three tiers based on what the task does and who it touches.

---

## Tier 1: Autonomous

Runs, writes output, no human needed. Agent acts on its own authority.

**Tasks:** monitoring alerts, ranking reports, audit scans, competitor snapshots, prospect audits

**Flow:**
```
Task runs → Output file written → Brief updated → Notification sent (if configured)
```

**Notification:** Summary alert only. "Weekly scan complete for Keystone Buffalo — 1 new finding. See report."

---

## Tier 2: Queue for Approval

Runs, produces draft, holds until a human approves. Nothing goes live until approved.

**Tasks:** GBP posts, review responses, local page content, client-facing reports

**Flow:**
```
Task runs → Draft written to drafts/ → Approval request sent → Human reviews → 
  APPROVED → Task executes delivery → Delivery confirmed
  REJECTED → Draft archived, note logged
```

**Approval request contains:**
- What was drafted
- Where it will go when approved
- Preview of the content
- Approve / Reject / Edit instructions

**Approval channel:** Slack (preferred) or email, configured per brand

**Approval timeout:** 48 hours. If no response, task logs timeout and re-notifies once. After 72 hours, draft is archived and flagged in brief.

---

## Tier 3: Notify Before AND After

Highest stakes. Agent notifies before execution, waits for explicit go-ahead, executes, then confirms completion.

**Tasks:** Sending client-facing emails, pushing content live to GBP or website, any action touching a third party outside the agency

**Flow:**
```
Task runs → Draft ready → PRE-APPROVAL notification sent →
Human confirms → Task executes →
POST-EXECUTION notification sent to configured recipients (agency + client)
```

**Pre-approval notification contains:**
- What is about to happen
- Who it will go to
- Full preview
- Explicit confirm / cancel

**Post-execution notification:**
- What was sent/published
- When
- Confirmation reference
- Sent to: agency reviewer + client notification address

---

## Agency Configuration

Approval chain is configured at the brand level in `_brand.brief.md`:

```yaml
approval:
  reviewer: agency                    # who approves drafts
  reviewer_channel: slack             # slack | email
  reviewer_contact: #local-seo-alerts # Slack channel or email address
  
  client_notify: true                 # whether clients get post-execution alerts
  client_channel: email
  client_contact: contact@client.com
  client_notify_format: summary       # summary | full
  
  approval_timeout_hours: 48
  timeout_action: archive             # archive | escalate
```

Single-user (non-agency) config:

```yaml
approval:
  reviewer: self
  reviewer_channel: slack
  reviewer_contact: #my-alerts
  client_notify: false
```

---

## Platform Notes

**Claude (native):** Approval notifications via Gmail MCP or Slack MCP. Approval confirmed by replying to the Slack message or email, or by updating the `Approval Required` field in the draft file and triggering a follow-up task.

**LSEOAgent / OpenClaw / custom:** Implement the same three tiers using whatever notification and confirmation mechanism fits your stack. The draft file schema and approval status fields are platform-agnostic — your system reads the `Status: PENDING` field and manages the approval UI.

---

## What Never Gets Auto-Approved

Regardless of configuration, these always require explicit human approval:

- Any content going live on a client's GBP
- Any email sent to a client or third party
- Any content published to a website
- Any action that cannot be easily undone

# Postmortem: [YYYY-MM-DD] [short impact description]

> **Blameless** post-mortem for a significant incident. Focus on systems and processes, **never on people**.
> Goal: understand the root cause, prevent recurrence, and share how the system really behaves under stress.
> Duration of the *cause* and duration of the *consequences* are almost never the same number — track both.
> Replace `[placeholders]`. Delete the italic prompts once filled in.

## At a glance

- **Incident:** [one-line: what broke]
- **Severity:** [SEV1 / SEV2 / SEV3]
- **Status:** [investigating / mitigated / resolved / closed]
- **Detected:** [YYYY-MM-DD HH:MM] · **Resolved:** [YYYY-MM-DD HH:MM]
- **Incident lead:** [who]

## Summary

- On **[date]**, we detected via **[alert / dashboard / partner / user complaint]** that **[what was going wrong]**.
- *One line on the context that made it look normal at first, if any. This is usually where detection was lost.*
- **Time to detect:** [x] · **Time to resolve:** [y]

## Impact

- **Users:** [how many, and what they actually experienced: waited, saw errors, got wrong data, were blocked].
- **Business:** [SLA / financial / partner-relationship exposure. Name the commitment at risk and whether we stayed inside it].
- **Ops / team:** [extra backlog or manual work created; what the team had to stop doing].

## Root cause

- **[What actually broke, in one sentence a non-expert can follow.]**
  - *Technical or process detail, plus a link to the incident thread.*
- **Detection gap:** *what we were looking at, vs what we should have been. Which check did not exist, or existed but was not run.*

## Timeline

| Time | Event | What we believed at the time |
|------|-------|------------------------------|
| [t0] | [what happened] | [belief] |
| [t1] | ⚠️ *detection was possible here but missed* | |
| [t2] | [detected — who, where, first action] | |
| [t3] | [root cause confirmed & fixed] ✅ *what worked* / ❌ *what was tried and didn't* | |

## What worked / what didn't

- **Went well:** *what contained the impact (monitoring that caught it, a person who stepped in, good runbook).*
- **Went badly:** *what we missed and why it was reasonable to miss it. Be specific about the reasoning at the time — "we normalised it too fast because of X" beats "we didn't notice".*

## Learnings & actions

**Main learning:** *the one sentence you would tell your backup so this does not happen again.*

*If the data already existed and we just didn't look often enough, say so: that turns "build something" into "change a habit / add an alert".*

| Action | Owner | Deadline | Status |
|--------|-------|----------|--------|
| [what we will change] | [who] | [when] | [not started] |
| | | | |

---

<details>
<summary><b>Optional: debrief meeting agenda</b> <i>(for Major/Critical incidents)</i></summary>

Run a 30-45 min blameless debrief once the report above is drafted.

**Ground rules** (state them at the start): blameless (systems, not individuals) · psychological safety · honesty even when uncomfortable · stay solution-oriented · everyone contributes · park off-topic items.

**Agenda:**
1. **Intro** — purpose + ground rules.
2. **Overview** (5-10 min) — incident lead walks the timeline and impact.
3. **Deep dive** (5-10 min) — clarify gaps, confirm root cause, assess the response.
4. **Brainstorm** (15-20 min), five questions:
   - How can we detect issues earlier?
   - How can we improve response time and effectiveness?
   - What prevents a similar incident?
   - What do we prioritise so this exact incident can't recur short-term?
   - Are there systemic issues to address?
5. **Follow-ups** (5 min) — assign owner + priority for each action (rows in the table above).

</details>

<details>
<summary><b>Example (generic, delete before use)</b></summary>

**Summary:** On 2026-03-02, a memory-alert page fired that the payment worker OOM-killed every ~20 min. It looked like normal autoscaling churn at first, which is where we lost ~40 min of detection.

**Root cause:** a new code path loaded the full transaction history into memory per request. Detection gap: we alerted on pod restarts but not on per-request memory, so the pattern read as scaling noise.

**Main learning:** we already had the memory metric in the dashboard, we just weren't alerting on it → this is an *alert* fix, not an eng rebuild.

</details>

# Project one-pager + runbook

> Reusable template to document a project / migration / operation.
> Goal: **anyone can pick it up without you** so you are not a single point of failure (SPOF).
> The top block is a one-pager (readable with zero context); the depth lives in the collapsible sections.
> Plain Markdown, tool-agnostic (Notion, Obsidian, GitHub). Replace `[placeholders]`, delete what you don't need.

## At a glance

- **What & why:** [one or two sentences: what this does and the problem it solves]
- **Owner / backup:** [you] / [who else can take over]
- **Status:** [not started / in progress / done]. **Current step:** [where it stands right now]
- **Design doc / key context:** [link]
- **Scripts / code:** [link]

## Context: the *why*

- Starting state of the system (before).
- The core constraint or risk that **drives the approach** (e.g. "changing X in place would break everything at once, hence pattern Y").

## Approach & decisions

- The chosen pattern/strategy and **why** (+ alternatives ruled out).
- Known gotchas: *what + why + how to avoid*.

<details>
<summary><b>Runbook: steps, commands, checks, rollback</b></summary>

Setup block to copy:

```
VAR1=... ; VAR2=...
```

| # | Step | Action | Command | Check -> expected | Watch | Rollback |
|---|------|--------|---------|-------------------|-------|----------|
| 1 | [step] | [what it does] | `cmd` | `check` -> [expected] | [dashboard/alert] | [how to undo + delay] |

**Legend:** shell pitfalls, where to run what (local vs remote), when rollback is instant vs costly.

**How to know the current state:** the commands that tell you *where things stand* at any moment (so anyone resumes cold).

</details>

<details>
<summary><b>Log: what was actually done (state, not plan)</b></summary>

The anti-SPOF section: not the plan, but the **exact commands run**, per item, so anyone can resume without you.

- [Item] · [status] · `exact command` (+ PR / ticket link)

</details>

<details>
<summary><b>Inventory / mapping</b></summary>

Reference table of every item and its key attributes. This is the source of truth for the current state.

| Item | Type | Key config | Specifics | Status |
|------|------|-----------|-----------|--------|
| [item] | [type] | [...] | [...] | [ ] |

</details>

<details>
<summary><b>Learnings</b></summary>

What testing and practice taught you: the surprises and, above all, the **fixes** (*what + why*). A comparison table of the options if relevant.

</details>

<details>
<summary><b>Guardrails, communication & risks</b></summary>

- **Always / never:** [non-negotiable rules].
- **Communication, scaled to the blast radius of the change.** Who is affected decides who you warn and how early: a demo-env change means warning the sales team (a broken demo hurts them); a prod change means a wide announcement plus a business-calendar check; a review-app change means a quick heads-up is enough.

| Env / criticality | Announcement lead time | Channels | Check before |
|-------------------|------------------------|----------|--------------|
| [prod] | [D-3] | [channels] | [business calendar, DRI availability] |

- **Main risks and mitigations:**

| Risk | Mitigation |
|------|------------|
| [risk] | [mitigation] |

</details>

## References

Official docs, reference modules/examples, tickets, decisions, key people.

## Scripts and doc link each other

Link to the scripts here. One line per script: **what it does + its arguments**. Every script carries a header comment (*what + why*). The doc points to the script, the script points back to the doc/step, so neither is a black box.

---

*One-pager on top so a newcomer gets it in 30 seconds; details on demand below so nothing is lost.*

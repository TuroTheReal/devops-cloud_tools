# Project one-pager

> Reusable template to document a project / migration / operation.
> Goal: **anyone can pick it up without you** so you are not a single point of failure (SPOF).
> The **core** sections fit any project. The **optional modules** at the end are for ops / migration / multi-step work: keep only what applies, delete the rest.
> Plain Markdown, tool-agnostic (Notion, Obsidian, GitHub). Replace `[placeholders]`.

## At a glance

- **What & why:** [one or two sentences: what this does and the problem it solves]
- **Owner / backup:** [you] / [who else can take over]
- **Status:** [not started / in progress / done]. **Current step:** [where it stands right now]
- **Key context / design doc:** [link]

## Context: the *why*

- Starting state (before).
- The core constraint or risk that **drives the approach**.

## Approach & decisions

- The chosen strategy and **why** (+ alternatives ruled out).
- Known gotchas: *what + why + how to avoid*.

## Risks & mitigations

| Risk | Mitigation |
|------|------------|
| [risk] | [mitigation] |

## Communication

Scale it to the blast radius of the change: who is affected decides who you warn and how early. A demo change means warning the sales team (a broken demo hurts them); a prod change means a wide announcement plus a business-calendar check; a review-app change means a quick heads-up is enough.

## Learnings

What testing and practice taught you: the surprises and the **fixes** (*what + why*).

## References

Official docs, reference modules/examples, tickets, decisions, key people.

---

## Optional modules (keep what fits your project)

<details>
<summary><b>Runbook: steps, commands, checks, rollback</b> <i>(ops / migration / cutover)</i></summary>

Setup block to copy:

```
VAR1=... ; VAR2=...
```

| # | Step | Action | Command | Check -> expected | Watch | Rollback |
|---|------|--------|---------|-------------------|-------|----------|
| 1 | [step] | [what it does] | `cmd` | `check` -> [expected] | [dashboard/alert] | [how to undo + delay] |

**How to know the current state:** the commands that tell you *where things stand* at any moment (so anyone resumes cold).

</details>

<details>
<summary><b>Action log: what was actually done</b> <i>(hands-on execution, the anti-SPOF record)</i></summary>

Not the plan, the **exact commands run**, per item, so anyone can resume without you.

- [Item] · [status] · `exact command` (+ PR / ticket link)

</details>

<details>
<summary><b>Inventory / mapping</b> <i>(multi-item migrations)</i></summary>

Reference table of every item and its key attributes. The source of truth for the current state.

| Item | Type | Key config | Specifics | Status |
|------|------|-----------|-----------|--------|
| [item] | [type] | [...] | [...] | [ ] |

</details>

<details>
<summary><b>Scripts</b> <i>(if the project ships scripts)</i></summary>

Link to the scripts. One line per script: **what it does + its arguments**. Every script carries a header comment (*what + why*). The doc points to the script, the script points back to the doc/step, so neither is a black box.

</details>

<details>
<summary><b>Guardrails</b> <i>(ops: non-negotiable rules)</i></summary>

- **Always:** [rule].
- **Never:** [anti-pattern].
- **Before each critical step:** [mandatory check].

</details>

---

*Core on top so a newcomer gets it in 30 seconds; optional ops modules below so nothing is lost.*

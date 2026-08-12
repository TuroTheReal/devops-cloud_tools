# Design doc: [system / change]

> Reusable template for a **technical design proposal**.
> Goal: think ahead, get feedback **early**, and document the *why* behind new code (this is the genesis of a system, not its ongoing documentation).
> Write one when the work is **> ~1 quarter** OR **hard to reverse** (migration, foundational work).
> **Toolkit, not checklist:** skip any rubric that does not apply, just say so and move on.
> Plain Markdown, tool-agnostic (Notion, Obsidian, GitHub). Replace `[placeholders]`.

## At a glance

- **Author / reviewers:** [you] / [who signs off]
- **Status:** [draft / in review / approved / superseded]
- **One-liner:** [what this builds and the problem it solves, in one sentence]
- **Related:** [ticket / issue / links]

## Context

### Problem statement
What problem are you solving, and why now? The general context a reader needs.

### Use cases
The main user stories the system must support (include the non-happy paths).

### Scope
- **In:** [what this design covers]
- **Out / non-goals:** [what it deliberately does not]

## Design

### Guiding principles
The key properties that drive the design: idempotence, immutability, consistency, traceability, real-time vs batch, backward compatibility. State the 2-3 that matter here.

### Dependencies
Components, 3rd parties, and inputs the system relies on.

### Domain model
The main concepts you deal with and how they relate. A diagram is welcome.

### Interfaces / APIs
What the system exposes externally. Events published/consumed.

### Architecture
A diagram (C4 / [mermaid](https://mermaid.live)) of how it interacts with the rest, and how the internal building blocks fit together.

### Deep dive
The core flows and algorithms. The main technical challenges and the **trade-offs** you make. Enough detail for a useful review, not overwhelming.

### Failure modes
What can go wrong and how you recover. Is failing safe? Is re-running safe (idempotence)? What consistency level do you need (high if money/state moves)?

## Decisions (ADR)

> A running log of the discrete architectural decisions this design makes — the ones worth finding again later, on their own, without re-reading the whole doc.
> **Append-only.** Never rewrite a decided entry. If a decision changes, *add* a new one that supersedes it and flip the old status to `superseded by [id]`. The old entry stays as history.
> **If this log gets large, or one decision needs real depth, split it out** into its own file under `docs/adr/adr-[NNNN]-[slug].md` and link it back here. One file is fine until it isn't.

| ID | Date | Decision | Status |
|----|------|----------|--------|
| ADR-001 | [YYYY-MM-DD] | [one-line decision] | [accepted / superseded by ADR-00X] |

<details>
<summary>Format for a decision that needs more than one line</summary>

**ADR-[NNN]: [short title]**

- **Context:** the forces at play — problem, constraints, requirements. Facts and trade-offs, not opinions.
- **Options considered:** [A — pros / cons] · [B — pros / cons] · [C — pros / cons]
- **Decision:** we chose **[X]** because [reasoning tied to the context above].
- **Consequences:** + [what it unlocks] · − [trade-offs accepted] · follow-ups [migrations / cleanups].

</details>

## Impacts

> Side-effects to think through. If a rubric is irrelevant, say so and skip it.

- **Security / compliance:** authz on the APIs; sensitive data owned, produced, or shared; who has access; threat model ("if I were an attacker…").
- **Cost:** infra cost, risk of runaway spend.
- **Load / scale:** heavy workloads, how it scales, impact on shared infra (API volume, long queries, big jobs).
- **Data:** how analytics/BI consumes what you produce.
- **Other:** [legal, privacy, fraud/abuse — add what applies].

## Execution

### Timeline / milestones
The milestones, rough effort, and any project you depend on that could block you.

### Rollout & rollback
How you ship it: phased / gradual migration / A/B. Compatibility to manage (front/back, mobile). **Can you pause and roll back** if it misbehaves?

### Observability
How you know it works: key health metrics, alerts, dashboards.

### Risks
Feasibility uncertainty, uncontrolled cost, 3rd parties you do not control, risk of data loss in a migration.

## Open questions

Anything you are still unsure about.

---

<details>
<summary><b>Example (generic, delete before use)</b></summary>

**One-liner:** Move session storage from sticky in-memory to Redis so any instance can serve any request.

- **Guiding principles:** statelessness (any pod serves any user), graceful degradation (Redis down → read-only fallback, no hard failure).
- **Failure modes:** Redis unavailable → serve from short-lived local cache, reject writes with a clear 503, auto-recover on reconnect. Writes are idempotent (keyed by session id).
- **Decisions (ADR):**
  - `ADR-001 · 2026-03-01 · chose Redis over Memcached for the session store (needs persistence + pub/sub for fallback signalling) · accepted`
- **Rollout:** dual-write to memory + Redis behind a flag → shift reads to Redis at 5/50/100% → drop memory path. Rollback = flip the flag, memory path still warm until step 3.
- **Observability:** Redis p99 latency, hit/miss ratio, fallback-activations counter (alert if > 0 for 5 min).
- **Risk:** a Redis outage now takes down writes for all instances at once (blast radius up) → mitigated by the local-cache read fallback.

</details>

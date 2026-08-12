# Problem brief: [name]

> A living doc that states **one** problem, the mission that solves it, and the impact of solving it.
> **Start from the problem, not the solution.** Audience: readable by someone outside your team.
> Replace `[placeholders]`. Keep only the rubrics that add signal.

## At a glance

- **Owner:** [one owner]
- **Status:** [scoping / framing / making / monitoring / solved]
- **Updated:** [YYYY-MM-DD]

## The problem

*Frame it as a Job To Be Done, not a feature request:*

- **When I** [context]
- **But** [barrier / friction]
- **Help me** [goal]
- **So I** [outcome]

## Reach — who and how many

Who is affected and at what scale, over a defined period. Say if you're scoping to a subset of a larger problem.

## Success metric

- **Output metric** (the one that says the problem is solved): [metric]
- **Input metrics** (move earlier, predict the output): [metrics]
- **Target:** [value + deadline]

## Appetite

How much effort we **want** to invest (not how long it will take). Ties back to the expected impact.

## Confidence & assumptions

Confidence in the estimates: [high / medium / low] — [why]. List assumptions to prove or kill (write them as statements, not questions):

- [ ] [e.g. "the main friction is the number of fields, not perceived security"]
- [ ] [e.g. "cutting to 3 fields lifts completion by 10 pts"]

## Mission

The one-line ambition that, once reached, resolves the problem.

## Objectives / key results / milestones

| Objective | Measurable key result | Milestone | Date |
|-----------|-----------------------|-----------|------|
| [...] | [...] | [...] | [date] |

## Stakeholders & links

- **Contributors:** [Data / Design / Eng / Ops / Research …]
- **Links:** [specs, dashboards, threads, prototypes]

---

<details>
<summary><b>Optional: RICE prioritization</b> <i>(when arbitrating between several briefs)</i></summary>

`RICE = (Reach × Impact × Confidence) / Effort`

- **Reach:** users affected over a period.
- **Impact:** Massive 3 · High 2 · Medium 1 · Low 0.5 · Minimal 0.25.
- **Confidence:** High 100% · Medium 80% · Low 50%.
- **Effort (Appetite):** the resources you want to invest.

</details>

<details>
<summary><b>Example (generic, delete before use)</b></summary>

**Problem:** When I want to pay for my order (context), but the card form asks for details I don't have on hand (barrier), help me pay without leaving the page (goal) so I finish in one go (outcome).

- **Reach:** ~40% of users reaching the payment step, ~8k sessions/month.
- **Success metric:** payment-step conversion (output); form-completion rate + input-error rate (inputs). Target: +8 pts by end of quarter.
- **Appetite:** one 3-week iteration, 2 people. Not a full redesign this quarter.
- **Assumption to test:** the dominant friction is field count, not perceived security.

</details>

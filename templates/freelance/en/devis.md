# Devis (French quote / estimate): [mission name]

> ⚠️ These templates follow **French law** (you invoice from France); only the language is English. French legal mentions are kept verbatim.
> **Why this doc:** your priced offer which, once signed **"bon pour accord"** (binding acceptance, literally "approved for agreement"), **becomes the contract**. The starting point of the cycle.
> Commercial proposal (descriptive quote) that defines the scope, deliverables, price and timeline.
> **Once signed "bon pour accord", it has contractual value: it IS the contract.** Take care with the excluded scope and the acceptance criteria, that is what prevents disputes.
> ⚠️ Not legal advice. The required mentions depend on your status (micro-enterprise, VAT) and the type of client (B2B/B2C) — check the current rules on service-public.fr / URSSAF (see `SOURCES.md`).
> Replace the `[placeholders]`. Keep the sections you need, delete the rest.

## At a glance

- **Provider:** [name, legal status, address, SIREN/SIRET]
- **Client:** [name, address]
- **Date:** [DD/MM/YYYY] · **Quote ref.:** [no.]
- **Offer validity:** [e.g. 30 days]
- **Status:** [draft / sent / signed]

## 1. Context & objectives

The business problem and the objectives the mission serves (the _why_).

## 2. Scope included (scope in)

What is covered, broken down finely enough to leave no ambiguity (WBS approach: split into work packages).

- [Work package / feature 1]
- [Work package / feature 2]

## 3. Scope excluded (exclusions)

What is **not** included. The list that prevents the most disputes. Any addition goes through an **avenant** (contract amendment — see `avenant.md`).

- [Out of scope 1]
- [Out of scope 2]

## 4. Deliverables

Per deliverable: what it is, the format, who validates it, the quality standard, the approval lead time.

| Deliverable   | Format               | Validated by | Approval lead time    |
| ------------- | -------------------- | ------------ | --------------------- |
| [deliverable] | [e.g. Git repo + doc] | [client]     | [e.g. 5 business days] |

## 5. Acceptance criteria

**Measurable** definition of "done / compliant" per deliverable. This is the objective standard applied at acceptance (PV).

- [Criterion 1, verifiable]
- [Criterion 2, verifiable]

## 6. Assumptions & prerequisites

What the mission assumes on the client's side: access, environments, data, points of contact. If this changes, the estimate changes.

- [Prerequisite / dependency on the client's side]

## 7. Schedule / timeline

Milestones, dates or delivery lead time, blocking dependencies.

| Milestone   | Date / lead time | Dependency     |
| ----------- | ---------------- | -------------- |
| [milestone] | [date]           | [depends on …] |

## 8. Price & payment terms

Detail: each service with quantity/unit price or fixed fee, hourly rate if applicable, **total excl. VAT and incl. VAT**, VAT rate per line, deposit and payment schedule.

| Service   | Qty / fixed fee | Unit price excl. VAT | Total excl. VAT | VAT    |
| --------- | --------------- | -------------------- | --------------- | ------ |
| [service] | [x]             | [€]                  | [€]             | [rate] |

- **Total excl. VAT:** [€] · **VAT:** [€] · **Total incl. VAT:** [€]
- **Deposit:** [e.g. 30% on signature] · **Balance:** [on acceptance without reservations — see `pv-reception.md`]

## 9. Quote validity period

[e.g. 30 days] from the date of issue. _(mandatory mention)_

## 10. Conditions

- **Modification:** any change of scope is the subject of a signed **avenant** (contract amendment — **art. 1193 Code civil**, French Civil Code art. 1193). See `avenant.md`.
- **T&Cs:** [attached / referenced] — late-payment penalties, warranties, **transfer of intellectual property on full payment**, liability.

## 11. Signature — bon pour accord

The client's dated signature preceded by the words **"Bon pour accord"** (binding acceptance) = formal acceptance forming the contract.

- Provider: [name, date, signature]
- Client: **Bon pour accord** — [name, date, signature]

---

<details>
<summary><b>Mandatory FR mentions — checklist</b> <i>(check according to B2C / B2B and your status)</i></summary>

Source: service-public F31144 (see `SOURCES.md`). **Required** for a consumer / personal-services client; **strongly recommended** in B2B.

- [ ] Quote date
- [ ] Provider: name, legal status, address, SIREN/SIRET (French business registration numbers)
- [ ] Client: name, address
- [ ] Detailed description of each service
- [ ] Breakdown: quantity/hours, hourly or fixed price per line
- [ ] VAT rate per line + **total excl. VAT and incl. VAT** (or exemption mention, see below)
- [ ] Breakdown of ancillary costs (excl. VAT / incl. VAT)
- [ ] Offer validity period
- [ ] Date / lead time for execution or delivery
- [ ] **Micro-enterprise under franchise de TVA (VAT exemption for small businesses):** prices excl. VAT + the mention **"TVA non applicable, art. 293 B du CGI"** (VAT not applicable, French Tax Code art. 293 B) — ⚠️ replaced by **"TVA non applicable, art. L.223-3 du CIBS"** (VAT not applicable, art. L.223-3 of the CIBS, the French code on taxation of goods and services) from **1 September 2026**.
- [ ] Keep a copy **≥ 1 year**.

_Note: the handwritten mention "devis reçu avant l'exécution des travaux" (quote received before the work was carried out) is a **construction/building-works** rule, not required for an intellectual/software service. A signed "bon pour accord" is enough._

</details>

<details>
<summary><b>Example (generic, to delete)</b></summary>

**Mission:** setting up a CI/CD pipeline + monitoring for the [X] app.

- **Scope in:** GitHub Actions pipeline (lint/test/build/deploy), Terraform infrastructure as code (staging + prod), dashboards + alerts.
- **Scope out:** application development, data migration, 24/7 on-call (→ see separate maintenance contract).
- **Acceptance criterion:** a push to `main` deploys to staging in < 10 min, documented rollback tested once, an alert firing on a load test.
- **Price:** fixed fee €6,000 excl. VAT, 30% deposit on signature, balance on acceptance without reservations.
- **Micro-enterprise:** "TVA non applicable, art. 293 B du CGI" (VAT not applicable, French Tax Code art. 293 B).

</details>

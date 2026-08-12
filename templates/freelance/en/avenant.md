# Avenant (contract amendment): [subject of the change]

> ⚠️ These templates follow **French law** (you invoice from France); only the language is English. French legal mentions are kept verbatim.
> **Why this doc:** get a scope change accepted in writing **before invoicing it** (otherwise the client can refuse to pay the extra). ≠ avoir (credit note).
> Document that modifies a **already-signed** devis/contract, when the client asks for something outside the initial scope.
> **It is the only legal way to change a signed contract:** mutual consent, no unilateral modification (**art. 1193 Code civil**, French Civil Code art. 1193). You **amend** the original, you do not reissue a new devis (quote) for the delta.
> Unsigned = no value, the initial contract remains the only one in force (you cannot invoice the extra).
> ⚠️ Not legal advice — see `SOURCES.md`. Replace the `[placeholders]`.

## At a glance

- **Initial contract ref.:** [quote no., date, subject]
- **Parties:** [provider] / [client] (same identities as the initial contract)
- **Effective date:** [DD/MM/YYYY]
- **Status:** [proposed / signed]

## 1. Reference to the initial contract

Devis/contract no. [x] of [date], subject "[…]", signed by [signatories]. This avenant (amendment) modifies it.

## 2. Subject of the request

What the client is asking for that falls **outside** the initial scope.

> [Description of the out-of-scope request]

## 3. Modified clauses (before / after)

The precise detail of each item that changes (scope, features, deliverables).

| Item | Before (initial contract) | After (avenant) |
|------|---------------------------|-----------------|
| [e.g. environments] | [staging + prod] | [+ QA/acceptance environment] |

## 4. Price impact

Cost added/removed, new totals excl. VAT / incl. VAT, adjustment of the payment schedule.

- **Delta:** [+ €X excl. VAT] · **New total:** [excl. VAT / incl. VAT] · **Payment:** [terms]

## 5. Schedule impact

Revised lead times/milestones resulting from the change.

| Milestone | Old date | New date |
|-----------|----------|----------|
| [milestone] | [date] | [date] |

## 6. Unchanged clauses

All other stipulations of the initial contract **remain in force**.

## 7. Signatures

Dual signature mandatory (without it, the avenant has no value).

- Provider: [name, date, signature]
- Client: **Bon pour accord** (binding acceptance) — [name, date, signature]

---

<details>
<summary><b>VAT note</b> <i>(micro-enterprise)</i></summary>

Same rules as the devis: prices excl. VAT + **"TVA non applicable, art. 293 B du CGI"** (VAT not applicable, French Tax Code art. 293 B) (→ **"art. L.223-3 du CIBS"** from **1 September 2026**).

</details>

<details>
<summary><b>Example (generic, to delete)</b></summary>

**Subject:** the client asks for a **QA/acceptance environment** in addition to the staging + prod environments planned in the initial devis.

- **Modified clause:** Terraform infrastructure goes from 2 to 3 environments + adapted pipeline.
- **Price impact:** + €900 excl. VAT (new total €6,900 excl. VAT).
- **Schedule impact:** delivery pushed back by 3 business days.
- **Unchanged:** acceptance criteria, payment terms of the initial contract.

</details>

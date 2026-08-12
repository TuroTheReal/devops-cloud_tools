# Maintenance contract / TMA (Tierce Maintenance Applicative, third-party application maintenance): [app name]

> ⚠️ These templates follow **French law** (you invoice from France); only the language is English. French legal mentions are kept verbatim.
> **Why this doc:** to frame the **recurring support after delivery** (what is included vs invoiced, SLA lead times); a contract separate from the project.
> Support / maintenance contract after delivery, with service levels (SLA).
> Distinguish what is **included** (corrective) from what is **invoiced on top** (evolutive), and commit to lead times you can **meet** (no heroic commitments).
> ⚠️ Not legal advice — see `SOURCES.md`. Replace the `[placeholders]`.

## At a glance

- **Provider:** [name, EI, SIRET] · **Client:** [name]
- **Subject:** maintenance of [app / scope]
- **Term:** [e.g. 12 months, tacit renewal] · **Notice:** [e.g. 3 months]
- **Model:** [monthly fixed fee / time-and-materials / per ticket]

## 1. Subject & definitions

What "maintenance" covers + a short glossary: incident, anomaly, severity, **GTI** (Garantie de Temps d'Intervention = guaranteed response time / acknowledgement), **GTR** (Garantie de Temps de Rétablissement = guaranteed resolution or workaround time).

## 2. Scope

- **Covered:** [apps / modules / versions / environments]
- **Excluded (explicit):** [hardware, OS, third-party software, major version upgrade, data loss through misuse]

## 3. Types of maintenance

- **Corrective** (fixing anomalies) — [included in the fixed fee]
- **Preventive / adaptive** (compatibility, security, dependency updates) — [included / limited]
- **Evolutive** (new features) — **outside the fixed fee, invoiced on top** (goes through a devis / avenant, quote / amendment).

## 4. Service levels (SLA)

Time is counted **during business hours** (see §5).

| Severity | Example | GTI (response) | GTR (resolution) |
|----------|---------|----------------|------------------|
| Blocking | prod down | [e.g. 4 h] | [e.g. 1 business day] |
| Major | degraded function | [e.g. 1 day] | [e.g. 3 business days] |
| Minor | minor nuisance | [e.g. 2 days] | [e.g. next release] |

- **Target availability:** [e.g. 99% / month] · **Penalties if exceeded:** [reasonable — see notes].

## 5. Availability & channel

- **Business hours:** [e.g. 9am-6pm, business days]. No on-call unless stated.
- **Channel:** [ticket / email / phone] · **Out-of-hours on-call:** [yes / no, conditions].

## 6. Pricing

- **Model:** [monthly fixed fee €X for N h/tickets] / [time-and-materials daily rate €Y] / [per ticket].
- **Overage:** [rate beyond the fixed fee].
- **Revision:** [annual].
- Micro under exemption: net amount, "TVA non applicable, art. 293 B du CGI" (VAT not applicable, French Tax Code art. 293 B) (→ CIBS on 01/09/2026).

## 7. Obligations

- **Provider:** **obligation de moyens** (best-efforts obligation, not a guaranteed result), documentation of interventions, knowledge continuity.
- **Client:** access to the environments, backups, not modifying the code themselves, reporting incidents according to the rules.

## 8. Intellectual property

**Written and precise** assignment of the fixes / developments specific to the client (payment does not automatically transfer the rights — FR copyright law). You keep your pre-existing tools / frameworks (appendix).

## 9. Confidentiality & GDPR

Confidentiality clause + **DPA (art. 28 RGPD**, art. 28 GDPR**)** if you process personal data on the client's behalf.

## 10. Liability

Best-efforts obligation (obligation de moyens), **liability cap** [e.g. ≤ the annual contract amount], exclusion of indirect damages.

## 11. Term, renewal & termination

- **Initial term:** [e.g. 12 months]. **Renewal:** [tacit].
- **Termination notice:** [e.g. 3 months before the term]. Termination for fault: [conditions].
- **Reversibility:** knowledge transfer at the end of the contract (documentation, support [3-6 months], return / certified deletion of the data).

## 12. Insurance & governing law

- **Professional liability insurance (RC Pro)** of the provider: [yes / recommended]. **Governing law:** French; attempt at amicable settlement then [competent court].

---

<details>
<summary><b>FR legal notes</b></summary>

- **Tacit renewal:** the **loi Chatel** (Chatel law: written reminder between 3 and 1 month before the term) only applies in **B2C**. In **B2B (professional client), it does not apply** → your renewal/notice clause is your **only** protection, draft it explicitly (Code civil, freedom of contract).
- **Obligation de moyens** (best-efforts, not a result): stating it caps your exposure. Add a liability cap + exclusion of indirect damages.
- **Intellectual property:** paying ≠ assigning the rights (copyright). A written assignment clause is mandatory for the client to exploit / modify freely.
- **SLA penalties:** dissuasive but reasonable — a manifestly excessive (or derisory) penalty clause can be revised by the judge (**art. 1231-5 Code civil**, French Civil Code art. 1231-5).
- **Reclassification as employment:** a single client + a relationship of subordination = a risk. Keep language of autonomy in the contract.

</details>

<details>
<summary><b>Example (generic, to delete)</b></summary>

**Maintenance of a Terraform infrastructure + CI/CD pipeline.**

- Corrective included; evolutive (new environment, new stack) invoiced on top.
- Blocking SLA: GTI 4 h, GTR 1 business day (business hours 9am-6pm).
- Fixed fee €500/month (up to 5 tickets), overage at the daily rate €500.
- 12 months, tacit renewal, 3 months' notice. Professional liability insurance active.

</details>

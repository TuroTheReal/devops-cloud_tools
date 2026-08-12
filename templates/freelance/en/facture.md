# Facture (invoice): [no.]

> ⚠️ These templates follow **French law** (you invoice from France); only the language is English. French legal mentions are kept verbatim.
> **Why this doc:** to **get paid**, issued **against the PV** (acceptance report); it negotiates nothing, it invoices what is already agreed (devis + avenant).
> Service invoice. Issued **after** acceptance (signature of the PV de réception) and referencing it.
> Template for a **micro-entrepreneur under franchise de TVA** (VAT exemption for small businesses — no VAT charged). Adapt it if you are liable for VAT.
> ⚠️ Not legal advice. To issue for real, a **billing tool** is safer (gapless numbering, archiving, **electronic invoicing** compliance 2026-2027). Check the current rules — see `SOURCES.md`.
> Wrong or cancelled invoice? You don't modify it → you issue an **avoir** (credit note — `avoir.md`).
> Replace the `[placeholders]`.

## At a glance

- **Invoice no.:** [continuous chronological sequence, no gaps — e.g. 2026-001]
- **Issue date:** [DD/MM/YYYY] · **Service date:** [DD/MM/YYYY]
- **Ref.:** quote no. [x] · PV de réception (acceptance report) of [date]
- **Due:** [e.g. 30 days / on receipt]

## Provider

[First name Last name] — **EI (Entrepreneur Individuel)** (Individual Entrepreneur / sole trader)
[Address]
SIRET [xxxxxxxxxxxxxx] (French business registration number) · [legal form]
[IBAN / BIC] *(recommended)*

## Client

[Name / company name]
[Billing address]
[Purchase order no., if any]

## Service details

| Description | Quantity / unit | Unit price excl. VAT | Amount |
|-------------|-----------------|----------------------|--------|
| [service] | [x man-days / fixed fee] | [€] | [€] |
| [discount, if any] | | | [- €] |

**Total net payable: [€]**
*(franchise de TVA / VAT exemption: a net amount, no excl. VAT / incl. VAT lines and no VAT. If liable for VAT: total excl. VAT + VAT rate and amount + total incl. VAT.)*

**TVA non applicable, art. 293 B du CGI** (VAT not applicable, French Tax Code art. 293 B)
*(→ replace with "TVA non applicable, art. L.223-3 du CIBS" (VAT not applicable, art. L.223-3 of the CIBS) from 1 September 2026; both wordings are accepted until 31/12/2027.)*

## Payment

- **Due:** [date / on receipt]. *(B2B legal cap: 30 days, or 45 days end of month / 60 days if agreed.)*
- **Method:** bank transfer — [IBAN / BIC].
- **Late-payment penalties:** [rate] % *(≥ 3× the legal interest rate; if no rate is stated, ECB policy rate + 10 points. Revised each half-year — keep it as a variable.)*
- **Fixed recovery indemnity: €40** *(B2B, per unpaid invoice — **art. L441-10 et D441-5 du Code de commerce**, French Commercial Code art. L441-10 and D441-5.)*
- **No discount for early payment.** *(mandatory mention)*

---

<details>
<summary><b>Mandatory-mentions checklist</b> <i>(to tick before sending)</i></summary>

- [ ] The word **"Facture"** (Invoice) + **sequential number** continuous and chronological (never a gap, never reused)
- [ ] Issue date + service date
- [ ] Provider: name, **EI**, address, SIRET, legal form
- [ ] Client: name/company name + address (+ purchase order no. if any)
- [ ] Precise description + quantity/unit + unit price excl. VAT + earned discounts
- [ ] Total net (exemption) **or** total excl. VAT + VAT rate/amount + incl. VAT (if liable)
- [ ] VAT-exemption mention (293 B → CIBS on 01/09/2026) — unless liable for VAT
- [ ] Payment due date
- [ ] Late-payment penalty rate + €40 indemnity (B2B) + "No discount"
- [ ] **Keep for 10 years** (**art. L123-22 Code de commerce**, French Commercial Code art. L123-22)

*Omission/error: tax fine of €15/mention (capped at ¼ of the invoice) + administrative fine up to €75,000 (natural person).*
*Do NOT use "Dispensé d'immatriculation" (exempt from registration): obsolete (you have a SIRET).*

</details>

<details>
<summary><b>Electronic invoicing — what concerns you (micro)</b></summary>

Reform under way, current legal schedule (already postponed in the past → to watch):

- **1 Sept. 2026:** obligation to **RECEIVE** B2B electronic invoices via an **approved platform (PDP** — Plateforme de Dématérialisation Partenaire, partner e-invoicing platform**)**. All businesses. → open a PDP account before then.
- **1 Sept. 2027:** obligation to **ISSUE** B2B invoices electronically + **e-reporting** (very small businesses / micro).
- **Structured/hybrid formats** (**Factur-X** the simplest). A PDF by email will no longer be enough in B2B.
- **B2C / international:** outside B2B e-invoicing, but subject to **e-reporting** from your issue date.
- ⚠️ The free public portal (PPF) for exchange has been dropped: you must go through a **PDP** (some have a free offer).

</details>

<details>
<summary><b>Example (generic, to delete)</b></summary>

**Invoice 2026-014** — setting up a CI/CD pipeline (ref. quote 2026-006, PV of 12/06/2026).

- Service: fixed fee "CI/CD pipeline + monitoring" — €6,000 net.
- **Total net payable: €6,000.** TVA non applicable, art. 293 B du CGI (VAT not applicable, French Tax Code art. 293 B).
- Due: 30 days. Penalties: [rate] % + €40 indemnity. No discount for early payment.

</details>

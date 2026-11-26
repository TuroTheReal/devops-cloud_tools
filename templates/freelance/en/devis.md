# Devis (French quote / estimate): [mission name]

> ⚠️ These templates follow **French law** (you invoice from France); only the language is English. French legal mentions are kept verbatim.
> **Why this doc:** your priced offer which, once signed **"bon pour accord"** (binding acceptance, literally "approved for agreement"), **becomes the contract**. The starting point of the cycle.
> Commercial proposal (descriptive quote) that defines the scope, deliverables, price and timeline.
> **Once signed "bon pour accord", it has contractual value: it IS the contract.** Take care with the excluded scope and the acceptance criteria, that is what prevents disputes.
> ⚠️ Not legal advice. The required mentions depend on your status (micro-enterprise, VAT) and the type of client (B2B/B2C): check the current rules on service-public.fr / URSSAF (see `SOURCES.md`).
> **Work on a copy, never on this file.** `cp devis.md ~/Documents/clients/x/quote-2026-001.md`, then fill the copy.
> Replace the `[placeholders]`. Keep the sections you need, delete the rest. Leave the `>` lines: they never reach the PDF.
> **Export: one PDF**, for every offer, in this order: quote, frozen CGV of the version in force (filled copy, e.g. `cgv-v1.0.md`, never the blank template), data processing agreement, acceptance page. `cat quote-N.md cgv-v1.0.md dpa-N.md acceptation-N.md > bundle-N.md`, then `scripts/utils/md2pdf.sh bundle-N.md`: it warns if any placeholder a client would see is left.

## At a glance

- **Offer:** [infrastructure / website redesign / AI environment setup] (chapter A, B or C of part 2 of the CGV)
- **Provider:** [name, legal status, address, SIREN/SIRET]
- **Client:** [name, address]
- **Date:** [DD/MM/YYYY] · **Quote ref.:** [no.]
- **Contact:** [email]
- **Offer validity:** [e.g. 30 days]
- **Status:** [draft / sent / signed]

## 1. Context & objectives

The business problem and the objectives the mission serves (the _why_).

## 2. Scope included (scope in)

What is covered, broken down finely enough to leave no ambiguity (WBS approach: split into work packages).

- [Work package / feature 1]
- [Work package / feature 2]

## 3. Scope excluded (exclusions)

What is **not** included. The list that prevents the most disputes. Any addition goes through an **avenant** (contract amendment).

- [Out of scope 1]
- [Out of scope 2]

## 3 bis. Options, on quote

> Fill in or delete: what the client can add later, priced now. An option read at decision time sells better than a follow-up three months on.

| Option | What it adds | Price excl. tax |
| --- | --- | --- |
| [option] | [what it adds] | [€] |

## 3 ter. Costs and disbursements

Third-party costs needed for the mission, in particular hosting, domain names, licences and subscriptions, **remain the Client's and are taken out in the Client's name**. The Provider does not advance them.

Any on-site travel, if requested, is a separate line in this quote.

## 4. Deliverables

Per deliverable: what it is, the format, who validates it, the quality standard, the approval lead time.

| Deliverable   | Format               | Validated by | Approval lead time    |
| ------------- | -------------------- | ------------ | --------------------- |
| [deliverable] | [e.g. Git repo + doc] | [client]     | [e.g. 5 business days] |

## 5. Acceptance criteria

**Measurable** definition of "done / compliant" per deliverable. This is the objective standard applied at acceptance (PV).

- [Criterion 1, verifiable]
- [Criterion 2, verifiable]

## 6. Prerequisites and limits

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
- **Deposit and balance:** according to the offer's schedule (CGV, part 2): [40% on order, balance on …] · **Payment:** [15 days from invoice date]
- **TVA non applicable, article 293 B du CGI** (VAT not applicable, article 293 B of the French Tax Code).

## 9. Quote validity period

[e.g. 30 days] from the date of issue. _(mandatory mention)_

## 10. Conditions

- **Modification:** any change of scope is the subject of a signed **avenant** (contract amendment, **art. 1193 Code civil**, French Civil Code art. 1193).
- **Data processing agreement (article 28 GDPR):** attached to this quote. Signing the quote accepts this agreement.
- **Artificial intelligence:** the Provider uses an artificial intelligence service on the code, the configuration, the Client's public content and the information provided to frame the mission. It sends it none of the Client's logs, databases, exports or mailboxes, unless authorised on the acceptance page.
- **T&Cs (CGV):** attached to this quote, **version [1.0] dated [DD/MM/YYYY]**. The Client acknowledges having read them. Part 1 and the chapter of the offer named at the top apply. They carry in particular the schedule, acceptance, warranty, **assignment of intellectual property on payment in full**, the liability cap and sensitive data (§16 bis). **Citing the version is essential**: it is what proves which one was accepted.

## 11. Acceptance

This quote is accepted by signing the acceptance page at the end of the bundle. This single signature covers the quote, the CGV and the data processing agreement attached.

> You do not sign: your quote sent is the offer, the client's signature the acceptance (article 1113 of the French Civil Code). Keep the sending email as proof.

> **Sign remotely** (email or electronic signature), never at the client's premises: a quote signed on site with a professional employing 5 people or fewer, for a service outside its main activity, gives it 14 days to withdraw (art. L.221-3 of the French consumer code).

---

<details>
<summary><b>Mandatory FR mentions, checklist</b> <i>(check according to B2C / B2B and your status)</i></summary>

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
- [ ] **Micro-enterprise under franchise de TVA (VAT exemption for small businesses):** prices excl. VAT + the mention **"TVA non applicable, article 293 B du CGI"** (VAT not applicable, article 293 B of the French Tax Code).
- [ ] Keep a copy **≥ 1 year**.

_Note: the handwritten mention "devis reçu avant l'exécution des travaux" (quote received before the work was carried out) is a **construction/building-works** rule, not required for an intellectual/software service. A signed "bon pour accord" is enough._

</details>

<details>
<summary><b>Example (generic, to delete)</b></summary>

**Mission:** setting up a CI/CD pipeline + monitoring for the [X] app.

- **Scope in:** GitHub Actions pipeline (lint/test/build/deploy), Terraform infrastructure as code (staging + prod), dashboards + alerts.
- **Scope out:** application development, data migration, 24/7 on-call (→ see separate maintenance contract).
- **Acceptance criterion:** a push to `main` deploys to staging in < 10 min, documented rollback tested once, an alert firing on a load test.
- **Price:** fixed fee €6,000 excl. VAT, 40% deposit on order, balance on acceptance without reservations, payment within 15 days.
- **Micro-enterprise:** "TVA non applicable, article 293 B du CGI" (VAT not applicable, article 293 B of the French Tax Code).

</details>

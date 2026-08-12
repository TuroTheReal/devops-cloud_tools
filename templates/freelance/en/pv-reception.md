# PV de réception (acceptance report) / handover: [mission name]

> ⚠️ These templates follow **French law** (you invoice from France); only the language is English. French legal mentions are kept verbatim.
> **Why this doc:** get the client to **formally record delivery**; without it (signed without reservations), no final payment is due.
> Acceptance report (PV de réception): records what was delivered and stands as acceptance.
> **Pivot document:** a PV signed **without reservations** unlocks the right to **final payment**, starts the warranties, transfers liability, and makes any later challenge of visible defects much harder. You invoice **against the PV**, not before.
> The *Access* and *Credentials transfer* sections are not legal fields of the PV, but they are the real "handover" of a software delivery (anti-SPOF on the client's side).
> ⚠️ Not legal advice — see `SOURCES.md`. Replace the `[placeholders]`.

## At a glance

- **Client (project owner / maître d'ouvrage):** [name]
- **Provider (lead contractor / maître d'œuvre):** [name]
- **Project:** [name] · **Ref.:** [quote no. + avenants (amendments)]
- **Date & place of acceptance:** [DD/MM/YYYY, place / video call]
- **Decision:** [without reservations / with reservations / refusal]

## 1. Deliverables received

Detailed list of what is delivered, against the specification + signed avenants (amendments).

- [Deliverable 1]
- [Deliverable 2]

## 2. Checks / tests performed (acceptance testing)

What was checked against the **acceptance criteria** of the devis (quote).

| Acceptance criterion | Result |
|----------------------|--------|
| [criterion] | [✅ compliant / ❌ gap] |

## 3. Access & onboarding (handover pack)

*Best practice, not a legal field — but it is the real value of the handover.* How to run / access:

- **Environments / URLs:** [staging, prod]
- **Code repositories:** [repo links]
- **Deployment / runbook:** [how to deploy, rollback]
- **Documentation:** [links]

## 4. Transfer of access & credentials

*Best practice.* Clean transfer so the client is autonomous without you:

- **Secrets / credentials:** [secrets manager, service accounts]
- **Cloud / hosting / registrar:** [transfer of account / domain ownership]
- **Admin accounts:** [who becomes owner]

## 5. Reservations

Defects/objections raised. Acceptance **with reservations** preserves the client's remedies on the listed points while still recording the delivery.

| # | Reservation | Severity | Agreed remediation | Deadline |
|---|-------------|----------|--------------------|----------|
| 1 | [defect] | [blocking / minor] | [action] | [date] |

## 6. Acceptance decision

- [ ] **Without reservations** — compliant, unlocks final payment.
- [ ] **With reservations** — accepted except for the points in §5.
- [ ] **Refusal** — non-compliant, reasons: [.…].

## 7. Signatures

- Client: [name, date, signature]
- Provider: [name, date, signature]

---

<details>
<summary><b>FR legal notes</b></summary>

- **PV without reservations** → confirms compliance, **opens the right to full payment**, starts the warranty, transfers liability (the client can more hardly challenge apparent defects afterwards).
- **PV → invoice link:** it is the PV without reservations that legally triggers the final **facture** (invoice). Invoice after the PV.
- **Intellectual property:** the transfer of rights over the code is formalised here (or in the T&Cs) as effective **on full payment** — otherwise the transfer can be challenged.

</details>

<details>
<summary><b>Example (generic, to delete)</b></summary>

**Project:** delivery of a Terraform infrastructure + CI/CD pipeline.

- **Deliverables received:** Terraform repos (staging/prod), GitHub Actions pipeline, dashboards + alerts, deployment/rollback runbook.
- **Acceptance testing:** staging deploy < 10 min ✅, rollback tested ✅, load alert fired ✅.
- **Handover:** cloud account transferred to client as owner, secrets migrated into their vault, operations doc handed over.
- **Decision:** acceptance **without reservations** → balance invoice issued the next day.

</details>

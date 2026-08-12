# Devis : [nom de la mission]

> **Pourquoi ce doc :** ton offre chiffrée qui, signée « bon pour accord », **devient le contrat**. Le point de départ du cycle.
> Proposition commerciale (devis descriptif) qui définit le périmètre, les livrables, le prix et les délais.
> **Une fois signée "bon pour accord", elle a valeur contractuelle : c'est LE contrat.** Soigne le périmètre exclu et les critères d'acceptation, c'est ce qui évite les litiges.
> ⚠️ Pas un conseil juridique. Les mentions dépendent de ton statut (micro-entreprise, TVA) et du type de client (B2B/B2C) — vérifie l'à-jour sur service-public.fr / URSSAF (voir `SOURCES.md`).
> Remplace les `[placeholders]`. Garde les rubriques utiles, supprime le reste.

## At a glance

- **Prestataire :** [nom, statut juridique, adresse, SIREN/SIRET]
- **Client :** [nom, adresse]
- **Date :** [JJ/MM/AAAA] · **Réf. devis :** [n°]
- **Validité de l'offre :** [ex. 30 jours]
- **Statut :** [brouillon / envoyé / signé]

## 1. Contexte & objectifs

Le problème business et les objectifs que la mission sert (le _pourquoi_).

## 2. Périmètre inclus (scope in)

Ce qui est couvert, décomposé assez finement pour ne laisser aucune ambiguïté (approche WBS : découpe en lots).

- [Lot / fonctionnalité 1]
- [Lot / fonctionnalité 2]

## 3. Périmètre exclu (exclusions)

Ce qui **n'est pas** inclus. La liste qui prévient le plus de litiges. Tout ajout passera par un avenant (voir `avenant.md`).

- [Hors scope 1]
- [Hors scope 2]

## 4. Livrables

Par livrable : ce que c'est, le format, qui le valide, le standard de qualité, le délai d'approbation.

| Livrable   | Format               | Validé par | Délai d'approbation  |
| ---------- | -------------------- | ---------- | -------------------- |
| [livrable] | [ex. repo Git + doc] | [client]   | [ex. 5 jours ouvrés] |

## 5. Critères d'acceptation

Définition **mesurable** du "terminé / conforme" par livrable. C'est le standard objectif appliqué à la réception (PV).

- [Critère 1, vérifiable]
- [Critère 2, vérifiable]

## 6. Hypothèses & prérequis

Ce que la mission suppose côté client : accès, environnements, données, points de contact. Si ça change, l'estimation change.

- [Prérequis / dépendance côté client]

## 7. Planning / échéancier

Jalons, dates ou délai d'exécution, dépendances bloquantes.

| Jalon   | Date / délai | Dépendance    |
| ------- | ------------ | ------------- |
| [jalon] | [date]       | [dépend de …] |

## 8. Prix & modalités de paiement

Détail : chaque prestation avec quantité/prix unitaire ou forfait, taux horaire si applicable, **total HT et TTC**, taux de TVA par ligne, acompte et échéancier.

| Prestation   | Qté / forfait | Prix unitaire HT | Total HT | TVA    |
| ------------ | ------------- | ---------------- | -------- | ------ |
| [prestation] | [x]           | [€]              | [€]      | [taux] |

- **Total HT :** [€] · **TVA :** [€] · **Total TTC :** [€]
- **Acompte :** [ex. 30 % à la signature] · **Solde :** [à la réception sans réserve — voir `pv-reception.md`]

## 9. Durée de validité du devis

[ex. 30 jours] à compter de la date d'émission. _(mention obligatoire)_

## 10. Conditions

- **Modification :** tout changement de périmètre fait l'objet d'un avenant signé (art. 1193 Code civil). Voir `avenant.md`.
- **CGV :** [annexées / référencées] — pénalités de retard, garanties, **transfert de propriété intellectuelle à paiement complet**, responsabilité.

## 11. Signature — bon pour accord

Signature datée du client précédée de la mention **"Bon pour accord"** = acceptation formant le contrat.

- Prestataire : [nom, date, signature]
- Client : **Bon pour accord** — [nom, date, signature]

---

<details>
<summary><b>Mentions obligatoires FR — checklist</b> <i>(vérifie selon B2C / B2B et ton statut)</i></summary>

Source service-public F31144 (voir `SOURCES.md`). **Requis** pour un client particulier / service à la personne ; **fortement recommandé** en B2B.

- [ ] Date du devis
- [ ] Prestataire : nom, statut juridique, adresse, SIREN/SIRET
- [ ] Client : nom, adresse
- [ ] Description détaillée de chaque prestation
- [ ] Décompte : quantité/heures, prix horaire ou forfaitaire par ligne
- [ ] Taux de TVA par ligne + **total HT et TTC** (ou mention de franchise, voir ci-dessous)
- [ ] Ventilation des frais annexes (HT/TTC)
- [ ] Durée de validité de l'offre
- [ ] Date / délai d'exécution ou de livraison
- [ ] **Micro-entreprise en franchise de TVA :** prix en HT + mention **"TVA non applicable, art. 293 B du CGI"** — ⚠️ remplacée par **"TVA non applicable, art. L.223-3 du CIBS"** à partir du **1er septembre 2026**.
- [ ] Conserver une copie **≥ 1 an**.

_Note : la mention manuscrite "devis reçu avant l'exécution des travaux" est une règle **BTP/travaux**, pas requise pour une prestation intellectuelle/logicielle. Un "bon pour accord" signé suffit._

</details>

<details>
<summary><b>Exemple (générique, à supprimer)</b></summary>

**Mission :** mise en place d'un pipeline CI/CD + monitoring pour l'app [X].

- **Scope in :** pipeline GitHub Actions (lint/test/build/deploy), infra as code Terraform (staging + prod), dashboards + alertes.
- **Scope out :** développement applicatif, migration de données, astreinte 24/7 (→ voir contrat de maintenance séparé).
- **Critère d'acceptation :** un push sur `main` déploie en staging en < 10 min, rollback documenté testé une fois, alerte qui se déclenche sur un test de charge.
- **Prix :** forfait 6 000 € HT, acompte 30 % à la signature, solde à la réception sans réserve.
- **Micro-entreprise :** "TVA non applicable, art. 293 B du CGI".

</details>

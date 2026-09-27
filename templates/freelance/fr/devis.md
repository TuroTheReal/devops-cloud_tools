# Devis : [nom de la mission]

> **Pourquoi ce doc :** ton offre chiffrée qui, signée « bon pour accord », **devient le contrat**. Le point de départ du cycle.
> Proposition commerciale (devis descriptif) qui définit le périmètre, les livrables, le prix et les délais.
> **Une fois signée "bon pour accord", elle a valeur contractuelle : c'est LE contrat.** Soigne le périmètre exclu et les critères d'acceptation, c'est ce qui évite les litiges.
> ⚠️ Pas un conseil juridique. Les mentions dépendent de ton statut (micro-entreprise, TVA) et du type de client (B2B/B2C) — vérifie l'à-jour sur service-public.fr / URSSAF (voir `SOURCES.md`).
> Remplace les `[placeholders]`. Garde les rubriques utiles, supprime le reste.

## En bref

- **Prestataire :** [nom, statut juridique, adresse, SIREN/SIRET]
- **Client :** [nom, adresse]
- **Date :** [JJ/MM/AAAA] · **Réf. devis :** [n°]
- **Contact :** [email] · [téléphone]
- **Validité de l'offre :** [ex. 30 jours]
- **Statut :** [brouillon / envoyé / signé]

## 1. Contexte & objectifs

> À remplir : le problème du client et ce que la mission doit résoudre.

## 2. Périmètre inclus

> À remplir : ce qui est couvert, découpé en lots assez fins pour ne laisser aucune ambiguïté.

- [Lot / fonctionnalité 1]
- [Lot / fonctionnalité 2]

## 3. Périmètre exclu

> À remplir : ce qui n'est pas inclus. C'est la liste qui prévient le plus de litiges. Tout ajout passe par un avenant.

- [Hors périmètre 1]
- [Hors périmètre 2]

## 3 bis. Options, sur devis

> À remplir ou à supprimer : ce que le client peut ajouter plus tard, chiffré dès maintenant. Une option lue au moment de la décision se vend mieux qu'une relance trois mois après.

| Option | Contenu | Prix HT |
| --- | --- | --- |
| [option] | [ce qu'elle ajoute] | [€] |

## 3 ter. Frais et débours

Les coûts de services tiers nécessaires à la mission, notamment hébergement, noms de domaine, licences et abonnements, **restent à la charge du Client et sont souscrits à son nom**. Le Prestataire ne les avance pas.

Tout déplacement sur site, s'il est demandé, fait l'objet d'une ligne séparée au présent devis.

## 4. Livrables

> À remplir : par livrable, ce que c'est, son format, qui le valide et sous quel délai.

| Livrable   | Format               | Validé par | Délai d'approbation  |
| ---------- | -------------------- | ---------- | -------------------- |
| [livrable] | [ex. repo Git + doc] | [client]   | [ex. 5 jours ouvrés] |

## 5. Critères d'acceptation

> À remplir : définition mesurable de « terminé » pour chaque livrable. C'est ce qui sera vérifié à la réception.

- [Critère 1, vérifiable]
- [Critère 2, vérifiable]

## 6. Hypothèses & prérequis

> À remplir : ce que la mission suppose côté client, accès, environnements, données, interlocuteur. Si ça change, l'estimation change.

- [Prérequis / dépendance côté client]

## 7. Planning / échéancier

> À remplir : jalons, dates ou délai, et les dépendances bloquantes.

| Jalon   | Date / délai | Dépendance    |
| ------- | ------------ | ------------- |
| [jalon] | [date]       | [dépend de …] |

## 8. Prix & modalités de paiement

> À remplir : chaque prestation avec son forfait ou sa quantité, le total HT, la mention de TVA, l'acompte et l'échéancier.

| Prestation   | Qté / forfait | Prix unitaire HT | Total HT | TVA    |
| ------------ | ------------- | ---------------- | -------- | ------ |
| [prestation] | [x]           | [€]              | [€]      | [taux] |

- **Total HT :** [€] · **TVA :** [€] · **Total TTC :** [€]
- **Acompte :** [40 % à la commande] · **Solde :** [à la réception sans réserve — voir `pv-reception.md`] · **Paiement :** [15 jours date de facture]

## 9. Durée de validité du devis

[30] jours à compter de la date d'émission.

## 10. Conditions

- **Modification :** tout changement de périmètre fait l'objet d'un avenant signé (art. 1193 Code civil). Voir `avenant.md`.
- **CGV :** annexées au présent devis, **version [1.0] du [JJ/MM/AAAA]** (voir `cgv.md`). Le Client reconnaît en avoir pris connaissance. Elles portent les pénalités de retard, la réception, la garantie, la **cession de propriété intellectuelle à paiement intégral** et le plafond de responsabilité. **Citer la version est indispensable** : c'est ce qui permet de prouver laquelle a été acceptée.

## 11. Signature — bon pour accord

> Rappel : la signature datée précédée de « Bon pour accord » forme le contrat.

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

- **Périmètre inclus :** pipeline GitHub Actions (lint/test/build/deploy), infra as code Terraform (staging + prod), dashboards + alertes.
- **Périmètre exclu :** développement applicatif, migration de données, astreinte 24/7 (→ voir contrat de maintenance séparé).
- **Critère d'acceptation :** un push sur `main` déploie en staging en < 10 min, rollback documenté testé une fois, alerte qui se déclenche sur un test de charge.
- **Prix :** forfait 6 000 € HT, acompte 40 % à la commande, solde à la réception sans réserve, paiement à 15 jours.
- **Micro-entreprise :** "TVA non applicable, art. 293 B du CGI".

</details>

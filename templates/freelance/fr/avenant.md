# Avenant : [objet du changement]

> **Pourquoi ce doc :** faire accepter par écrit un changement de périmètre **avant de le facturer** (sinon le client peut refuser de payer l'extra). ≠ avoir.
> Document qui modifie un devis/contrat **déjà signé**, quand le client demande quelque chose hors du périmètre initial.
> **C'est le seul moyen légal de changer un contrat signé** : consentement mutuel, aucune modification unilatérale (art. 1193 Code civil). On **amende** l'original, on ne réémet pas un nouveau devis pour le delta.
> Non signé = aucune valeur, le contrat initial reste seul en vigueur (tu ne peux pas facturer le surplus).
> ⚠️ Pas un conseil juridique — voir `SOURCES.md`. Remplace les `[placeholders]`.

## At a glance

- **Réf. contrat initial :** [n° devis, date, objet]
- **Parties :** [prestataire] / [client] (mêmes identités que le contrat initial)
- **Date d'effet :** [JJ/MM/AAAA]
- **Statut :** [proposé / signé]

## 1. Référence au contrat initial

Devis/contrat n° [x] du [date], objet "[…]", signé par [signataires]. Le présent avenant le modifie.

## 2. Objet de la demande

Ce que le client demande et qui tombe **hors** du périmètre initial.

> [Description de la demande hors-scope]

## 3. Clauses modifiées (avant / après)

Le précis de chaque élément qui change (périmètre, fonctionnalités, livrables).

| Élément | Avant (contrat initial) | Après (avenant) |
|---------|-------------------------|-----------------|
| [ex. environnements] | [staging + prod] | [+ environnement de recette] |

## 4. Impact prix

Coût ajouté/retiré, nouveaux totaux HT/TTC, ajustement de l'échéancier de paiement.

- **Delta :** [+ X € HT] · **Nouveau total :** [HT / TTC] · **Paiement :** [modalité]

## 5. Impact planning

Délais/jalons révisés du fait du changement.

| Jalon | Ancienne date | Nouvelle date |
|-------|---------------|---------------|
| [jalon] | [date] | [date] |

## 6. Clauses inchangées

Toutes les autres stipulations du contrat initial **restent en vigueur**.

## 7. Signatures

Double signature obligatoire (sans elle, l'avenant n'a aucune valeur).

- Prestataire : [nom, date, signature]
- Client : **Bon pour accord** — [nom, date, signature]

---

<details>
<summary><b>Note TVA</b> <i>(micro-entreprise)</i></summary>

Mêmes règles que le devis : prix HT + **"TVA non applicable, art. 293 B du CGI"** (→ **"art. L.223-3 du CIBS"** à partir du **1er septembre 2026**).

</details>

<details>
<summary><b>Exemple (générique, à supprimer)</b></summary>

**Objet :** le client demande un **environnement de recette** en plus des environnements staging + prod prévus au devis initial.

- **Clause modifiée :** infra Terraform passe de 2 à 3 environnements + pipeline adapté.
- **Impact prix :** + 900 € HT (nouveau total 6 900 € HT).
- **Impact planning :** livraison décalée de 3 jours ouvrés.
- **Inchangé :** critères d'acceptation, modalités de paiement du contrat initial.

</details>

# Contrat de maintenance / TMA : [nom de l'app]

> **Pourquoi ce doc :** cadrer le **support récurrent après la livraison** (ce qui est inclus vs facturé, délais SLA) ; contrat séparé du projet.
> Contrat de support / maintenance après livraison, avec niveaux de service (SLA).
> Distingue ce qui est **inclus** (correctif) de ce qui est **facturé en plus** (évolutif), et engage-toi sur des délais que tu peux **tenir** (pas d'engagement héroïque).
> ⚠️ Pas un conseil juridique — voir `SOURCES.md`. Remplace les `[placeholders]`.

## At a glance

- **Prestataire :** [nom, EI, SIRET] · **Client :** [nom]
- **Objet :** maintenance de [app / périmètre]
- **Durée :** [ex. 12 mois, reconduction tacite] · **Préavis :** [ex. 3 mois]
- **Modèle :** [forfait mensuel / régie / au ticket]

## 1. Objet & définitions

Ce que couvre la "maintenance" + glossaire court : incident, anomalie, sévérité, **GTI** (garantie de temps d'intervention = prise en charge), **GTR** (garantie de temps de rétablissement = résolution ou contournement).

## 2. Périmètre

- **Couvert :** [apps / modules / versions / environnements]
- **Exclu (explicite) :** [matériel, OS, logiciels tiers, montée de version majeure, perte de données par mauvaise utilisation]

## 3. Types de maintenance

- **Corrective** (correction d'anomalies) — [incluse au forfait]
- **Préventive / adaptative** (compatibilité, sécurité, mises à jour de dépendances) — [incluse / limitée]
- **Évolutive** (nouvelles fonctionnalités) — **hors forfait, facturée en plus** (passe par un devis / avenant).

## 4. Niveaux de service (SLA)

Le temps se décompte **pendant les heures ouvrées** (voir §5).

| Sévérité | Exemple | GTI (prise en charge) | GTR (rétablissement) |
|----------|---------|-----------------------|----------------------|
| Bloquant | prod HS | [ex. 4 h] | [ex. 1 j ouvré] |
| Majeur | fonction dégradée | [ex. 1 j] | [ex. 3 j ouvrés] |
| Mineur | gêne mineure | [ex. 2 j] | [ex. prochaine release] |

- **Disponibilité visée :** [ex. 99 % / mois] · **Pénalités si dépassement :** [raisonnables — voir notes].

## 5. Disponibilité & canal

- **Heures ouvrées :** [ex. 9h-18h, jours ouvrés]. Hors astreinte sauf mention.
- **Canal :** [ticket / email / tél] · **Astreinte hors heures :** [oui / non, conditions].

## 6. Tarification

- **Modèle :** [forfait mensuel X € pour N h/tickets] / [régie TJM Y €] / [au ticket].
- **Dépassement :** [taux au-delà du forfait].
- **Révision :** [annuelle].
- Micro en franchise : montant net, « TVA non applicable, art. 293 B du CGI » (→ CIBS au 01/09/2026).

## 7. Obligations

- **Prestataire :** obligation de **moyens**, documentation des interventions, continuité de connaissance.
- **Client :** accès aux environnements, sauvegardes, ne pas modifier le code lui-même, remonter les incidents dans les règles.

## 8. Propriété intellectuelle

Cession **écrite et précise** des correctifs / développements spécifiques au client (le paiement ne transfère pas automatiquement les droits — droit d'auteur FR). Tu conserves tes outils / frameworks préexistants (annexe).

## 9. Confidentialité & RGPD

Clause de confidentialité + **DPA (art. 28 RGPD)** si tu traites des données personnelles pour le client.

## 10. Responsabilité

Obligation de moyens, **plafond de responsabilité** [ex. ≤ montant annuel du contrat], exclusion des dommages indirects.

## 11. Durée, reconduction & résiliation

- **Durée initiale :** [ex. 12 mois]. **Reconduction :** [tacite].
- **Préavis de résiliation :** [ex. 3 mois avant échéance]. Résiliation pour faute : [conditions].
- **Réversibilité :** transfert de connaissance en fin de contrat (doc, accompagnement [3-6 mois], restitution / suppression certifiée des données).

## 12. Assurance & droit applicable

- **RC Pro** du prestataire : [oui / recommandé]. **Droit applicable :** français ; tentative amiable puis [tribunal compétent].

---

<details>
<summary><b>Notes légales FR</b></summary>

- **Reconduction tacite :** la **loi Chatel** (rappel écrit entre 3 et 1 mois avant l'échéance) ne s'applique qu'en **B2C**. En **B2B (client pro), elle ne s'applique pas** → ta clause de reconduction/préavis est ta **seule** protection, rédige-la explicitement (Code civil, liberté contractuelle).
- **Obligation de moyens** (pas de résultat) : la poser plafonne ton exposition. Ajoute un plafond de responsabilité + exclusion des dommages indirects.
- **Propriété intellectuelle :** payer ≠ céder les droits (droit d'auteur). Clause de cession écrite obligatoire pour que le client exploite / modifie librement.
- **Pénalités SLA :** dissuasives mais raisonnables — une clause pénale manifestement excessive (ou dérisoire) peut être révisée par le juge (art. 1231-5 Code civil).
- **Requalification en salariat :** un seul client + lien de subordination = risque. Garde un langage d'autonomie dans le contrat.

</details>

<details>
<summary><b>Exemple (générique, à supprimer)</b></summary>

**Maintenance d'une infra Terraform + pipeline CI/CD.**

- Corrective incluse ; évolutive (nouvel environnement, nouvelle stack) facturée en plus.
- SLA bloquant : GTI 4 h, GTR 1 j ouvré (heures ouvrées 9h-18h).
- Forfait 500 €/mois (jusqu'à 5 tickets), dépassement au TJM 500 €.
- 12 mois, reconduction tacite, préavis 3 mois. RC Pro active.

</details>

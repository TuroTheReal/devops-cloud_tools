# Facture : [n°]

> **Pourquoi ce doc :** **encaisser**, émise **contre le PV** ; elle ne négocie rien, elle facture ce qui est déjà convenu (devis + avenant).
> Facture de prestation de service. Émise **après** acceptation (signature du PV de réception) et le référence.
> Modèle pour **micro-entrepreneur en franchise de TVA** (pas de TVA facturée). Adapte si tu es assujetti.
> ⚠️ Pas un conseil juridique. Pour émettre pour de vrai, un **outil de facturation** est plus sûr (numérotation sans trou, archivage, conformité **facturation électronique** 2026-2027). Vérifie l'à-jour — voir `SOURCES.md`.
> Facture fausse ou annulée ? On ne la modifie pas → on émet un **avoir** (`avoir.md`).
> Remplace les `[placeholders]`.

## At a glance

- **Facture n° :** [séquence chronologique continue, sans trou — ex. 2026-001]
- **Date d'émission :** [JJ/MM/AAAA] · **Date de la prestation :** [JJ/MM/AAAA]
- **Réf. :** devis n° [x] · PV de réception du [date]
- **Échéance :** [ex. 30 jours / à réception]

## Prestataire

[Nom Prénom] — **EI (Entrepreneur Individuel)**
[Adresse]
SIRET [xxxxxxxxxxxxxx] · [forme juridique]
[IBAN / BIC] *(recommandé)*

## Client

[Nom / dénomination]
[Adresse de facturation]
[N° de bon de commande, si existe]

## Détail des prestations

| Désignation | Quantité / unité | Prix unitaire HT | Montant |
|-------------|------------------|------------------|---------|
| [prestation] | [x jours-homme / forfait] | [€] | [€] |
| [remise éventuelle] | | | [- €] |

**Total net à payer : [€]**
*(franchise de TVA : un montant net, pas de ligne HT/TTC ni de TVA. Si assujetti : total HT + taux et montant de TVA + total TTC.)*

**TVA non applicable, art. 293 B du CGI**
*(→ remplacer par « TVA non applicable, art. L.223-3 du CIBS » à partir du 1er septembre 2026 ; les deux formulations sont acceptées jusqu'au 31/12/2027.)*

## Paiement

- **Échéance :** [date / à réception]. *(plafond légal B2B : 30 j, ou 45 j fin de mois / 60 j si convenu.)*
- **Moyen :** virement — [IBAN / BIC].
- **Pénalités de retard :** [taux] % *(≥ 3× le taux d'intérêt légal ; à défaut de taux indiqué, taux directeur BCE + 10 points. Révisé chaque semestre — garde-le en variable.)*
- **Indemnité forfaitaire de recouvrement : 40 €** *(B2B, par facture impayée — art. L441-10 et D441-5 du Code de commerce.)*
- **Pas d'escompte pour paiement anticipé.** *(mention obligatoire)*

---

<details>
<summary><b>Checklist mentions obligatoires</b> <i>(à cocher avant envoi)</i></summary>

- [ ] Mot **« Facture »** + **numéro séquentiel** chronologique continu (jamais de trou, jamais réutilisé)
- [ ] Date d'émission + date de la prestation
- [ ] Prestataire : nom, **EI**, adresse, SIRET, forme juridique
- [ ] Client : nom/dénomination + adresse (+ n° bon de commande si existe)
- [ ] Désignation précise + quantité/unité + prix unitaire HT + réductions acquises
- [ ] Total net (franchise) **ou** total HT + taux/montant TVA + TTC (si assujetti)
- [ ] Mention franchise TVA (293 B → CIBS au 01/09/2026) — sauf si assujetti
- [ ] Échéance de paiement
- [ ] Taux de pénalités de retard + indemnité 40 € (B2B) + « Pas d'escompte »
- [ ] **Conserver 10 ans** (art. L123-22 Code de commerce)

*Omission/erreur : amende fiscale 15 €/mention (plafonnée au ¼ de la facture) + amende administrative jusqu'à 75 000 € (personne physique).*
*Ne PAS utiliser « Dispensé d'immatriculation » : obsolète (tu as un SIRET).*

</details>

<details>
<summary><b>Facturation électronique — ce qui te concerne (micro)</b></summary>

Réforme en cours, calendrier légal actuel (déjà repoussé par le passé → à surveiller) :

- **1er sept. 2026 :** obligation de **RECEVOIR** les factures électroniques B2B via une **plateforme agréée (PDP)**. Toutes les entreprises. → ouvre un compte PDP avant.
- **1er sept. 2027 :** obligation d'**ÉMETTRE** en électronique B2B + **e-reporting** (TPE / micro).
- **Formats** structurés/hybrides (Factur-X le plus simple). Un PDF par email ne suffira plus en B2B.
- **B2C / international :** hors e-invoicing B2B, mais soumis à **e-reporting** dès ta date d'émission.
- ⚠️ Le portail public gratuit (PPF) pour l'échange a été abandonné : il faut passer par une **PDP** (certaines ont une offre gratuite).

</details>

<details>
<summary><b>Exemple (générique, à supprimer)</b></summary>

**Facture 2026-014** — mise en place pipeline CI/CD (réf. devis 2026-006, PV du 12/06/2026).

- Prestation : forfait « pipeline CI/CD + monitoring » — 6 000 € net.
- **Total net à payer : 6 000 €.** TVA non applicable, art. 293 B du CGI.
- Échéance : 30 jours. Pénalités : [taux] % + indemnité 40 €. Pas d'escompte pour paiement anticipé.

</details>

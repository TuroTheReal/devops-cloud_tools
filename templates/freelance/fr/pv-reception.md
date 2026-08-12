# PV de réception / handover : [nom de la mission]

> **Pourquoi ce doc :** faire **acter la livraison** par le client ; sans lui (signé sans réserve), pas de paiement final exigible.
> Procès-verbal de réception (recette) : constate ce qui a été livré et vaut acceptation.
> **Document pivot :** un PV signé **sans réserve** débloque le droit au **paiement final**, démarre les garanties, transfère la responsabilité, et rend beaucoup plus difficile toute contestation ultérieure des défauts visibles. Tu factures **contre le PV**, pas avant.
> Les sections *Accès* et *Transfert des identifiants* ne sont pas des champs légaux du PV, mais c'est le vrai "handover" d'une livraison logicielle (anti-SPOF côté client).
> ⚠️ Pas un conseil juridique — voir `SOURCES.md`. Remplace les `[placeholders]`.

## At a glance

- **Client (maître d'ouvrage) :** [nom]
- **Prestataire (maître d'œuvre) :** [nom]
- **Projet :** [nom] · **Réf. :** [devis n° + avenants]
- **Date & lieu de réception :** [JJ/MM/AAAA, lieu / visio]
- **Décision :** [sans réserve / avec réserves / refus]

## 1. Livrables reçus

Liste détaillée de ce qui est livré, en regard du cahier des charges + avenants signés.

- [Livrable 1]
- [Livrable 2]

## 2. Vérifications / tests effectués (recette)

Ce qui a été contrôlé face aux **critères d'acceptation** du devis.

| Critère d'acceptation | Résultat |
|-----------------------|----------|
| [critère] | [✅ conforme / ❌ écart] |

## 3. Accès & prise en main (handover pack)

*Best-practice, pas un champ légal — mais c'est la vraie valeur du handover.* Comment faire tourner / accéder :

- **Environnements / URLs :** [staging, prod]
- **Dépôts de code :** [liens repos]
- **Déploiement / runbook :** [comment déployer, rollback]
- **Documentation :** [liens]

## 4. Transfert des accès & identifiants

*Best-practice.* Transfert propre pour que le client soit autonome sans toi :

- **Secrets / identifiants :** [gestionnaire de secrets, comptes de service]
- **Cloud / hosting / registrar :** [transfert de propriété du compte / domaine]
- **Comptes admin :** [qui devient owner]

## 5. Réserves

Défauts/objections soulevés. Une réception **avec réserves** préserve les recours du client sur les points listés tout en actant la livraison.

| # | Réserve | Gravité | Remédiation convenue | Délai |
|---|---------|---------|----------------------|-------|
| 1 | [défaut] | [bloquant / mineur] | [action] | [date] |

## 6. Décision de réception

- [ ] **Sans réserve** — conforme, débloque le paiement final.
- [ ] **Avec réserves** — accepté sauf points du §5.
- [ ] **Refus** — non conforme, motifs : [.…].

## 7. Signatures

- Client : [nom, date, signature]
- Prestataire : [nom, date, signature]

---

<details>
<summary><b>Notes légales FR</b></summary>

- **PV sans réserve** → confirme la conformité, **ouvre le droit au paiement complet**, démarre la garantie, transfère la responsabilité (le client peut plus difficilement contester ensuite les défauts apparents).
- **Lien PV → facture :** c'est le PV sans réserve qui déclenche légalement la **facture** finale. Facture après le PV.
- **Propriété intellectuelle :** le transfert des droits sur le code se formalise ici (ou en CGV) comme effectif **au paiement complet** — sinon le transfert peut être contesté.

</details>

<details>
<summary><b>Exemple (générique, à supprimer)</b></summary>

**Projet :** livraison d'une infra Terraform + pipeline CI/CD.

- **Livrables reçus :** repos Terraform (staging/prod), pipeline GitHub Actions, dashboards + alertes, runbook de déploiement/rollback.
- **Recette :** déploiement staging < 10 min ✅, rollback testé ✅, alerte de charge déclenchée ✅.
- **Handover :** transfert du compte cloud en owner client, secrets migrés dans leur vault, doc d'exploitation remise.
- **Décision :** réception **sans réserve** → facture du solde émise le lendemain.

</details>

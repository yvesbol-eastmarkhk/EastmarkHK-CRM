# EastmarkHK CRM — Spécification complète

CRM multi-plateforme modulaire. Un seul codebase Flutter pour **macOS, iOS, Android et Windows**, comme EastmarkHK e-Invoicing. Cœur 100 % gratuit et complet, modules payants optionnels qui intègrent les apps EastmarkHK existantes.

---

## 1. Vision

Le CRM devient la **fiche client unique** de tout l'écosystème EastmarkHK. Chaque app existante (e-Invoicing, Scanner, Stock, Trade Shows, Name Cards…) devient un **module activable** dans le CRM, tout en continuant d'exister en app indépendante.

Principes non négociables :

1. **Le cœur est gratuit et complet** — contacts, pipeline, historique, tâches, graphiques. Utilisable à vie sans rien acheter. Aucune fonction du cœur n'est bridée.
2. **Standalone d'abord** — SQLite local, zéro serveur obligatoire (même modèle qu'e-Invoicing : « Données 100 % locales »).
3. **Base partagée en option** — mode connecté vers une base commune (module Sync/Équipe), réutilisant l'infrastructure `RemoteDataSyncService` / `remote_einvoicing_api` déjà écrite.
4. **Un module = un achat** — IAP sur les stores, licence signée hors store. Infrastructure déjà en production (`LicenseManager`, `SubscriptionService`, `activation-machine-id`).
5. **Super simple, mais complet** — l'utilisateur qui n'active rien voit un CRM épuré. Chaque module activé ajoute ses écrans et ses données sans complexifier le reste.

## 2. Le cœur gratuit

### Fonctionnalités

- **Contacts & Sociétés** : fiches complètes (multi-contacts par société, TVA/Peppol ID, notes, tags), adresses multi-pays avec autocomplétion code postal → *code déjà écrit dans e-Invoicing (ViaCEP, Zippopotam.us, masques par pays)*.
- **Pipeline de ventes** : opportunités en kanban (colonnes personnalisables : Lead → Contacté → Devis → Négociation → Gagné/Perdu), montant, probabilité, date de clôture prévue.
- **Historique / Timeline** : chaque fiche client affiche chronologiquement tout — notes, appels, emails, et (si modules actifs) devis, factures, scans, leads salon.
- **Tâches & relances** : tâches datées par client, rappels, vue « Aujourd'hui » → *modèle `follow_ups` d'e-Invoicing, généralisé*.
- **Tableau de bord graphique** : pipeline par étape (funnel), CA prévisionnel, activité récente, top clients, opportunités gagnées/perdues par mois → `fl_chart`.
- **Recherche globale** : une barre unique qui cherche dans contacts, sociétés, opportunités, notes — **et dans les données des modules actifs** (factures, scans, leads…).
- **Dictée & transcription partout** : chaque champ texte de l'app (note, tâche, description d'opportunité) a un bouton micro ; transcription **on-device** (Speech iOS/macOS, SpeechRecognizer Android, Windows Speech). Gratuit dans le cœur — c'est un pilier du « super facile » : après un appel, on dicte, on ne tape pas.
- **Import/Export** : CSV/vCard import, export complet (l'utilisateur reste propriétaire de ses données).
- **Multi-langue** : réutiliser l'infrastructure l10n d'e-Invoicing.
- **Verrouillage app** : réutiliser `app_lock_service`.

### Ce que le cœur ne fait PAS (réservé aux modules)

Facturation, scan de documents, stock, capture de leads salon/cartes, emails IA, base partagée multi-appareils.

## 3. Modules payants

| Module | Source (code existant) | Ce qu'il ajoute au CRM |
|---|---|---|
| **Facturation** | EastmarkHK e-Invoicing | Devis, factures, paiements, PDF, Peppol UBL 2.1, rapports CA — attachés à la fiche client |
| **Scanner** | EastmarkHK Scanner | Scan de documents → rattachés à la fiche client (contrats, bons de livraison) |
| **Stock** | EastmarkHK Stock / Inventory AI | Catalogue produits, disponibilité, historique d'achats par client |
| **Salons & Leads** | Trade Shows + Name Cards | Capture de leads en salon, scan de cartes de visite → contact + opportunité créés automatiquement |
| **Assistant IA** | Services IA d'e-Invoicing + IA native des plateformes | Emails rédigés par Claude (relance, suivi), résumé de fiche client, analyse d'un document scanné — voir §6 IA par plateforme |
| **Sync & Équipe** | `remote_data_sync_service` + API PHP | Base partagée entre appareils et utilisateurs, rôles, mode hors-ligne avec fusion |

Chaque module :

- s'active/désactive dans **Réglages → Modules** (la « boutique » intégrée) ;
- ajoute ses entrées de navigation, ses sections dans la fiche client, ses widgets au dashboard, ses tables en base ;
- désactivé, ses données restent en base (réactivation sans perte) ;
- a une **période d'essai de 7 jours** (modèle `_trialDays` du LicenseManager).

### Règle d'or : les modules sont fondus, pas juxtaposés

Un module ne doit **jamais** ressembler à une app collée dans le CRM. Concrètement :

- **Même design system** : thème, typographie, composants partagés (`core/widgets`) — aucun écran de module ne redéfinit son style.
- **Une seule timeline** : une facture, un scan, un lead salon apparaissent dans la timeline du client au même titre qu'une note — même visuel, même interaction.
- **Une seule recherche** : ⌘K trouve un contact, une facture, un document scanné indifféremment.
- **Navigation unifiée** : le module ajoute ses entrées dans le menu existant, jamais de « sous-app » avec sa propre navigation.
- **Données croisées natives** : depuis une opportunité gagnée → « Créer le devis » (module Facturation) pré-rempli ; depuis un scan de carte → contact créé et ouvert. Zéro copier-coller entre modules.
- **Un seul fichier de base** : les tables des modules vivent dans la même SQLite, mêmes conventions, mêmes migrations.

Les apps existantes (e-Invoicing, Scanner…) continuent leur vie en standalone, mais leur **code porté dans le CRM est réécrit à l'interface** pour respecter ces règles — on porte la logique métier (services, PDF, UBL, sync), pas les écrans tels quels.

## 4. Architecture technique

### Stack

- **Flutter — canal beta** (`flutter channel beta`) pour profiter des fonctions les plus récentes ; macOS, iOS, Android, Windows — Linux possible ; même setup qu'e-Invoicing (`flutter create . --org com.eastmarkhk`). Règle de prudence : développer sur beta, mais **valider chaque release store sur le canal stable** si un bug beta bloque (un simple `flutter channel stable && flutter upgrade` suffit pour comparer).
- **SQLite** : `sqflite` mobile, `sqflite_common_ffi` desktop → copier `AppDatabase.initPlatform()`.
- **Riverpod ou Provider** pour l'état (suivre ce que fait e-Invoicing pour rester cohérent).
- **fl_chart** pour les graphiques.
- Fichier DB : `eastmarkhk_crm.db` (nom historique déjà géré par la migration d'e-Invoicing — attention : e-Invoicing renomme ce fichier vers `eastmarkhk_einvoicing.db` ; le CRM devra utiliser un nom distinct, ex. `emhk_crm.db`, pour ne pas entrer en collision).

### Structure du projet

```
lib/
  main.dart / app.dart
  core/                     # le CRM gratuit
    models/  db/  screens/  widgets/  services/
  modules/                  # un dossier par module payant
    invoicing/
    scanner/
    stock/
    leads/
    ai/
    sync/
  platform/                 # licences, IAP, distribution
    license_manager.dart    # copié d'e-Invoicing, multi-produits
    subscription_service.dart
    distribution_config.dart
  l10n/  theme/  utils/
```

### Le contrat de module (clé de l'architecture)

```dart
abstract class CrmModule {
  String get id;                    // 'invoicing', 'scanner', ...
  String get title;
  IconData get icon;

  /// Migrations SQL propres au module (tables préfixées : inv_, scan_, ...)
  List<String> get migrations;

  /// Entrées de navigation ajoutées au menu principal
  List<NavDestination> navDestinations();

  /// Sections injectées dans la fiche client (ex : "Factures", "Documents")
  List<Widget> customerSections(String customerId);

  /// Widgets ajoutés au dashboard
  List<Widget> dashboardCards();

  /// Événements publiés sur la timeline du client
  Stream<TimelineEvent> timelineEvents(String customerId);
}

class ModuleRegistry {
  /// Modules compilés dans l'app (tous), filtrés par entitlement actif.
  List<CrmModule> get active =>
      _all.where((m) => EntitlementService.instance.isActive(m.id)).toList();
}
```

Tous les modules sont **compilés dans le binaire** (une seule app sur les stores) ; l'achat ne fait que déverrouiller. C'est le modèle standard IAP et c'est ce que permet déjà `SubscriptionService`.

### Base de données

Tables du cœur (préfixe aucun) :

```sql
CREATE TABLE companies   (id TEXT PRIMARY KEY, name TEXT NOT NULL, vat_number TEXT,
                          peppol_id TEXT, website TEXT, tags TEXT, notes TEXT,
                          country TEXT, address_json TEXT,
                          created_at TEXT, updated_at TEXT, deleted_at TEXT);
CREATE TABLE contacts    (id TEXT PRIMARY KEY, company_id TEXT REFERENCES companies(id),
                          first_name TEXT, last_name TEXT, email TEXT, phone TEXT,
                          role TEXT, notes TEXT,
                          created_at TEXT, updated_at TEXT, deleted_at TEXT);
CREATE TABLE pipelines   (id TEXT PRIMARY KEY, name TEXT, stages_json TEXT);
CREATE TABLE opportunities (id TEXT PRIMARY KEY, company_id TEXT, contact_id TEXT,
                          pipeline_id TEXT, stage TEXT, title TEXT,
                          amount REAL, currency TEXT, probability INTEGER,
                          expected_close TEXT, won_lost TEXT, closed_at TEXT,
                          created_at TEXT, updated_at TEXT, deleted_at TEXT);
CREATE TABLE activities  (id TEXT PRIMARY KEY, company_id TEXT, contact_id TEXT,
                          opportunity_id TEXT, type TEXT,   -- note|call|email|meeting|module_event
                          module_id TEXT,                    -- NULL = cœur
                          ref_table TEXT, ref_id TEXT,       -- lien vers l'objet module (facture, scan…)
                          title TEXT, body TEXT, happened_at TEXT,
                          created_at TEXT, updated_at TEXT, deleted_at TEXT);
CREATE TABLE tasks       (id TEXT PRIMARY KEY, company_id TEXT, contact_id TEXT,
                          title TEXT, due_date TEXT, done_at TEXT, notes TEXT,
                          created_at TEXT, updated_at TEXT, deleted_at TEXT);
CREATE TABLE settings    (key TEXT PRIMARY KEY, value TEXT);
CREATE TABLE entitlements(module_id TEXT PRIMARY KEY, source TEXT,  -- iap|license|trial
                          expires_at TEXT, payload TEXT);
```

Conventions (héritées d'e-Invoicing et indispensables pour la sync) :

- IDs = **UUID** (jamais d'auto-increment : fusion multi-appareils impossible sinon).
- `updated_at` ISO-8601 UTC sur toutes les tables + **soft delete** (`deleted_at` / tombstones, modèle `received_invoice_tombstones`).
- Tables de modules préfixées : `inv_quotes`, `inv_invoices`, `scan_documents`, `stk_products`, `lead_captures`… Le module Facturation reprend le schéma d'e-Invoicing quasi tel quel (customers → mappé sur companies/contacts).

## 5. Monétisation

### Deux canaux, déjà en production chez vous

| Canal | Plateformes | Mécanisme |
|---|---|---|
| **In-App Purchase** | iOS, macOS App Store | `SubscriptionService` (in_app_purchase), un product ID par module : `crm_invoicing_monthly`, `crm_sync_monthly`… |
| **Licence signée offline** | Windows MSIX, DMG hors store, APK | `LicenseManager` : token = base64(payload) + HMAC-SHA256, lié au Machine ID, signé par eastmarkhk.com, vérification 100 % offline. Achat via `product_view.php` + page `activation-machine-id.php` (généraliser celle du Scanner) |

### Modèle de prix (proposition)

- Cœur CRM : **gratuit, sans limite de contacts** (c'est l'aimant ; la limite de contacts est le piège classique qui fait fuir).
- Modules : **abonnement mensuel par module** (cohérent avec e-Invoicing 5,99 €/mois), ex. 3,99–5,99 €/module/mois, ou **licence perpétuelle** hors store (cohérent avec le modèle Scanner/HSCode).
- **Bundle « Tout »** à prix réduit (ex. 14,99 €/mois) — souvent 40 % des revenus dans ce modèle.
- Le module **Sync & Équipe** peut être tarifé par siège si multi-utilisateurs.

### Écran « Modules » dans l'app

Grille de cartes : icône, description, prix localisé (`ProductDetails`), bouton Essayer 7 jours / Acheter / Restaurer. État par module : Actif · Essai (J-x) · Expiré · Disponible. C'est la vitrine — soignée mais jamais intrusive : **zéro popup d'upsell dans le cœur**, une seule mention discrète dans les réglages.

## 6. IA native par plateforme (priorité on-device)

Stratégie : **utiliser au maximum l'IA embarquée de chaque OS** — gratuite, hors-ligne, privée (les données ne quittent pas l'appareil) — et ne recourir au cloud (Claude, Mistral, déjà intégrés dans e-Invoicing) que pour ce que l'IA locale ne sait pas faire. C'est aussi un argument marketing fort : « IA locale, vos données restent chez vous ».

### Capacités par plateforme

| Capacité | iOS / macOS | Android | Windows |
|---|---|---|---|
| **OCR** | Vision (`VNRecognizeTextRequest`) — excellent, multilingue | ML Kit Text Recognition v2 | Windows.Media.Ocr / Windows AI (Phi Silica sur Copilot+ PC) |
| **Scan de documents** | VisionKit `DataScanner` / doc camera | ML Kit Document Scanner | caméra + OCR |
| **Cartes de visite → contact** | Vision + `NSDataDetector` (email, tél., URL) | ML Kit Entity Extraction | OCR + regex/NSDataDetector maison |
| **Résumé, réécriture, ton** | Apple Intelligence / Writing Tools + Foundation Models (`apple_intelligence_service` existant) | Gemini Nano (AICore, appareils récents) | Phi Silica (Copilot+ PC) |
| **Transcription vocale** | Speech (`SFSpeechRecognizer`, on-device) | SpeechRecognizer on-device | Windows Speech |
| **Traduction** | Translation framework (on-device) | ML Kit Translate | — (fallback cloud) |
| **Classification d'images** | Vision / Core ML | ML Kit Image Labeling | ONNX Runtime / Windows AI |

Implémentation : un service Dart unique par capacité (`OcrService`, `SummarizeService`, `SpeechService`…) avec implémentations par plateforme via platform channels, et **fallback cloud automatique** si l'appareil ne supporte pas la fonction (vieil Android sans AICore, PC non-Copilot+). L'utilisateur voit une seule fonction ; l'app choisit le meilleur moteur disponible.

### Fonctions IA à imaginer dans le CRM

- **Carte de visite → fiche complète** : photo → OCR on-device → contact + société + opportunité pré-remplis (module Salons & Leads).
- **Document scanné → données structurées** : contrat/facture/bon de livraison → OCR local → extraction des champs (montant, dates, références) → rattaché à la fiche client (modules Scanner/Facturation ; `ai_invoice_parse_service` existe déjà pour la partie cloud).
- **Note vocale → tâche** : dicter après un appel ; transcription locale → note sur la timeline + tâches de relance détectées.
- **Résumé de fiche client** : « résume ma relation avec ce client » — timeline condensée avant un rendez-vous, on-device quand possible.
- **Emails intelligents** : rédaction locale (Writing Tools / Gemini Nano) pour le courant, Claude pour le complexe (relance multi-factures, négociation) — code déjà écrit.
- **Détection de doublons** : fuzzy matching contacts/sociétés à l'import, suggestion de fusion.
- **Suggestions de relance** : « ce client n'a plus d'activité depuis 60 jours et a un devis ouvert » — règles locales d'abord, scoring IA ensuite.
- **Traduction instantanée** des notes/emails clients étrangers, on-device.

Répartition gratuit/payant : l'OCR et la dictée de base peuvent enrichir le cœur gratuit (ils tournent sur l'appareil, coût nul) ; l'extraction structurée, les résumés, les emails IA et les suggestions font partie du module **Assistant IA**.

## 7. Mode standalone vs base partagée

### Standalone (défaut)

SQLite local, aucune configuration, aucune connexion. Identique à e-Invoicing.

### Base partagée (module Sync & Équipe)

Volontairement simple : **un seul mécanisme, tout en HTTPS — pas de FTP**. Réutilise l'architecture déjà écrite dans e-Invoicing pour la partie sync par lignes (`row_sync_service` / `remote_data_sync_service`), mais sans le repli FTP historique.

1. **Sync par lignes** vers une **API PHP** sur votre hébergement (modèle `remote_einvoicing_api`) : push après chaque écriture locale (`schedulePushAfterLocalChange`), pull au démarrage et périodique, résolution de conflits **last-write-wins** sur `updated_at`, tombstones pour les suppressions.
2. **Médias (photos, logos, documents)** : upload/download HTTPS vers la même API — un endpoint `/api/media/upload` et `/api/media/<id>`, jamais de FTP. Simple, un seul protocole à sécuriser et déboguer.

Côté serveur : **`crm.eastmarkhk.com`** (sous-domaine créé, compte `crm@eastmarkhk.com`, racine `/crm.eastmarkhk.com/public_html/`), PHP comme adm.eastmarkhk.com. Rôles du serveur :

- **API de sync** : endpoints REST par table (`/api/sync/pull?since=…`, `/api/sync/push`), authentification par compte + clé d'appareil, TLS, mot de passe de sync (`emhk_sync_password` existe déjà).
- **Médias** : photos produits, logos, documents scannés, pièces jointes — mêmes endpoints HTTPS que ci-dessus.
- **Base : SQLite partout** — côté serveur aussi : **un fichier SQLite par compte** (`/data/accounts/<account_id>/crm.db`, hors de public_html), accédé par l'API PHP via PDO SQLite en mode WAL. Même schéma, mêmes UUID, mêmes tombstones que le client → la sync est un simple échange de lignes entre deux bases identiques, et la sauvegarde un simple fichier à copier. La concurrence d'écriture par compte est faible (un utilisateur ou une petite équipe) : WAL suffit largement. **MySQL n'est qu'une éventuelle migration future** pour un compte qui deviendrait une grosse équipe très active — schéma identique, migration mécanique.

⚠️ **Identifiants jamais dans le code ni dans ce document** : le mot de passe du compte serveur vit uniquement dans le trousseau de l'appareil (modèle `smtp_credentials_service`) et dans la config serveur. Le mot de passe de test communiqué devra être changé avant toute mise en production.

### Utilisateurs & rôles (fondations posées dès le cœur)

Table `users` **locale dès maintenant** (pas seulement côté serveur) : login, mot de passe (haché + salé, jamais en clair), rôle. Deux rôles au départ :

- **Administrator** : accès complet, y compris la gestion des utilisateurs et la vue/modification des mots de passe.
- **User** : accès aux données métier (clients, pipeline, tâches…) sans jamais voir ni modifier les mots de passe des comptes — la section Utilisateurs des Réglages leur est fermée.

Chaque compte peut activer un **déverrouillage rapide par Touch ID** sur l'appareil (jeton local sécurisé, stocké dans le trousseau) — pratique tant que le vrai passkey **WebAuthn/FIDO2** (porté par les endpoints déjà en place sur eastmarkhk.com, `webauthn_register_options.php` etc.) n'est branché sur crm.eastmarkhk.com qu'avec le module Sync & Équipe : c'est là que la connexion multi-appareils avec passkey portable prendra tout son sens. En local, le Touch ID est un confort par appareil, pas un vrai passkey portable.

## 8. Intégration avec l'écosystème existant

- **e-Invoicing** : le module Facturation et l'app e-Invoicing peuvent pointer sur la même base partagée (les schémas sont cousins). Un client créé dans le CRM apparaît dans e-Invoicing et inversement.
- **adm.eastmarkhk.com / adm.jwtradinghk.com** : import initial des clients existants (script d'export CSV ou endpoint `list_customers.php` déjà présent) ; à terme, sync bidirectionnelle via la même API.
- **eastmarkhk.com (boutique)** : les commandes web peuvent créer des leads dans la base partagée (webhook → API sync).
- **Trade Shows / Name Cards / Scanner** : leurs exports deviennent des imports CRM (fichier ou API), avant intégration native en module.

## 9. UX — « super facile mais complet »

- **Navigation adaptative** : rail latéral desktop / barre d'onglets mobile — 4 entrées de base : Tableau de bord · Clients · Pipeline · Tâches. Les modules ajoutent leurs entrées (jamais plus de 7 visibles ; au-delà : « Plus »).
- **La fiche client est le centre de gravité** : tout part d'elle et tout y revient. En-tête (société, contacts, tags), timeline, panneaux latéraux par module.
- **Zéro configuration au premier lancement** : l'app s'ouvre sur un dashboard vide avec 3 actions (Ajouter un client · Importer CSV · Explorer les modules).
- **Desktop** : fenêtre grande par défaut + mémorisation taille/position (`window_service` existant), raccourcis clavier (⌘N nouveau client, ⌘K recherche, ⌘D dictée).
- **La voix comme premier moyen de saisie** : bouton micro visible sur chaque champ, dictée globale depuis la fiche client (« ajouter une note vocale ») — transcription on-device, voir §2 et §6.
- **Graphiques** : sobres, tap → drill-down vers la liste filtrée correspondante.

## 10. Plan par phases

| Phase | Contenu | Livrable |
|---|---|---|
| **1. Fondations** (3-4 sem.) | Projet Flutter, AppDatabase (copie adaptée), modèles cœur, CRUD contacts/sociétés, recherche, l10n, thème | App utilisable : carnet clients multi-plateforme |
| **2. CRM cœur** (3-4 sem.) | Pipeline kanban, opportunités, timeline, tâches/relances, dashboard fl_chart, import/export CSV | Le CRM gratuit complet — publiable en v1.0 |
| **3. Infrastructure modules** (2 sem.) | CrmModule/ModuleRegistry, entitlements, écran Modules, LicenseManager multi-produits, IAP | Boutique fonctionnelle avec essais 7 jours |
| **4. Module Facturation** (3 sem.) | Portage e-Invoicing en module (plus gros morceau, mais code existant) | Premier module payant — v1.1 |
| **5. Module Sync** (3-4 sem.) | API PHP+MySQL, row sync, comptes | Base partagée multi-appareils — v1.2 |
| **6. Modules suivants** | IA (code cloud existant + services on-device : `OcrService`, `SpeechService`…) → Salons & Leads (carte de visite → contact) → Scanner → Stock | Un module par release |

Ordre des modules choisi par rapport revenu/effort : Facturation (code prêt, forte valeur) → Sync (le plus vendeur) → IA (quasi gratuit à porter) → le reste.

## 11. Risques & points d'attention

- **Règles App Store** : le cœur gratuit doit être réellement utile sans achat (c'est le cas) ; les achats doivent passer par IAP sur iOS/macOS App Store — jamais de lien vers eastmarkhk.com pour payer dans les builds store (motif de rejet classique).
- **Collision de bases** : nom de fichier SQLite distinct d'e-Invoicing (`emhk_crm.db`).
- **Sync et conflits** : last-write-wins suffit pour démarrer ; documenter la règle pour l'utilisateur. Les tombstones sont indispensables dès le schéma v1 (les ajouter après coup est pénible).
- **Portée v1** : résister à l'envie de tout mettre dans le cœur. Le cœur doit rester simple ; la richesse vient des modules.
- **RGPD** : export complet + suppression définitive (déjà un `factory_reset_service` chez vous) ; mention dans la politique de confidentialité par module (le modèle e-Invoicing Privacy Report est réutilisable).

---

*Spécification v1.0 — 30 juillet 2026. Basée sur l'analyse du code existant : EastmarkHK e-Invoicing (Flutter/SQLite/sync/licences/IAP), adm.eastmarkhk.com (PHP/MySQL/API), eastmarkhk.com (catalogue produits + activation).*

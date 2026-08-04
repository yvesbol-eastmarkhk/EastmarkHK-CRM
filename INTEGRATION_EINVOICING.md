# Intégration CRM ↔ EastmarkHK e-Invoicing

## Principe

e-Invoicing est la **source de vérité facturation**. Le CRM ne duplique aucune donnée : il écrit devis/factures directement dans la base de l'app e-Invoicing et lit les statuts pour les afficher. L'achat du module dans le CRM donne aussi l'app standalone (App Store). Chaque app garde ses propres données ; elles se parlent via un conteneur partagé.

- **Dans le CRM** : création devis **et** factures (UX CRM), affichage des statuts sur la fiche client, le dashboard et l'écran module, événement timeline à chaque création (comme une tâche ou une opportunité).
- **Standalone uniquement** : reçues, relances, envoi (Peppol/PDF/email), paiements, produits. Bouton « Ouvrir e-Invoicing » partout dans le module CRM.

## Mécanique

- **App Group macOS** `group.com.eastmarkhk.shared` (entitlements des deux apps, Debug + Release).
- La base SQLite d'e-Invoicing (`eastmarkhk_einvoicing.db`) vit désormais dans `<conteneur groupe>/einvoicing/`. Migration automatique depuis Application Support au premier lancement (rename, repli copy).
- Chemin du conteneur exposé par le channel Swift `eastmarkhk/shared_container` (`SharedContainerHandler.swift` dans les deux Runners). Le CRM y ajoute `openEInvoicing` / `isEInvoicingInstalled` (NSWorkspace).
- **CRM → `EInvoiceConnector`** (`lib/modules/invoicing/einvoice_connector.dart`) : ouverture de la base **par opération** (`singleInstance: false`, `busy_timeout 5000`) pour cohabiter avec l'app e-Invoicing ouverte. UUID v4 identiques au format e-Invoicing (compatibles avec sa sync ligne à ligne). Numérotation identique : `D2026-0001` / `F2026-0001`.

## Registre clients

Mappage **unidirectionnel CRM → e-Invoicing** via `customers.crm_company_id` (migration v18 côté e-Invoicing ; le connecteur pose la colonne lui-même si le CRM tourne avant la mise à jour). `ensureCustomer` : crm_company_id → n° TVA → nom → création depuis la fiche CRM (adresse JSON → colonnes). Les customers e-Invoicing sans `crm_company_id` restent propres au standalone — tous les clients e-Invoicing ne sont pas des clients CRM, l'inverse oui (à la première utilisation).

## Fichiers touchés

CRM : `einvoice_connector.dart` (nouveau), `invoicing_module.dart`, `screens/invoicing_home_screen.dart`, `screens/quote_editor_screen.dart` (`EiDocumentEditorScreen`, devis/facture), `widgets/company_invoicing_section.dart`, `widgets/invoicing_dashboard_card.dart`, `macos/Runner/SharedContainerHandler.swift`, entitlements, pbxproj. **Supprimés** : `invoicing_repository.dart`, `models/invoicing_models.dart` (tables `inv_*` abandonnées ; d'anciennes tables peuvent rester dans la base CRM, inoffensives).

e-Invoicing : `macos/Runner/SharedContainerHandler.swift` (nouveau), `MainFlutterWindow.swift`, `lib/db/app_database.dart` (dossier groupe + migration + v18), entitlements, pbxproj.

## Deux transports selon le mode d'e-Invoicing

e-Invoicing peut tourner en **Local** (base SQLite propre à l'appareil) ou en **Remote** (lecture/écriture exclusivement via son API PHP — sa base locale n'est alors ni tenue à jour ni utilisée). Le CRM détecte le mode actif (`EinvoicingLicenseBridge.isRemoteModeActive()`, lecture de `data_storage_mode` dans le plist SharedPreferences d'e-Invoicing) et route en conséquence via `EInvoiceConnector.resolveMode()` :

- **Local** → écriture/lecture directes dans la base SQLite du conteneur App Group, comme décrit plus haut (mappage `customers.crm_company_id`).
- **Remote** → `EInvoiceRemoteApi` (`lib/modules/invoicing/einvoice_remote_api.dart`) appelle la même API PHP qu'e-Invoicing (`/einvoicing/customers`, `/quotes`, `/invoices`, auth `Authorization: Bearer <mot de passe>` + `X-Emhk-Ftp-User`). Identifiants saisis une fois côté CRM (`EinvoiceRemoteConfig` — URL + login en SharedPreferences, mot de passe en Keychain **propre au CRM**, car le Keychain n'est pas partagé entre les deux apps même avec l'App Group). Dialogue de saisie : `screens/einvoice_remote_settings_dialog.dart`, accessible via l'icône ⚙️ de l'écran module (mode remote actif) ou le bouton « Configurer » (écrans d'invite).
  - Pas de mappage persistant client CRM ↔ serveur distant (le schéma serveur n'a pas de colonne `crm_company_id`) : correspondance TVA puis nom à chaque appel (`EInvoiceRemoteApi.findCustomerUuid`/`ensureCustomerUuid`), comme le repli du mode local.
  - `EiMode.unavailable` + `needsRemoteSetup() == true` : remote actif mais identifiants CRM pas encore saisis — écrans d'invite dédiés avec bouton de configuration + test de connexion.

## Limites connues / à suivre

- Intégration **macOS uniquement** pour l'instant (choix : macOS d'abord). iOS : App Group `group.…` possible plus tard.
- Le « CA ouvert » du dashboard CRM somme les totaux TTC des factures non payées/annulées, sans déduire les acomptes (table `payments` non lue) — approximation volontaire v1.
- Mode remote : la numérotation finale (D2026-xxxx/F2026-xxxx) est attribuée par le serveur PHP (le CRM envoie `number: ''`), donc peut différer légèrement du format local en cas de règles serveur particulières.
- Mode remote : `EInvoiceRemoteApi` ne gère que l'auth « moderne » (mot de passe, serveur e-Invoicing ≥ 1.4) — pas le fallback token legacy des très anciens serveurs.
- Les documents créés par le CRM apparaissent dans e-Invoicing après son propre refresh d'écran.
- **Important — Debug vs Release/notarisé** : un build Debug (`flutter run`) tourne sans sandbox et lit/écrit ses préférences et sa base dans un emplacement disque différent de l'app notarisée (sandboxée). Les deux sont des installations séparées du même bundle ID — ne pas utiliser un build Debug pour vérifier les vraies données de production.
- Reconstruire **les deux apps** dans Xcode (nouveaux fichiers Swift + entitlements) avant test.

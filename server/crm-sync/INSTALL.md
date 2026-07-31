# Déploiement du serveur de sync CRM

Backend minimal (PHP + SQLite) qui permet à plusieurs installations du CRM
de partager leurs données. Indépendant du serveur d'EastmarkHK e-Invoicing.

## 1. Prérequis côté hébergement

- PHP 7.4+ avec l'extension `pdo_sqlite` activée (présente par défaut sur
  la plupart des hébergements mutualisés — à vérifier dans le panneau
  d'hébergement si besoin).
- Un dossier accessible en écriture pour `data/` (créé automatiquement au
  premier appel si absent).

## 2. Configurer le mot de passe

```
php -r "echo hash('sha256', 'VOTRE_MOT_DE_PASSE'), \"\n\";"
```

Collez le résultat dans `config.php` (`password_sha256`). Gardez `account`
identique à ce que vous mettrez dans le CRM (Réglages → Synchronisation →
Compte).

## 3. Déployer

Copiez tout le dossier `crm-sync/` (avec `config.php`, `db.php`, `sync.php`,
`.htaccess`, `data/.htaccess`) à la **racine du compte FTP**
`crm@eastmarkhk.com` (équivalent de `/home/customer/www/crm.eastmarkhk.com/public_html/`
sur SiteGround). Ne pas déposer dans le sous-dossier
`crm.eastmarkhk.com/public_html/` visible dans le gestionnaire de fichiers —
ce chemin n'est pas servi par le web. Vérifiez que
`https://crm.eastmarkhk.com/sync.php` répond.

Ou lancez `./deploy-ftp.sh` (voir le script) avec `CRM_FTP_USER` et
`CRM_FTP_PASS`.

Si votre hébergement le permet, déplacez `data/` en dehors du `public_html`
et ajustez `db_path` dans `config.php` en conséquence — c'est plus sûr que
de compter uniquement sur `.htaccess`.

## 4. Vérifier

```
curl -i -X POST https://crm.eastmarkhk.com/sync.php \
  -H "Content-Type: application/json" \
  -d '{"auth":{"account":"crm@eastmarkhk.com","password":"VOTRE_MOT_DE_PASSE"},"since":"1970-01-01T00:00:00.000Z","push":{}}'
```

Une réponse `{"ok":true,...}` confirme que tout fonctionne. `401` = mauvais
compte/mot de passe, `500` = problème d'écriture ou d'extension SQLite.

## 5. Activer dans le CRM

Réglages → Synchronisation → "Base partagée (remote)", renseignez le même
serveur/compte/mot de passe sur chaque appareil, puis "Synchroniser
maintenant" (aussi lancé automatiquement toutes les 2 minutes).

## Limites actuelles (volontaires, à faire évoluer plus tard)

- Aligné e-Invoicing : **pull-first**, poll **25 s** (pull seul), **push immédiat**
  après chaque modification locale, pas de pull pendant une saisie.
- Les comptes utilisateurs (mots de passe, rôles) restent locaux à chaque
  appareil — seules les données métier (clients, contacts, opportunités,
  activités, tâches) sont synchronisées.
- Résolution de conflit "dernier écrit gagne" (par `updated_at`) — pas de
  fusion champ par champ. Suffisant tant que l'équipe est petite et que les
  mêmes fiches ne sont pas modifiées simultanément sur deux appareils.
- Pas encore d'API dédiée pour un vrai passkey WebAuthn portable — Touch ID
  reste local à chaque appareil (voir `device_passkey_service.dart`).

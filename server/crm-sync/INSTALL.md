# Déploiement du serveur de sync CRM

Backend minimal (PHP + SQLite) qui permet à plusieurs installations du CRM
de partager leurs données. **Transport et auth = HTTPS uniquement** (pas de FTP).

## 1. Prérequis côté hébergement

- PHP 7.4+ avec l'extension `pdo_sqlite` activée.
- Un dossier accessible en écriture pour `data/` (créé automatiquement au
  premier appel si absent).

## 2. Identifiants (HTTPS)

Dans le CRM, utilisez le **compte API** (`emhk@eastmarkhk.com`) et son
**mot de passe**. Le serveur vérifie le mot de passe via `password_sha256`
dans `config.php` (hash SHA-256) — aucun appel FTP.

```
php -r "echo hash('sha256', 'VOTRE_MOT_DE_PASSE'), \"\n\";"
```

Collez le hash dans `config.php` → `password_sha256`.

## 3. Déployer

Copiez tout le dossier `crm-sync/` (avec `config.php`, `db.php`, `sync.php`,
`.htaccess`, `data/.htaccess`) dans le sous-dossier **`crm/`** de
`emhk.eastmarkhk.com` (racine web = `public_html/`).
Vérifiez que `https://emhk.eastmarkhk.com/crm/sync.php` répond.

Ou lancez `./deploy-ftp.sh` (upload des fichiers PHP uniquement — le
protocole de sync reste HTTPS) avec `CRM_FTP_USER` et `CRM_FTP_PASS`
pour le déploiement.

Si votre hébergement le permet, déplacez `data/` en dehors du `public_html`
et ajustez `db_path` dans `config.php`.

## 4. Vérifier

```
curl -i -X POST https://emhk.eastmarkhk.com/crm/sync.php \
  -H "Content-Type: application/json" \
  -d '{"auth":{"account":"emhk@eastmarkhk.com","password":"VOTRE_MOT_DE_PASSE"},"since":"1970-01-01T00:00:00.000Z","push":{}}'
```

Une réponse `{"ok":true,...}` confirme que tout fonctionne. `401` = mauvais
compte/mot de passe, `500` = problème d'écriture ou d'extension SQLite.

## 5. Activer dans le CRM

Réglages → Synchronisation → "Base partagée (remote)", renseignez le même
serveur/compte/mot de passe sur chaque appareil, puis "Synchroniser
maintenant".

## Limites actuelles

- Aligné e-Invoicing : **pull-first**, poll **25 s** (pull seul), **push**
  après chaque modification locale, pas de pull pendant une saisie.
- Les comptes utilisateurs restent locaux — seules les données métier
  (clients, contacts, opportunités, activités, tâches) sont synchronisées.
- Conflits : dernier écrit gagne (`updated_at`).

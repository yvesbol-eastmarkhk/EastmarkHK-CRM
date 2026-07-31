<?php
/**
 * Identifiants et emplacements du serveur de synchronisation CRM.
 *
 * À FAIRE avant mise en ligne :
 * 1. Choisissez un mot de passe fort pour le compte de sync et calculez
 *    son hash SHA-256 en ligne de commande :
 *
 *      php -r "echo hash('sha256', 'VOTRE_MOT_DE_PASSE'), \"\n\";"
 *
 *    Collez le résultat ci-dessous dans 'password_sha256'.
 * 2. Réutilisez le même compte/mot de passe dans le CRM
 *    (Réglages → Synchronisation) sur chaque appareil.
 * 3. Ne commitez jamais ce fichier avec un vrai mot de passe dans un dépôt
 *    public — il ne contient qu'un hash, mais autant rester prudent.
 */

return [
    // Doit correspondre au champ "Compte" saisi dans Réglages → Synchronisation.
    'account' => 'crm@eastmarkhk.com',

    // Hash SHA-256 du mot de passe de sync — JAMAIS le mot de passe en clair.
    // Valeur par défaut = hash de "changeme" : à remplacer immédiatement.
    'password_sha256' => '41df679787630f5bc42f3c20b53897513f3aefa9300f228b8c77279d28ea68a5',

    // Base SQLite du serveur — placée dans data/, en dehors du webroot si
    // possible. Le fichier data/.htaccess fourni bloque l'accès direct sous
    // Apache ; sur un autre serveur web, déplacez ce dossier hors de
    // public_html et ajustez ce chemin en conséquence.
    'db_path' => __DIR__ . '/data/crm_sync.sqlite',
];

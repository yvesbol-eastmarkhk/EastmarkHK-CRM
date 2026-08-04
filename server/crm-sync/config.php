<?php
/**
 * Identifiants et emplacements du serveur de synchronisation CRM.
 *
 * Auth 100 % HTTPS (pas de FTP) :
 * - Compte = login API (ex. emhk@eastmarkhk.com)
 * - Mot de passe = vérifié via password_sha256 dans ce fichier
 *
 *      php -r "echo hash('sha256', 'VOTRE_MOT_DE_PASSE'), \"\n\";"
 */

return [
    // Login API — même valeur que « Compte » dans Réglages CRM.
    // Domaine unifié : https://emhk.eastmarkhk.com/crm/
    'account' => 'emhk@eastmarkhk.com',

    // Hash SHA-256 du mot de passe API (obligatoire — auth HTTPS uniquement).
    'password_sha256' => '39a1f6d1d9000f966f2781ec1caff18475865f3087e40915b0a2854d51490dcd',

    // Base SQLite du serveur.
    'db_path' => __DIR__ . '/data/crm_sync.sqlite',
];

<?php
/**
 * Base SQLite du serveur de sync — mêmes tables et colonnes que la base
 * locale du CRM (lib/core/db/app_database.dart), pour permettre un push/
 * pull générique sans traduction de schéma. Les comptes utilisateurs
 * (mots de passe, rôles) ne sont volontairement PAS répliqués ici : seules
 * les données métier (clients, contacts, opportunités, activités, tâches)
 * transitent par ce serveur. Les profils utilisateurs (sans mot de passe)
 * sont synchronisés via user_profiles pour résoudre assigned_to entre appareils.
 */

declare(strict_types=1);

function crm_sync_db(array $config): PDO
{
    $dir = dirname($config['db_path']);
    if (!is_dir($dir)) {
        mkdir($dir, 0770, true);
    }

    $pdo = new PDO('sqlite:' . $config['db_path']);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $pdo->exec('PRAGMA journal_mode = WAL');
    $pdo->exec('PRAGMA foreign_keys = OFF');

    $pdo->exec("CREATE TABLE IF NOT EXISTS companies (
        id TEXT PRIMARY KEY,
        name TEXT,
        vat_number TEXT,
        peppol_id TEXT,
        website TEXT,
        tags TEXT,
        notes TEXT,
        country TEXT,
        address_json TEXT,
        created_at TEXT,
        updated_at TEXT,
        deleted_at TEXT
    )");

    $pdo->exec("CREATE TABLE IF NOT EXISTS contacts (
        id TEXT PRIMARY KEY,
        company_id TEXT,
        first_name TEXT,
        last_name TEXT,
        email TEXT,
        phone TEXT,
        phone_country TEXT,
        role TEXT,
        notes TEXT,
        messaging_json TEXT,
        created_at TEXT,
        updated_at TEXT,
        deleted_at TEXT
    )");

    $pdo->exec("CREATE TABLE IF NOT EXISTS opportunities (
        id TEXT PRIMARY KEY,
        company_id TEXT,
        contact_id TEXT,
        pipeline_id TEXT,
        stage TEXT,
        title TEXT,
        amount REAL,
        currency TEXT,
        probability INTEGER,
        expected_close TEXT,
        won_lost TEXT,
        closed_at TEXT,
        notes TEXT,
        created_at TEXT,
        updated_at TEXT,
        stage_updated_at TEXT,
        deleted_at TEXT
    )");

    $pdo->exec("CREATE TABLE IF NOT EXISTS activities (
        id TEXT PRIMARY KEY,
        company_id TEXT,
        contact_id TEXT,
        opportunity_id TEXT,
        type TEXT,
        module_id TEXT,
        ref_table TEXT,
        ref_id TEXT,
        title TEXT,
        body TEXT,
        happened_at TEXT,
        created_at TEXT,
        updated_at TEXT,
        deleted_at TEXT
    )");

    $pdo->exec("CREATE TABLE IF NOT EXISTS tasks (
        id TEXT PRIMARY KEY,
        company_id TEXT,
        contact_id TEXT,
        opportunity_id TEXT,
        title TEXT,
        due_date TEXT,
        done_at TEXT,
        notes TEXT,
        assigned_to TEXT,
        created_at TEXT,
        updated_at TEXT,
        deleted_at TEXT
    )");

    $pdo->exec("CREATE TABLE IF NOT EXISTS user_profiles (
        id TEXT PRIMARY KEY,
        username TEXT NOT NULL,
        display_name TEXT NOT NULL,
        role TEXT NOT NULL DEFAULT 'user',
        created_at TEXT NOT NULL,
        updated_at TEXT NOT NULL,
        deleted_at TEXT
    )");

    $pdo->exec('CREATE INDEX IF NOT EXISTS idx_companies_updated ON companies(updated_at)');
    $pdo->exec('CREATE INDEX IF NOT EXISTS idx_contacts_updated ON contacts(updated_at)');
    $pdo->exec('CREATE INDEX IF NOT EXISTS idx_opportunities_updated ON opportunities(updated_at)');
    $pdo->exec('CREATE INDEX IF NOT EXISTS idx_activities_updated ON activities(updated_at)');
    $pdo->exec('CREATE INDEX IF NOT EXISTS idx_tasks_updated ON tasks(updated_at)');
    $pdo->exec('CREATE INDEX IF NOT EXISTS idx_user_profiles_updated ON user_profiles(updated_at)');

    return $pdo;
}

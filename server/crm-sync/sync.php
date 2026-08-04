<?php
/**
 * Point d'entrée unique de la synchronisation CRM.
 *
 * Requête POST, corps JSON :
 *   {
 *     "auth": {"account": "...", "password": "..."},
 *     "since": "2026-07-01T00:00:00.000Z",
 *     "push": {"companies": [...], "contacts": [...], ...}
 *   }
 *
 * Réponse JSON :
 *   {"ok": true, "server_time": "...", "pull": {"companies": [...], ...}}
 *
 * Ordre serveur (aligné e-Invoicing pull-first) : le pull est calculé AVANT
 * d'appliquer le push, pour que le client reçoive l'état distant tel qu'il
 * était avant sa propre poussée — le push ne peut pas masquer des changements
 * distants plus récents dans la même réponse.
 *
 * Principe : dernier écrit gagne, comparé par updated_at (ISO-8601 UTC).
 */

declare(strict_types=1);

header('Content-Type: application/json; charset=utf-8');

require __DIR__ . '/db.php';

const TABLES = [
    'companies' => ['id', 'name', 'vat_number', 'peppol_id', 'website', 'tags', 'notes',
        'country', 'address_json', 'created_at', 'updated_at', 'deleted_at'],
    'contacts' => ['id', 'company_id', 'first_name', 'last_name', 'email', 'phone',
        'phone_country', 'role', 'notes', 'messaging_json', 'created_at', 'updated_at', 'deleted_at'],
    'opportunities' => ['id', 'company_id', 'contact_id', 'pipeline_id', 'stage', 'title',
        'amount', 'currency', 'probability', 'expected_close', 'won_lost', 'closed_at', 'notes',
        'created_at', 'updated_at', 'stage_updated_at', 'deleted_at'],
    'activities' => ['id', 'company_id', 'contact_id', 'opportunity_id', 'type', 'module_id',
        'ref_table', 'ref_id', 'title', 'body', 'happened_at', 'created_at', 'updated_at', 'deleted_at'],
    'tasks' => ['id', 'company_id', 'contact_id', 'opportunity_id', 'title', 'due_date',
        'done_at', 'notes', 'assigned_to', 'created_at', 'updated_at', 'deleted_at'],
    'user_profiles' => ['id', 'username', 'display_name', 'role', 'created_at', 'updated_at', 'deleted_at'],
];

const PULL_LIMIT = 5000;

function fail(string $message, int $code = 400): void
{
    http_response_code($code);
    echo json_encode(['ok' => false, 'message' => $message]);
    exit;
}

/**
 * Auth HTTPS uniquement : compte + hash SHA-256 du mot de passe
 * (config.php). Aucun appel FTP — le transport est déjà HTTPS (sync.php).
 */
function crm_auth_ok(array $config, string $account, string $password): bool
{
    if ($account === '' || $password === '') {
        return false;
    }
    $expectedAccount = (string) ($config['account'] ?? '');
    if ($expectedAccount !== '' && !hash_equals($expectedAccount, $account)) {
        return false;
    }

    $storedHash = (string) ($config['password_sha256'] ?? '');
    if ($storedHash === '') {
        return false;
    }
    return hash_equals($storedHash, hash('sha256', $password));
}

function fetch_pull(PDO $pdo, string $since): array
{
    $pull = [];
    foreach (TABLES as $table => $columns) {
        $stmt = $pdo->prepare("SELECT * FROM `$table` WHERE updated_at > ? ORDER BY updated_at ASC LIMIT " . PULL_LIMIT);
        $stmt->execute([$since]);
        $pull[$table] = $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    return $pull;
}

if (($_SERVER['REQUEST_METHOD'] ?? '') !== 'POST') {
    fail('Méthode non autorisée', 405);
}

$config = require __DIR__ . '/config.php';

$raw = file_get_contents('php://input');
$body = json_decode((string) $raw, true);
if (!is_array($body)) {
    fail('JSON invalide');
}

$auth = $body['auth'] ?? null;
$providedAccount = is_array($auth) ? (string) ($auth['account'] ?? '') : '';
$providedPassword = is_array($auth) ? (string) ($auth['password'] ?? '') : '';
if (!crm_auth_ok($config, $providedAccount, $providedPassword)) {
    fail(
        'Identifiants invalides — compte ou mot de passe incorrect (HTTPS)',
        401
    );
}

try {
    $pdo = crm_sync_db($config);
} catch (Throwable $e) {
    fail('Erreur base de données : ' . $e->getMessage(), 500);
}

$since = (string) ($body['since'] ?? '1970-01-01T00:00:00.000Z');
$push = is_array($body['push'] ?? null) ? $body['push'] : [];

// Pull-first : snapshot distant avant d'appliquer le push entrant.
$pull = fetch_pull($pdo, $since);

$serverTime = gmdate('Y-m-d\TH:i:s.v\Z');

try {
    $pdo->beginTransaction();
    foreach (TABLES as $table => $columns) {
        $rows = is_array($push[$table] ?? null) ? $push[$table] : [];

        $checkStmt = $pdo->prepare(
            "SELECT updated_at, deleted_at FROM `$table` WHERE id = ?"
        );

        $colList = implode(',', array_map(fn($c) => "`$c`", $columns));
        $placeholders = implode(',', array_fill(0, count($columns), '?'));
        $updateList = implode(',', array_map(
            fn($c) => "`$c` = excluded.`$c`",
            array_values(array_filter($columns, fn($c) => $c !== 'id'))
        ));
        $upsertStmt = $pdo->prepare(
            "INSERT INTO `$table` ($colList) VALUES ($placeholders)
             ON CONFLICT(id) DO UPDATE SET $updateList"
        );

        foreach ($rows as $row) {
            if (!is_array($row) || empty($row['id'])) {
                continue;
            }

            // updated_at client (avant tampon serveur) pour le LWW réel.
            $clientUpdatedAt = (string) ($row['updated_at'] ?? '');
            if ($clientUpdatedAt === '') {
                $clientUpdatedAt = $serverTime;
            }

            $checkStmt->execute([$row['id']]);
            $existing = $checkStmt->fetch(PDO::FETCH_ASSOC);
            if ($existing !== false) {
                $existingUpdatedAt = (string) ($existing['updated_at'] ?? '');
                $existingDeletedAt = trim((string) ($existing['deleted_at'] ?? ''));
                $incomingDeletedAt = trim((string) ($row['deleted_at'] ?? ''));

                // Ne jamais ressusciter une ligne déjà tombstonée par un
                // appareil qui pousse encore une copie « vivante » (bug CRM :
                // soft-delete serveur écrasé au prochain sync).
                if ($existingDeletedAt !== '' && $incomingDeletedAt === '') {
                    continue;
                }

                if ($existingUpdatedAt !== '' && $existingUpdatedAt >= $clientUpdatedAt) {
                    continue;
                }
            }

            // Tampon serveur APRÈS acceptation — les autres appareils
            // (since = last_sync_at) reçoivent bien la ligne au prochain pull.
            $row['updated_at'] = $serverTime;

            $values = [];
            foreach ($columns as $col) {
                $values[] = array_key_exists($col, $row) ? $row[$col] : null;
            }
            $upsertStmt->execute($values);
        }
    }
    $pdo->commit();
} catch (Throwable $e) {
    if ($pdo->inTransaction()) {
        $pdo->rollBack();
    }
    fail('Erreur de synchronisation : ' . $e->getMessage(), 500);
}

echo json_encode(['ok' => true, 'server_time' => $serverTime, 'pull' => $pull]);

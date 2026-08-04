#!/usr/bin/env bash
# Déploie server/crm-sync/ sur emhk.eastmarkhk.com/crm via FTP SiteGround.
# Usage :
#   export CRM_FTP_USER='emhk@eastmarkhk.com'
#   export CRM_FTP_PASS='votre-mot-de-passe'
#   ./deploy-ftp.sh
set -euo pipefail

FTP_HOST="${CRM_FTP_HOST:-ftp.eastmarkhk.com}"
FTP_USER="${CRM_FTP_USER:?CRM_FTP_USER requis}"
FTP_PASS="${CRM_FTP_PASS:?CRM_FTP_PASS requis}"
# Sous-dossier web unifié.
REMOTE_DIR="${CRM_FTP_REMOTE:-crm}"

ROOT="$(cd "$(dirname "$0")" && pwd)"
BASE="ftp://${FTP_HOST}/${REMOTE_DIR}"

upload() {
  local file="$1"
  local dest="${2:-$(basename "$file")}"
  curl -sS --ftp-create-dirs -T "${ROOT}/${file}" -u "${FTP_USER}:${FTP_PASS}" "${BASE}/${dest}"
  echo "  ↑ ${dest}"
}

echo "→ Déploiement vers ${BASE}/"
upload sync.php
upload db.php
upload config.php
upload .htaccess
mkdir -p "${ROOT}/.deploy-data"
echo 'Require all denied' > "${ROOT}/.deploy-data/htaccess"
curl -sS --ftp-create-dirs -T "${ROOT}/.deploy-data/htaccess" -u "${FTP_USER}:${FTP_PASS}" "${BASE}/data/.htaccess"
echo "  ↑ data/.htaccess"
rm -rf "${ROOT}/.deploy-data"

echo "→ Test HTTPS…"
curl -sS -X POST "https://emhk.eastmarkhk.com/crm/sync.php" \
  -H "Content-Type: application/json" \
  -d "{\"auth\":{\"account\":\"emhk@eastmarkhk.com\",\"password\":\"${CRM_FTP_PASS}\"},\"since\":\"1970-01-01T00:00:00.000Z\",\"push\":{}}" \
  | head -c 400
echo ""
echo "✓ Terminé"

#!/usr/bin/env bash
# Déploie server/crm-sync/ sur crm.eastmarkhk.com via FTP SiteGround.
# Usage :
#   export CRM_FTP_USER='crm@eastmarkhk.com'
#   export CRM_FTP_PASS='votre-mot-de-passe'
#   ./deploy-ftp.sh
set -euo pipefail

FTP_HOST="${CRM_FTP_HOST:-ftp.eastmarkhk.com}"
FTP_USER="${CRM_FTP_USER:?CRM_FTP_USER requis}"
FTP_PASS="${CRM_FTP_PASS:?CRM_FTP_PASS requis}"
# Racine web du compte FTP crm@eastmarkhk.com (= public_html côté serveur).
# Ne pas utiliser crm.eastmarkhk.com/public_html — ce dossier n'est pas servi par le web.
REMOTE_DIR="${CRM_FTP_REMOTE:-}"

ROOT="$(cd "$(dirname "$0")" && pwd)"
if [ -n "$REMOTE_DIR" ]; then
  BASE="ftp://${FTP_HOST}/${REMOTE_DIR}"
else
  BASE="ftp://${FTP_HOST}"
fi

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
curl -sS -X POST "https://crm.eastmarkhk.com/sync.php" \
  -H "Content-Type: application/json" \
  -d "{\"auth\":{\"account\":\"crm@eastmarkhk.com\",\"password\":\"${CRM_FTP_PASS}\"},\"since\":\"1970-01-01T00:00:00.000Z\",\"push\":{}}" \
  | head -c 400
echo ""
echo "✓ Terminé"

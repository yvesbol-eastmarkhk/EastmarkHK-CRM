<#
.SYNOPSIS
  Build MSIX pour EastmarkHK CRM — sideload (défaut) ou Microsoft Store.

.DESCRIPTION
  Sideload (test local / distribution directe) :

      powershell -ExecutionPolicy Bypass -File tool\build_msix.ps1

  Microsoft Store (valeurs de Partner Center > Product identity) :

      powershell -ExecutionPolicy Bypass -File tool\build_msix.ps1 -Store `
        -IdentityName "12345EastmarkHK.EastmarkHKCRM" `
        -Publisher "CN=XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX" `
        -PublisherDisplayName "EastmarkHK"

  Les 3 valeurs Store peuvent aussi venir des variables d'environnement
  EMHK_STORE_IDENTITY_NAME / EMHK_STORE_PUBLISHER / EMHK_STORE_PUBLISHER_DISPLAY_NAME
  (évite de les mettre dans le repo).

  Le mode -Store ne signe PAS le paquet : Partner Center le signe à
  la soumission. Uploadez le .msix résultant dans Partner Center > Packages.

  Bump de version : -MsixVersion 1.0.1.0 (ou msix_version dans pubspec.yaml).
  Le Store exige une version strictement croissante à chaque soumission.

  NB : EastmarkHK CRM est gratuit — pas d'IAP à ce jour sur cette build.
  Le module e-Invoicing (payant sur iOS/macOS) n'a pas encore d'équivalent
  Microsoft Store ; il reste désactivé/masqué côté Windows en attendant,
  avec activation web (code + e-mail) comme seule voie de secours.
#>

param(
  [switch]$Store,
  [string]$IdentityName = $env:EMHK_STORE_IDENTITY_NAME,
  [string]$Publisher = $env:EMHK_STORE_PUBLISHER,
  [string]$PublisherDisplayName = $env:EMHK_STORE_PUBLISHER_DISPLAY_NAME,
  [string]$MsixVersion = ''
)

$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

Write-Host "==> flutter pub get"
flutter pub get
if ($LASTEXITCODE -ne 0) { throw "flutter pub get failed ($LASTEXITCODE)" }

Write-Host "==> flutter build windows --release"
flutter build windows --release
if ($LASTEXITCODE -ne 0) { throw "flutter build windows failed ($LASTEXITCODE)" }

$msixArgs = @()
if ($Store) {
  if ([string]::IsNullOrWhiteSpace($IdentityName)) {
    throw "Mode -Store : -IdentityName requis (Partner Center > Product identity > Package/Identity/Name)."
  }
  if ([string]::IsNullOrWhiteSpace($Publisher)) {
    throw "Mode -Store : -Publisher requis (Product identity > Package/Properties/Publisher)."
  }
  if ([string]::IsNullOrWhiteSpace($PublisherDisplayName)) {
    throw "Mode -Store : -PublisherDisplayName requis (Product identity > Package/Properties/PublisherDisplayName)."
  }
  $msixArgs += @(
    '--store',
    '--identity-name', $IdentityName,
    '--publisher', $Publisher,
    '--publisher-display-name', $PublisherDisplayName
  )
  Write-Host "==> Mode Microsoft Store : $IdentityName"
} else {
  Write-Host "==> Mode sideload (signature locale de test)"
}
if (-not [string]::IsNullOrWhiteSpace($MsixVersion)) {
  $msixArgs += @('--version', $MsixVersion)
}

Write-Host "==> dart run msix:create $msixArgs"
dart run msix:create --build-windows false @msixArgs
if ($LASTEXITCODE -ne 0) { throw "msix:create failed ($LASTEXITCODE)" }

$outDir = Join-Path $root "build\windows\x64\runner\Release"
Get-ChildItem $outDir -Filter *.msix -ErrorAction SilentlyContinue |
  Sort-Object LastWriteTime -Descending |
  Select-Object -First 1 |
  ForEach-Object { Write-Host "==> MSIX prêt : $($_.FullName) ($([math]::Round($_.Length / 1MB, 1)) MB)" }

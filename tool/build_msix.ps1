<#
.SYNOPSIS
  Build MSIX for EastmarkHK CRM - sideload (default) or Microsoft Store.

.DESCRIPTION
  Sideload (local test / direct distribution):

      powershell -ExecutionPolicy Bypass -File tool\build_msix.ps1

  Microsoft Store (values from Partner Center > Product identity):

      powershell -ExecutionPolicy Bypass -File tool\build_msix.ps1 -Store `
        -IdentityName "12345EastmarkHK.EastmarkHKCRM" `
        -Publisher "CN=XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX" `
        -PublisherDisplayName "EastmarkHK"

  The 3 Store values can also come from environment variables
  EMHK_STORE_IDENTITY_NAME / EMHK_STORE_PUBLISHER / EMHK_STORE_PUBLISHER_DISPLAY_NAME
  (keeps them out of the repo).

  -Store mode does NOT sign the package: Partner Center signs on submission.
  Upload the resulting .msix in Partner Center > Packages.

  Version bump: -MsixVersion 1.0.2.28 (or msix_version in pubspec.yaml).
  The Store requires a strictly increasing version on each submission.

  If SignTool fails on the timestamp (sideload):
    - retry (DigiCert/Sectigo TSA is sometimes down)
    - or use -Store for a Microsoft Store submission (no local signing)
#>

param(
  [switch]$Store,
  [string]$IdentityName = $env:EMHK_STORE_IDENTITY_NAME,
  [string]$Publisher = $env:EMHK_STORE_PUBLISHER,
  [string]$PublisherDisplayName = $env:EMHK_STORE_PUBLISHER_DISPLAY_NAME,
  [string]$MsixVersion = '',
  # Sideload: alternate timestamp server if DigiCert/Sectigo is down.
  [string]$TimestampUrl = 'http://timestamp.sectigo.com'
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
    throw "Mode -Store: -IdentityName required (Partner Center > Product identity > Package/Identity/Name)."
  }
  if ([string]::IsNullOrWhiteSpace($Publisher)) {
    throw "Mode -Store: -Publisher required (Product identity > Package/Properties/Publisher)."
  }
  if ([string]::IsNullOrWhiteSpace($PublisherDisplayName)) {
    throw "Mode -Store: -PublisherDisplayName required (Product identity > Package/Properties/PublisherDisplayName)."
  }
  $msixArgs += @(
    '--store',
    '--identity-name', $IdentityName,
    '--publisher', $Publisher,
    '--publisher-display-name', $PublisherDisplayName
  )
  Write-Host "==> Mode Microsoft Store: $IdentityName (unsigned - Partner Center signs)"
} else {
  Write-Host "==> Mode sideload (local signing)"
  Write-Host "    timestamp: $TimestampUrl"
  $msixArgs += @(
    '--signtool-options',
    "/fd SHA256 /tr $TimestampUrl /td SHA256"
  )
}
if (-not [string]::IsNullOrWhiteSpace($MsixVersion)) {
  $msixArgs += @('--version', $MsixVersion)
}

Write-Host "==> dart run msix:create $msixArgs"
dart run msix:create --build-windows false @msixArgs
if ($LASTEXITCODE -ne 0) {
  if (-not $Store) {
    Write-Host ""
    Write-Host "SignTool timestamp failed often means the TSA is unreachable."
    Write-Host "Retry with another server, e.g.:"
    Write-Host "  powershell -ExecutionPolicy Bypass -File tool\build_msix.ps1 -TimestampUrl http://timestamp.digicert.com"
    Write-Host "  powershell -ExecutionPolicy Bypass -File tool\build_msix.ps1 -TimestampUrl http://timestamp.globalsign.com/tsa/r6advanced1"
    Write-Host "For Microsoft Store submission use -Store (no local signing)."
  }
  throw "msix:create failed ($LASTEXITCODE)"
}

$outDir = Join-Path $root "build\windows\x64\runner\Release"
Get-ChildItem $outDir -Filter *.msix -ErrorAction SilentlyContinue |
  Sort-Object LastWriteTime -Descending |
  Select-Object -First 1 |
  ForEach-Object {
    $mb = [math]::Round($_.Length / 1MB, 1)
    Write-Host "==> MSIX ready: $($_.FullName) ($mb MB)"
  }

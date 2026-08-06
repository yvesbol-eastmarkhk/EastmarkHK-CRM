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

  Version bump: -MsixVersion 1.0.2.0 (or msix_version in pubspec.yaml).
  Microsoft Store REQUIRES revision (4th number) = 0, e.g. 1.0.2.0 not 1.0.2.28.
  Each Store submission also needs a strictly increasing version.

  Sideload uses the msix package defaults (DigiCert timestamp). Do NOT pass
  partial --signtool-options: msix always appends /fd /td /tr and duplicates fail.

  If DigiCert is unreachable, retry with an alternate TSA (full custom command):

      powershell -ExecutionPolicy Bypass -File tool\build_msix.ps1 `
        -TimestampUrl http://timestamp.sectigo.com

  Or use -Store for a Microsoft Store submission (no local signing).
#>

param(
  [switch]$Store,
  [string]$IdentityName = $env:EMHK_STORE_IDENTITY_NAME,
  [string]$Publisher = $env:EMHK_STORE_PUBLISHER,
  [string]$PublisherDisplayName = $env:EMHK_STORE_PUBLISHER_DISPLAY_NAME,
  [string]$MsixVersion = '',
  # Optional. When set, replaces the whole SignTool command (needed to change TSA).
  [string]$TimestampUrl = ''
)

$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

function Get-MsixTestCertificate {
  $pubCache = if ($env:PUB_CACHE) { $env:PUB_CACHE } else { Join-Path $env:LOCALAPPDATA 'Pub\Cache' }
  $hosted = Join-Path $pubCache 'hosted\pub.dev'
  if (-not (Test-Path $hosted)) {
    throw "Pub cache not found at $hosted (needed for alternate -TimestampUrl)."
  }
  $cert = Get-ChildItem -Path $hosted -Filter 'test_certificate.pfx' -Recurse -ErrorAction SilentlyContinue |
    Where-Object { $_.FullName -match '[\\/]msix-\d' } |
    Sort-Object FullName -Descending |
    Select-Object -First 1
  if (-not $cert) {
    throw "msix test_certificate.pfx not found under $hosted. Run 'flutter pub get' first."
  }
  return $cert.FullName
}

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
  if (-not [string]::IsNullOrWhiteSpace($TimestampUrl)) {
    # Partial /tr /td alone is MERGED with msix defaults and causes
    # "You cannot use the /td option twice". A full custom command (/f)
    # replaces the defaults instead.
    $certPath = Get-MsixTestCertificate
    Write-Host "    timestamp override: $TimestampUrl"
    Write-Host "    certificate: $certPath"
    $msixArgs += @(
      '--signtool-options',
      "/v /fd SHA256 /tr $TimestampUrl /td SHA256 /f `"$certPath`" /p 1234"
    )
  } else {
    Write-Host "    timestamp: DigiCert (msix default)"
  }
}
if (-not [string]::IsNullOrWhiteSpace($MsixVersion)) {
  $msixArgs += @('--version', $MsixVersion)
}

Write-Host "==> dart run msix:create $msixArgs"
dart run msix:create --build-windows false @msixArgs
if ($LASTEXITCODE -ne 0) {
  if (-not $Store) {
    Write-Host ""
    Write-Host "If SignTool failed on the timestamp server, retry:"
    Write-Host "  powershell -ExecutionPolicy Bypass -File tool\build_msix.ps1 -TimestampUrl http://timestamp.sectigo.com"
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
    if ($Store) {
      $storeDir = Join-Path $root "build\store"
      New-Item -ItemType Directory -Path $storeDir -Force | Out-Null
      $ver = if ($MsixVersion) { $MsixVersion } else { "store" }
      $alias = Join-Path $storeDir "EastmarkHK-CRM-STORE-$ver.msix"
      Copy-Item $_.FullName $alias -Force
      Write-Host "==> STORE UPLOAD THIS FILE (not sideload):"
      Write-Host "    $alias"
      try {
        $desktop = [Environment]::GetFolderPath("Desktop")
        $deskCopy = Join-Path $desktop "EastmarkHK-CRM-STORE-$ver.msix"
        Copy-Item $_.FullName $deskCopy -Force
        Write-Host "    (also on Desktop: $deskCopy)"
      } catch {}
    }
    $mb = [math]::Round($_.Length / 1MB, 1)
    Write-Host "==> MSIX ready: $($_.FullName) ($mb MB)"
  }

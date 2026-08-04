<#
.SYNOPSIS
  Installe EastmarkHK CRM (build Windows release) pour test local sur cette machine.

.DESCRIPTION
  Copie build\windows\x64\runner\Release vers
  %LOCALAPPDATA%\Programs\EastmarkHK CRM\
  et crée un raccourci dans le menu Démarrer (+ Bureau si -DesktopShortcut).

  Prérequis : flutter build windows --release

  Exemple :
      powershell -ExecutionPolicy Bypass -File tool\install_windows.ps1
      powershell -ExecutionPolicy Bypass -File tool\install_windows.ps1 -Launch
#>

param(
  [switch]$Launch,
  [switch]$DesktopShortcut
)

$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $PSScriptRoot
$source = Join-Path $root "build\windows\x64\runner\Release"
$exeName = "eastmarkhk_crm.exe"
$exePath = Join-Path $source $exeName

if (-not (Test-Path $exePath)) {
  throw "Build introuvable : $exePath`nLancez d'abord : flutter build windows --release"
}

$installDir = Join-Path $env:LOCALAPPDATA "Programs\EastmarkHK CRM"
$targetExe = Join-Path $installDir $exeName

Write-Host "==> Installation vers $installDir"
if (Test-Path $installDir) {
  Remove-Item $installDir -Recurse -Force
}
New-Item -ItemType Directory -Path $installDir -Force | Out-Null
Copy-Item -Path (Join-Path $source "*") -Destination $installDir -Recurse -Force

$iconPath = Join-Path $root "windows\runner\resources\app_icon.ico"
$wsh = New-Object -ComObject WScript.Shell

function New-Shortcut {
  param(
    [string]$LinkPath,
    [string]$Target,
    [string]$Icon = $null
  )
  $shortcut = $wsh.CreateShortcut($LinkPath)
  $shortcut.TargetPath = $Target
  $shortcut.WorkingDirectory = $installDir
  if ($Icon -and (Test-Path $Icon)) {
    $shortcut.IconLocation = "$Icon,0"
  }
  $shortcut.Save()
}

$startMenu = [Environment]::GetFolderPath("Programs")
$startLink = Join-Path $startMenu "EastmarkHK CRM.lnk"
New-Shortcut -LinkPath $startLink -Target $targetExe -Icon $iconPath
Write-Host "==> Raccourci menu Démarrer : $startLink"

if ($DesktopShortcut) {
  $desktop = [Environment]::GetFolderPath("Desktop")
  $desktopLink = Join-Path $desktop "EastmarkHK CRM.lnk"
  New-Shortcut -LinkPath $desktopLink -Target $targetExe -Icon $iconPath
  Write-Host "==> Raccourci Bureau : $desktopLink"
}

Write-Host "==> Installé : $targetExe ($([math]::Round((Get-ChildItem $installDir -Recurse | Measure-Object -Property Length -Sum).Sum / 1MB, 1)) MB)"

if ($Launch) {
  Write-Host "==> Lancement..."
  Start-Process $targetExe
}

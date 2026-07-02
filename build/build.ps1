[CmdletBinding()]
param(
    [switch]$Test,
    [switch]$Analyze
)

$RepoRoot = Split-Path -Parent $PSScriptRoot
$ModuleManifest = Join-Path $RepoRoot 'Keldor.Build.psd1'

Import-Module $ModuleManifest -Force

if ($Analyze) {
    Invoke-ScriptAnalyzer -Path $RepoRoot -Recurse
}

if ($Test) {
    Invoke-Pester (Join-Path $RepoRoot 'Tests')
}

Get-Module Keldor.Build

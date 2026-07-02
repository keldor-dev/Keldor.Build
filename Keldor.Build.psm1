$script:KeldorBuildProviders = @{}

$ModuleRoot = $PSScriptRoot

foreach ($Path in @(
    Join-Path $ModuleRoot 'Private/Common'
    Join-Path $ModuleRoot 'Public/Common'
)) {
    if (Test-Path $Path) {
        Get-ChildItem -Path $Path -Filter '*.ps1' -File -Recurse | ForEach-Object {
            . $_.FullName
        }
    }
}

$PublicCommands = Get-ChildItem -Path (Join-Path $ModuleRoot 'Public') -Filter '*.ps1' -File -Recurse -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty BaseName

Export-ModuleMember -Function $PublicCommands

function Get-KeldorBuildProvider {
    [CmdletBinding()]
    param(
        [Parameter(Position = 0)]
        [string]$Name
    )

    if ($Name) {
        return $script:KeldorBuildProviders[$Name]
    }

    $script:KeldorBuildProviders.Values | Sort-Object Name
}

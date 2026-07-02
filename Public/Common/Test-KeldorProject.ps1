function Test-KeldorProject {
    [CmdletBinding()]
    param(
        [Parameter(Position = 0)]
        [string]$Path = (Get-Location).Path
    )

    $Project = Resolve-KeldorProject -Path $Path
    $Provider = Get-KeldorBuildProvider -Name $Project.ProviderName

    if (-not $Provider.ValidationScript) {
        Write-Verbose "Provider '$($Provider.Name)' does not define a validation script."
        return $true
    }

    & $Provider.ValidationScript $Project
}

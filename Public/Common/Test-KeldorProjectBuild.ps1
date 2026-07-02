function Test-KeldorProjectBuild {
    [CmdletBinding()]
    param(
        [Parameter(Position = 0)]
        [string]$Path = (Get-Location).Path
    )

    $Project = Resolve-KeldorProject -Path $Path
    $Provider = Get-KeldorBuildProvider -Name $Project.ProviderName

    if (-not $Provider.TestScript) {
        Write-Verbose "Provider '$($Provider.Name)' does not define a test script."
        return $true
    }

    & $Provider.TestScript $Project
}

function Build-KeldorProject {
    [CmdletBinding()]
    param(
        [Parameter(Position = 0)]
        [string]$Path = (Get-Location).Path,

        [Parameter()]
        [switch]$Clean,

        [Parameter()]
        [switch]$Test
    )

    $Project = Resolve-KeldorProject -Path $Path
    $Provider = Get-KeldorBuildProvider -Name $Project.ProviderName

    if ($Clean) {
        Clean-KeldorProject -Path $Project.Path
    }

    if (-not $Provider.BuildScript) {
        throw "Provider '$($Provider.Name)' does not define a build script."
    }

    $Result = & $Provider.BuildScript $Project

    if ($Test) {
        Test-KeldorProjectBuild -Path $Project.Path
    }

    $Result
}

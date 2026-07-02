function Resolve-KeldorProject {
    [CmdletBinding()]
    param(
        [Parameter(Position = 0)]
        [ValidateNotNullOrEmpty()]
        [string]$Path = (Get-Location).Path
    )

    $ResolvedPath = (Resolve-Path -Path $Path).Path
    $ProjectName = Split-Path -Path $ResolvedPath -Leaf

    foreach ($Provider in Get-KeldorBuildProvider) {
        $Detected = & $Provider.DetectionScript $ResolvedPath

        if ($Detected) {
            return New-KeldorProjectObject -Path $ResolvedPath -Name $ProjectName -ProjectType $Provider.ProjectType -ProviderName $Provider.Name
        }
    }

    throw "Unable to resolve a Keldor project at '$ResolvedPath'. No registered provider detected the project type."
}

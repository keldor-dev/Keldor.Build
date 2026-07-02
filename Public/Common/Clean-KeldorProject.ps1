function Clean-KeldorProject {
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Position = 0)]
        [string]$Path = (Get-Location).Path
    )

    $Project = Resolve-KeldorProject -Path $Path
    $Provider = Get-KeldorBuildProvider -Name $Project.ProviderName

    if ($Provider.CleanScript) {
        if ($PSCmdlet.ShouldProcess($Project.Path, 'Clean project using provider clean script')) {
            return & $Provider.CleanScript $Project
        }
    }

    $DefaultPaths = @('out', 'artifacts', 'build/output') | ForEach-Object {
        Join-Path $Project.Path $_
    }

    foreach ($Item in $DefaultPaths) {
        if (Test-Path $Item) {
            if ($PSCmdlet.ShouldProcess($Item, 'Remove build output')) {
                Remove-Item -Path $Item -Recurse -Force
            }
        }
    }
}

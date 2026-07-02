function Publish-KeldorProject {
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Position = 0)]
        [string]$Path = (Get-Location).Path,

        [Parameter()]
        [string]$Repository
    )

    $Project = Resolve-KeldorProject -Path $Path
    $Provider = Get-KeldorBuildProvider -Name $Project.ProviderName

    if (-not $Provider.PublishScript) {
        throw "Provider '$($Provider.Name)' does not define a publish script."
    }

    if ($PSCmdlet.ShouldProcess($Project.Name, 'Publish Keldor project')) {
        & $Provider.PublishScript $Project $Repository
    }
}

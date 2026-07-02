function Register-KeldorBuildProvider {
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$Name,

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$ProjectType,

        [Parameter(Mandatory)]
        [scriptblock]$DetectionScript,

        [Parameter()]
        [scriptblock]$ValidationScript,

        [Parameter()]
        [scriptblock]$BuildScript,

        [Parameter()]
        [scriptblock]$TestScript,

        [Parameter()]
        [scriptblock]$CleanScript,

        [Parameter()]
        [scriptblock]$PublishScript,

        [Parameter()]
        [switch]$Force
    )

    if ($script:KeldorBuildProviders.ContainsKey($Name) -and -not $Force) {
        throw "A Keldor build provider named '$Name' is already registered. Use -Force to replace it."
    }

    $Provider = [pscustomobject]@{
        PSTypeName        = 'Keldor.Build.Provider'
        Name              = $Name
        ProjectType       = $ProjectType
        DetectionScript   = $DetectionScript
        ValidationScript  = $ValidationScript
        BuildScript       = $BuildScript
        TestScript        = $TestScript
        CleanScript       = $CleanScript
        PublishScript     = $PublishScript
    }

    if ($PSCmdlet.ShouldProcess($Name, 'Register Keldor build provider')) {
        $script:KeldorBuildProviders[$Name] = $Provider
        $Provider
    }
}

function New-KeldorProjectObject {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Path,

        [Parameter(Mandatory)]
        [string]$Name,

        [Parameter(Mandatory)]
        [string]$ProjectType,

        [Parameter(Mandatory)]
        [string]$ProviderName
    )

    [pscustomobject]@{
        PSTypeName   = 'Keldor.Build.Project'
        Name         = $Name
        Path         = $Path
        ProjectType  = $ProjectType
        ProviderName = $ProviderName
    }
}

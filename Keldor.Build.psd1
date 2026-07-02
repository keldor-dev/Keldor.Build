@{
    RootModule        = 'Keldor.Build.psm1'
    ModuleVersion     = '0.1.0'
    GUID              = '6b5340b8-77de-4db1-a0ce-05c1d691d6a7'
    Author            = 'Keldor Dev'
    CompanyName       = 'Keldor'
    Copyright         = '(c) Keldor Dev. All rights reserved.'
    Description       = 'Generic build orchestration for the Keldor ecosystem.'
    PowerShellVersion = '7.2'
    FunctionsToExport = @(
        'Build-KeldorProject',
        'Clean-KeldorProject',
        'Get-KeldorBuildProvider',
        'Publish-KeldorProject',
        'Register-KeldorBuildProvider',
        'Resolve-KeldorProject',
        'Test-KeldorProject',
        'Test-KeldorProjectBuild'
    )
    CmdletsToExport   = @()
    VariablesToExport = @()
    AliasesToExport   = @()
    PrivateData       = @{
        PSData = @{
            Tags         = @('Keldor', 'Build', 'Automation', 'DevOps')
            LicenseUri   = 'https://github.com/keldor-dev/Keldor.Build/blob/main/LICENSE'
            ProjectUri   = 'https://github.com/keldor-dev/Keldor.Build'
            ReleaseNotes = 'Initial scaffold for Keldor.Build.'
        }
    }
}

BeforeAll {
    Import-Module (Join-Path $PSScriptRoot '..' 'Keldor.Build.psd1') -Force
}

Describe 'Keldor.Build' {
    It 'imports successfully' {
        Get-Module Keldor.Build | Should -Not -BeNullOrEmpty
    }

    It 'exports expected commands' {
        $Commands = Get-Command -Module Keldor.Build | Select-Object -ExpandProperty Name
        $Commands | Should -Contain 'Register-KeldorBuildProvider'
        $Commands | Should -Contain 'Resolve-KeldorProject'
        $Commands | Should -Contain 'Build-KeldorProject'
    }
}

# Keldor.Build

Keldor.Build provides generic build orchestration for the Keldor ecosystem.

It is intentionally language-agnostic. Language-specific build behavior should live in provider modules such as:

- `Keldor.Build.PowerShell`
- `Keldor.Build.Python`
- `Keldor.Build.DotNet`
- `Keldor.Build.Node`
- `Keldor.Build.Go`

## Purpose

Keldor.Build provides a consistent command surface for discovering, validating, building, testing, cleaning, and publishing Keldor projects.

Provider modules implement the language-specific details.

## Commands

```powershell
Get-KeldorBuildProvider
Register-KeldorBuildProvider
Resolve-KeldorProject
Test-KeldorProject
Build-KeldorProject
Test-KeldorProjectBuild
Clean-KeldorProject
Publish-KeldorProject
```

## Example

```powershell
Import-Module ./Keldor.Build.psd1 -Force

Resolve-KeldorProject -Path .
Test-KeldorProject -Path .
Build-KeldorProject -Path .
```

## Provider Model

Providers are registered in the current PowerShell session.

```powershell
Register-KeldorBuildProvider -Name PowerShell -ProjectType PowerShellModule -DetectionScript {
    param($Path)
    [bool](Get-ChildItem -Path $Path -Filter '*.psd1' -File -ErrorAction SilentlyContinue)
} -BuildScript {
    param($Project)
    Write-Verbose "Building $($Project.Name)"
}
```

The generic layer should not assume that every project is a PowerShell module.

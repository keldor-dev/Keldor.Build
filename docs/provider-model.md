# Provider Model

Keldor.Build uses providers to keep the generic orchestration layer separate from language-specific build logic.

## Generic Layer

The generic module provides commands such as:

- `Resolve-KeldorProject`
- `Test-KeldorProject`
- `Build-KeldorProject`
- `Test-KeldorProjectBuild`
- `Clean-KeldorProject`
- `Publish-KeldorProject`

These commands should not assume that a project is a PowerShell module, Python package, .NET solution, Node package, or Go module.

## Provider Layer

Provider modules register build behavior at import time.

Example provider modules:

- `Keldor.Build.PowerShell`
- `Keldor.Build.Python`
- `Keldor.Build.DotNet`
- `Keldor.Build.Node`
- `Keldor.Build.Go`

A provider is responsible for detecting, validating, building, testing, cleaning, and publishing a specific project type.

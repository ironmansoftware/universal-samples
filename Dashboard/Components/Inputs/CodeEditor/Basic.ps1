<#
title: Basic
description: Creates a dashboard with a basic code editor.
file: dashboards.ps1
version: 1.5.8
#>
New-PSUDashboard -Name 'Code Editor' -BaseUrl '/CodeEditor' -Framework 'UniversalDashboard:Latest' -Content {
    New-UDDashboard -Title 'Code Editor' -Content {
        New-UDCodeEditor -Height '500' -Language 'powershell'
    }
} -Component @("UniversalDashboard.CodeEditor:1.0.4")
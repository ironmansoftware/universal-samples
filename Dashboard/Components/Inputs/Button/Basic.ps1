<#
title: Basic
description: Creates a basic button
file: dashboards.ps1
version: 1.5.8
#>
New-PSUDashboard -Name 'Button' -BaseUrl '/Button' -Framework 'UniversalDashboard:Latest' -Content {
    New-UDDashboard -Title 'Button' -Content {
        New-UDButton -Variant 'contained' -Text 'Default'
    }
}
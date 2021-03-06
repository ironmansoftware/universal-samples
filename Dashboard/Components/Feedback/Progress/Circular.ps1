<#
title: Circular
description: Creates a dashboard with a circular progress.
file: dashboards.ps1
version: 1.5.8
#>
New-PSUDashboard -Name 'Progress' -BaseUrl '/Progress' -Framework 'UniversalDashboard:Latest' -Content {
    New-UDDashboard -Title 'Progress' -Content {
        New-UDProgress -Circular -Color Blue 
    }
}
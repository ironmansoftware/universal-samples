<#
title: Single Page
description: Creates a dashboard with a basic page
file: dashboards.ps1
version: 1.5.8
#>
New-PSUDashboard -Name 'Pages' -BaseUrl '/pages' -Framework 'UniversalDashboard:Latest' -Content {
    $Pages = @()
    $Pages += New-UDPage -Name 'Dashboard' -Content {
        New-UDTypography -Text 'Dashboard'
    }
    
    New-UDDashboard -Title 'Pages' -Pages $Pages
}
<#
title: Multiple Pages
description: Creates a dashboard with a multiple pages
file: dashboards.ps1
version: 1.5.8
#>
New-PSUDashboard -Name 'Pages' -BaseUrl '/pages' -Framework 'UniversalDashboard:Latest' -Content {
    $Pages = @()
    $Pages += New-UDPage -Name 'Dashboard One' -Content {
        New-UDTypography -Text 'Dashboard Two'
    }
    
    $Pages += New-UDPage -Name 'Dashboard Two' -Content {
        New-UDTypography -Text 'Dashboard Two'
    }
    
    New-UDDashboard -Title 'Pages' -Pages $Pages
}
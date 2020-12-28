<#
title: Custom URL
description: Creates a page with a custom URL
file: dashboards.ps1
version: 1.5.8
#>
New-PSUDashboard -Name 'Pages' -BaseUrl '/pages' -Framework 'UniversalDashboard:Latest' -Content {
    $Pages = @()
    $Pages += New-UDPage -Name 'Dashboard' -Url '/db' -Content {
        New-UDTypography -Text 'Dashboard'
    }
    
    New-UDDashboard -Title 'Pages' -Pages $Pages
}
<#
title: Variables
description: Creates a page with variables in the URL
file: dashboards.ps1
version: 1.5.8
#>

# This dashboard has a single page that accepts a $user variable in the URL
New-PSUDashboard -Name 'Pages' -BaseUrl '/pages' -Framework 'UniversalDashboard:Latest' -Content {
    $Pages = @()
    $Pages += New-UDPage -Name 'Dashboard' -Url '/db/:user' -Content {
        New-UDTypography -Text 'Dashboard for user: $User'
    }
    
    New-UDDashboard -Title 'Pages' -Pages $Pages
}
<#
title: Permanent Navigation Drawer
description: Creates a dashboard with a permanent navigation drawer.
file: dashboards.ps1
version: 1.5.8
#>

New-PSUDashboard -Name 'Pages' -BaseUrl '/pages' -Framework 'UniversalDashboard:Latest' -Content {
    $Pages = @()
    $Pages += New-UDPage -Name 'Test' -Content {
     New-UDTypography -Text "Hello"
    } -NavigationLayout permanent
    
    $Pages += New-UDPage -Name 'Test2' -Content {
        New-UDTypography -Text "Hello"
    } -NavigationLayout permanent
    
    
    New-UDDashboard -Title "Hello, World!" -Pages $Pages
}
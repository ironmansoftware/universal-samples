<#
title: Custom Navigation
description: Creates a dashboard with custom navigation.
file: dashboards.ps1
version: 1.5.8
#>

New-PSUDashboard -Name 'Pages' -BaseUrl '/pages' -Framework 'UniversalDashboard:Latest' -Content {
    $Navigation = @(
        New-UDListItem -Label "Home"
        New-UDListItem -Label "Getting Started" -Children {
            New-UDListItem -Label "Installation" -OnClick { Invoke-UDRedirect '/installation' }
            New-UDListItem -Label "Usage" -OnClick { Invoke-UDRedirect '/usage' }
            New-UDListItem -Label "FAQs" -OnClick { Invoke-UDRedirect '/faqs' }
            New-UDListItem -Label "System Requirements" -OnClick { Invoke-UDRedirect '/requirements' }
            New-UDListItem -Label "Purchasing" -OnClick { Invoke-UDRedirect '/purchasing'}
        }
    )
    
    $Pages = @()
    $Pages += New-UDPage -Name 'Test' -Content {
     New-UDTypography -Text "Hello"
    } -NavigationLayout permanent -Navigation $Navigation
    
    $Pages += New-UDPage -Name 'Test2' -Content {
        New-UDTypography -Text "Hello"
    } -NavigationLayout permanent -Navigation $Navigation
    
    
    New-UDDashboard -Title "Hello, World!" -Pages $Pages
}
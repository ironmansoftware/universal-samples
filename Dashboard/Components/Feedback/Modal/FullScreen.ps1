<#
title: Fullscreen
description: Creates a dashboard with a fullscreen modal.
file: dashboards.ps1
version: 1.5.8
#>
New-PSUDashboard -Name 'Modal' -BaseUrl '/Modal' -Framework 'UniversalDashboard:Latest' -Content {
    New-UDDashboard -Title 'Modal' -Content {
        New-UDButton -Text 'Full Screen' -OnClick {
            Show-UDModal -Content {
                New-UDTypography -Text "Hello"
            } -Footer {
                New-UDButton -Text "Close" -OnClick { Hide-UDModal }
            }  -FullScreen
        }
    }
}
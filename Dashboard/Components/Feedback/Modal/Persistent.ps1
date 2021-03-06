<#
title: Persistent
description: Creates a dashboard with a persistent modal.
file: dashboards.ps1
version: 1.5.8
#>
New-PSUDashboard -Name 'Modal' -BaseUrl '/Modal' -Framework 'UniversalDashboard:Latest' -Content {
    New-UDDashboard -Title 'Modal' -Content {
        New-UDButton -Text 'Persistent' -OnClick {
            Show-UDModal -Content {
                New-UDTypography -Text "Hello"
            } -Footer {
                New-UDButton -Text "Close" -OnClick { Hide-UDModal }
            } -Persistent
        }
    }
}
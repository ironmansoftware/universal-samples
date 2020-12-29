<#
title: Full Width
description: Creates a dashboard with a full width modal.
file: dashboards.ps1
version: 1.5.8
#>
New-PSUDashboard -Name 'Modal' -BaseUrl '/Modal' -Framework 'UniversalDashboard:Latest' -Content {
    New-UDDashboard -Title 'Modal' -Content {
        New-UDButton -Text 'Full Width' -OnClick {
            Show-UDModal -Content {
                New-UDTypography -Text "Hello"
            } -FullWidth -MaxWidth 'md'
        }
    }
}
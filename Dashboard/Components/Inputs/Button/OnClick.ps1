<#
title: OnClick
description: Creates a button that shows a toast when clicked.
file: dashboards.ps1
version: 1.5.8
#>
New-PSUDashboard -Name 'Button' -BaseUrl '/Button' -Framework 'UniversalDashboard:Latest' -Content {
    New-UDDashboard -Title 'Button' -Content {
        New-UDButton -Text 'Message Box' -OnClick {
            Show-UDToast -Message 'Hello, world!'
        }
    }
}
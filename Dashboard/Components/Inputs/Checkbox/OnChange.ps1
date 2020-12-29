<#
title: OnChange
description: Creates a dashboard with a checkbox that has an OnChange event handler.
file: dashboards.ps1
version: 1.5.8
#>
New-PSUDashboard -Name 'Checkbox' -BaseUrl '/Checkbox' -Framework 'UniversalDashboard:Latest' -Content {
    New-UDDashboard -Title 'Checkbox' -Content {
        New-UDCheckBox -OnChange {
            Show-UDToast -Title 'Checkbox' -Message $Body
        }    
    }
}
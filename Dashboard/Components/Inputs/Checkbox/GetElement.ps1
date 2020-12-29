<#
title: Get-UDElement
description: Creates a dashboard with a checkbox and button that returns the value with Get-UDElement.
file: dashboards.ps1
version: 1.5.8
#>
New-PSUDashboard -Name 'Checkbox' -BaseUrl '/Checkbox' -Framework 'UniversalDashboard:Latest' -Content {
    New-UDDashboard -Title 'Checkbox' -Content {
        New-UDCheckbox -Id 'MyCheckbox' 

        New-UDButton -Text 'Get Value' -OnClick {
            Show-UDToast -Message (Get-UDElement -Id 'MyCheckbox').checked
        }
    }
}
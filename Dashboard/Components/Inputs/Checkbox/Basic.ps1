<#
title: Basic
description: Creates a dashboard with some basic checkboxes.
file: dashboards.ps1
version: 1.5.8
#>
New-PSUDashboard -Name 'Checkbox' -BaseUrl '/Checkbox' -Framework 'UniversalDashboard:Latest' -Content {
    New-UDDashboard -Title 'Checkbox' -Content {
        New-UDCheckBox
        New-UDCheckBox -Disabled
        New-UDCheckBox -Checked $true
        New-UDCheckBox -Checked $true -Disabled
    }
}
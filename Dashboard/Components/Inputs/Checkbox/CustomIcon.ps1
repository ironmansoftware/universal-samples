<#
title: Custom icon
description: Creates a dashboard with a checkbox that has a custom icon.
file: dashboards.ps1
version: 1.5.8
#>
New-PSUDashboard -Name 'Checkbox' -BaseUrl '/Checkbox' -Framework 'UniversalDashboard:Latest' -Content {
    New-UDDashboard -Title 'Checkbox' -Content {
        $Icon = New-UDIcon -Icon angry -Size lg -Regular
        $CheckedIcon = New-UDIcon -Icon angry -Size lg
        New-UDCheckBox -Icon $Icon -CheckedIcon $CheckedIcon -Style @{color = '#2196f3'}
    }
}
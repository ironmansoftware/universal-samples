<#
title: Dynamic
description: Creates an autocomplete component with a dynamically filtered set of options.
file: dashboards.ps1
version: 1.5.8
#>
New-PSUDashboard -Name 'Autocomplete' -BaseUrl '/autocomplete' -Framework 'UniversalDashboard:Latest' -Content {
    New-UDDashboard -Title 'Autocomplete' -Content {
        New-UDAutocomplete -OnLoadOptions { 
            @('Test', 'Test2', 'Test3', 'Test4') | Where-Object { $_ -match $Body } | ConvertTo-Json
        }
    }
}
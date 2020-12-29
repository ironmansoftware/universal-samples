<#
title: Line
description: Creates a dashboard with a Line chart.
file: dashboards.ps1
version: 1.5.8
#>
New-PSUDashboard -Name 'Chart' -BaseUrl '/chart' -Framework 'UniversalDashboard:Latest' -Content {
    New-UDDashboard -Title 'chart' -Content {
        $Data = Get-Process | Sort-Object -Property CPU -Descending | Select-Object -First 10 
        New-UDChartJS -Type 'line' -Data $Data -DataProperty CPU -LabelProperty ProcessName
    }
} -Component @("UniversalDashboard.Charts:1.3.2")
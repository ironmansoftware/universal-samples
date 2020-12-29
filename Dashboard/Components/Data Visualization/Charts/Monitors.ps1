<#
title: Monitors
description: Creates a dashboard with a monitor.
file: dashboards.ps1
version: 1.5.8
#>
New-PSUDashboard -Name 'Chart' -BaseUrl '/chart' -Framework 'UniversalDashboard:Latest' -Content {
    New-UDDashboard -Title 'chart' -Content {
        New-UDChartJSMonitor -LoadData {
            Get-Random -Max 100 | Out-UDChartJSMonitorData
        } -Labels "Random" -ChartBackgroundColor "#297741" -RefreshInterval 1
    }
} -Component @("UniversalDashboard.Charts:1.3.2")
<#
title: Colors
description: Creates a dashboard with a chart with custom colors.
file: dashboards.ps1
version: 1.5.8
#>
New-PSUDashboard -Name 'Chart' -BaseUrl '/chart' -Framework 'UniversalDashboard:Latest' -Content {
    New-UDDashboard -Title 'chart' -Content {
        $Data = Get-Process | Sort-Object -Property CPU -Descending | Select-Object -First 10 
 
        $Options = @{
          Type = 'bar'
          Data = $Data
          BackgroundColor = 'Red'
          BorderColor = '#c61d4a'
          HoverBackgroundColor = 'Blue'
          HoverBorderColor = '#451dc6'
          DataProperty = 'CPU'
          LabelProperty = 'ProcessName'
        }
        
        New-UDChartJS @Options
    }
} -Component @("UniversalDashboard.Charts:1.3.2")



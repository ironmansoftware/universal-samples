<#
title: OnClick
description: Creates a dashboard with a chart that has an OnClick event handler.
file: dashboards.ps1
version: 1.5.8
#>
New-PSUDashboard -Name 'Chart' -BaseUrl '/chart' -Framework 'UniversalDashboard:Latest' -Content {
    New-UDDashboard -Title 'chart' -Content {
        $Data = Get-Process | Sort-Object -Property CPU -Descending | Select-Object -First 10 
 
        $Options = @{
         Type = 'bar'
         Data = $Data
         DataProperty = 'CPU'
         LabelProperty = "ProcessName"
         OnClick = { 
            Show-UDToast -Message $Body
         }
       }
       
       
       New-UDChartJS @Options
    }
} -Component @("UniversalDashboard.Charts:1.3.2")
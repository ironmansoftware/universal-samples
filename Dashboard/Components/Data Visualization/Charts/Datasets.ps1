<#
title: Datasets
description: Creates a dashboard with a chart with multiple datasets.
file: dashboards.ps1
version: 1.5.8
#>
New-PSUDashboard -Name 'Chart' -BaseUrl '/chart' -Framework 'UniversalDashboard:Latest' -Content {
    New-UDDashboard -Title 'chart' -Content {
        $Data = Get-Process | Sort-Object -Property CPU -Descending | Select-Object -First 10 
 
        $CPUDataset = New-UDChartJSDataset -DataProperty CPU -Label CPU -BackgroundColor '#126f8c'
        $MemoryDataset = New-UDChartJSDataset -DataProperty HandleCount -Label 'Handle Count' -BackgroundColor '#8da322'
        
        $Options = @{
          Type = 'bar'
          Data = $Data
          Dataset = @($CPUDataset, $MemoryDataset)
          LabelProperty = "ProcessName"
        }
        
        New-UDChartJS @Options
    }
} -Component @("UniversalDashboard.Charts:1.3.2")



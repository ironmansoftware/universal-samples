<#
title: Nivo Stream
description: Creates a dashboard with a Nivo stream chart.
file: dashboards.ps1
version: 1.5.8
#>
New-PSUDashboard -Name 'Chart' -BaseUrl '/chart' -Framework 'UniversalDashboard:Latest' -Content {
    New-UDDashboard -Title 'chart' -Content {
        $Data = 1..10 | ForEach-Object { 
            @{
                "Adam" = Get-Random 
                "Alon" = Get-Random 
                "Lee" = Get-Random 
                "Frank" = Get-Random 
                "Bill" = Get-Random 
            }
        }
        
        New-UDNivoChart -Stream -Data $Data -Height 500 -Width 1000 -Keys @("adam", "alon", "lee", "frank", "bill")
    }
} -Component @("UniversalDashboard.Charts:1.3.2")
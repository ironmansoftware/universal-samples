<#
title: Nivo Calendar
description: Creates a dashboard with a Nivo calendar chart.
file: dashboards.ps1
version: 1.5.8
#>
New-PSUDashboard -Name 'Chart' -BaseUrl '/chart' -Framework 'UniversalDashboard:Latest' -Content {
    New-UDDashboard -Title 'chart' -Content {
        $Data = @()
        for($i = 365; $i -gt 0; $i--) {
            $Data += @{
                day = (Get-Date).AddDays($i * -1).ToString("yyyy-MM-dd")
                value = Get-Random
            }
        }

        $From = (Get-Date).AddDays(-365)
        $To = Get-Date

        New-UDNivoChart -Calendar -Data $Data -From $From -To $To -Height 500 -Width 1000 -MarginTop 50 -MarginRight 130 -MarginBottom 50 -MarginLeft 60
    }
} -Component @("UniversalDashboard.Charts:1.3.2")
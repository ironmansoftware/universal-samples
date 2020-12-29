<#
title: Nivo Bubble
description: Creates a dashboard with a Nivo bubble chart.
file: dashboards.ps1
version: 1.5.8
#>
New-PSUDashboard -Name 'Chart' -BaseUrl '/chart' -Framework 'UniversalDashboard:Latest' -Content {
    New-UDDashboard -Title 'chart' -Content {
        $TreeData = @{
            Name     = "root"
            children = @(
                @{
                    Name  = "first"
                    children = @(
                        @{
                            Name = "first-first"
                            Count = 7
                        }
                        @{
                            Name = "first-second"
                            Count = 8
                        }
                    )
                },
                @{
                    Name  = "second"
                    Count = 21
                }
            )
        }
        
        New-UDNivoChart -Bubble -Data $TreeData -Value "count" -Identity "name" -Height 500 -Width 800
    }
} -Component @("UniversalDashboard.Charts:1.3.2")
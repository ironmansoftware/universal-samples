<#
title: Nivo Heatmap
description: Creates a dashboard with a Nivo heatmap chart.
file: dashboards.ps1
version: 1.5.8
#>
New-PSUDashboard -Name 'Chart' -BaseUrl '/chart' -Framework 'UniversalDashboard:Latest' -Content {
    New-UDDashboard -Title 'chart' -Content {
        $Data = @(
            @{
                state = "idaho"
                cats = 72307
                dogs = 23429
                moose = 23423
                bears = 784
            }
            @{
                state = "wisconsin"
                cats = 2343342
                dogs = 3453623
                moose = 1
                bears = 23423
            }
            @{
                state = "montana"
                cats = 9234
                dogs = 3973457
                moose = 23472
                bears = 347303
            }
            @{
                state = "colorado"
                cats = 345973789
                dogs = 0237234
                moose = 2302
                bears = 2349772
            }
        )
        New-UDNivoChart -Heatmap -Data $Data -IndexBy 'state' -keys @('cats', 'dogs', 'moose', 'bears')  -Height 500 -Width 1000 -MarginTop 50 -MarginRight 130 -MarginBottom 50 -MarginLeft 60
    }
} -Component @("UniversalDashboard.Charts:1.3.2")
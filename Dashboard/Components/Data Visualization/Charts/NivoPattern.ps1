<#
title: Nivo Patterns
description: Creates a dashboard with a Nivo chart that has a pattern.
file: dashboards.ps1
version: 1.5.8
#>
New-PSUDashboard -Name 'Chart' -BaseUrl '/chart' -Framework 'UniversalDashboard:Latest' -Content {
    New-UDDashboard -Title 'chart' -Content {
        $Data = @(
            @{
                country = 'USA'
                burgers = (Get-Random -Minimum 10 -Maximum 100)
                fries = (Get-Random -Minimum 10 -Maximum 100)
                sandwich = (Get-Random -Minimum 10 -Maximum 100)
            }
            @{
                country = 'Germany'
                burgers = (Get-Random -Minimum 10 -Maximum 100)
                fries = (Get-Random -Minimum 10 -Maximum 100)
                sandwich = (Get-Random -Minimum 10 -Maximum 100)
            }
            @{
                country = 'Japan'
                burgers = (Get-Random -Minimum 10 -Maximum 100)
                fries = (Get-Random -Minimum 10 -Maximum 100)
                sandwich = (Get-Random -Minimum 10 -Maximum 100)
            }
        )
        
        $Pattern = New-UDNivoPattern -Dots -Id 'dots' -Background "inherit" -Color "#38bcb2" -Size 4 -Padding 1 -Stagger
        $Fill = New-UDNivoFill -ElementId "fries" -PatternId 'dots'
        
        New-UDNivoChart -Definitions $Pattern -Fill $Fill -Bar -Data $Data -Height 400 -Width 900 -Keys @('burgers', 'fries', 'sandwich')  -IndexBy 'country'
    }
} -Component @("UniversalDashboard.Charts:1.3.2")
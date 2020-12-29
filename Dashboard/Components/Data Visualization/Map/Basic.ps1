<#
title: Basic
description: Creates a dashboard with a map.
file: dashboards.ps1
version: 1.5.8
#>
New-PSUDashboard -Name 'Map' -BaseUrl '/map' -Framework 'UniversalDashboard:Latest' -Content {
    New-UDDashboard -Title 'Map' -Content {
        New-UDMap -Endpoint {
            New-UDMapRasterLayer -TileServer 'https://tiles.wmflabs.org/bw-mapnik/{z}/{x}/{y}.png' 
        } -Latitude 43.52107 -Longitude -114.31644 -Zoom 13 -Height '100vh'
    }
} -Component @("UniversalDashboard.Map:1.0")
<#
title: Marker Cluster
description: Creates a dashboard with a map that uses marker clusters.
file: dashboards.ps1
version: 1.5.8
#>
New-PSUDashboard -Name 'Map' -BaseUrl '/map' -Framework 'UniversalDashboard:Latest' -Content {
    New-UDDashboard -Title 'Map' -Content {
        New-UDMap -Endpoint {
            New-UDMapRasterLayer -TileServer 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png' 
            New-UDMapMarkerClusterLayer -Id 'cluster-layer' -Markers @(
                1..100 | ForEach-Object {
                    $Random = Get-Random -Minimum 0 -Maximum 100
                    $RandomLat = $Random + 400
                    New-UDMapMarker -Latitude "51.$RandomLat" -Longitude "-0.$Random"
                }
            )
        } -Latitude 51.505 -Longitude -0.09 -Zoom 13 -Height '100vh'
    }
} -Component @("UniversalDashboard.Map:1.0")
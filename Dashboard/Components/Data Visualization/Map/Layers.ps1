<#
title: Layers
description: Creates a dashboard with a map that has layers.
file: dashboards.ps1
version: 1.5.8
#>
New-PSUDashboard -Name 'Map' -BaseUrl '/map' -Framework 'UniversalDashboard:Latest' -Content {
    New-UDDashboard -Title 'Map' -Content {
        New-UDMap -Endpoint {
            New-UDMapLayerControl -Content {
                New-UDMapBaseLayer -Name 'Black and White' -Content {
                    New-UDMapRasterLayer -TileServer 'https://tiles.wmflabs.org/bw-mapnik/{z}/{x}/{y}.png' 
                } -Checked
                New-UDMapBaseLayer -Name 'Color' -Content {
                    New-UDMapRasterLayer -TileServer 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png' 
                }
                New-UDMapOverlay -Name 'Marker' -Content {
                    New-UDMapMarker -Latitude 51.505 -Longitude -0.09 
                } -Checked
                New-UDMapOverlay -Name 'Marker 2' -Content {
                    New-UDMapMarker -Latitude 51.555 -Longitude -0.00 
                } -Checked
            }
        } -Latitude 51.505 -Longitude -0.09 -Zoom 13 -Height '100vh'
    }
} -Component @("UniversalDashboard.Map:1.0")
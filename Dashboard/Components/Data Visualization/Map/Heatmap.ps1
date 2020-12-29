<#
title: Heatmap
description: Creates a dashboard with a map with a heatmap.
file: dashboards.ps1
version: 1.5.8
#>
New-PSUDashboard -Name 'Map' -BaseUrl '/map' -Framework 'UniversalDashboard:Latest' -Content {
    New-UDDashboard -Title 'Map' -Content {
        New-UDMap -Endpoint {
            New-UDMapRasterLayer -TileServer 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png' 
            New-UDMapHeatmapLayer -Points @(
                @(-37.9019339833, 175.3879181167, "625"),
                @(-37.90920365, 175.4053418167, "397"),
                @(-37.9057407667, 175.39478875, "540"),
                @(-37.9243174333, 175.4220341833, "112"),
                @(-37.8992012333, 175.3666729333, "815"),
                @(-37.9110874833, 175.4102195833, "360"),
                @(-37.9027096, 175.3913196333, "591"),
                @(-37.9011183833, 175.38410915, "655"),
                @(-37.9234701333, 175.4155696333, "181"),
                @(-37.90254175, 175.3926162167, "582"),
                @(-37.92450575, 175.4246711167, "90"),
                @(-37.9242924167, 175.4289432833, "47"),
                @(-37.8986079833, 175.3685293333, "801")
            )
        } -Height '100vh'
    }
} -Component @("UniversalDashboard.Map:1.0")
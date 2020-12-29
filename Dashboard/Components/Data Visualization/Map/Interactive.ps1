<#
title: Interactive
description: Creates a dashboard with an interactive map.
file: dashboards.ps1
version: 1.5.8
#>
New-PSUDashboard -Name 'Map' -BaseUrl '/map' -Framework 'UniversalDashboard:Latest' -Content {
    New-UDDashboard -Title 'Map' -Content {
        New-UDButton -Text 'Add Circle' -OnClick {
            Add-UDElement -ParentId 'Feature-Group' -Content {
                New-UDMapVectorLayer -Id 'Vectors' -Circle -Latitude 51.505 -Longitude -0.09 -Radius 500 -Color blue -FillColor blue -FillOpacity .5 
            }
        }
        
        New-UDButton -Text 'Remove Circle' -OnClick {
            Remove-UDElement -Id 'Vectors' 
        }
        
        New-UDButton -Text 'Add Marker' -OnClick {
            Add-UDElement -ParentId 'Feature-Group' -Content {
                New-UDMapMarker -Id 'marker' -Latitude 51.505 -Longitude -0.09 -Popup (
                    New-UDMapPopup -Content {
                        New-UDCard -Title "Test"
                    } -MaxWidth 600
                ) 
            }
        }
        
        New-UDButton -Text 'Remove Marker' -OnClick {
            Remove-UDElement -Id 'marker' 
        }
        
        New-UDButton -Text 'Add Layer' -OnClick {
            Add-UDElement -ParentId 'layercontrol' -Content {
                New-UDMapOverlay -Id 'MyNewLayer' -Name "MyNewLayer" -Content {
                    New-UDMapFeatureGroup -Id 'Feature-Group2' -Content {
                        1..100 | % {
                            New-UDMapVectorLayer -Id 'test' -Circle -Latitude "51.$_" -Longitude -0.09 -Radius 50 -Color red -FillColor blue -FillOpacity .5        
                        }
                    }
                } -Checked
                
            }
        }
        
        New-UDButton -Text 'Remove Layer' -OnClick {
            Remove-UDElement -Id 'MyNewLayer' 
        }
        
        New-UDButton -Text 'Move' -OnClick {
            Set-UDElement -Id 'map' -Attributes @{
                latitude = 51.550
                longitude = -0.09
                zoom = 10
            }
        }
        
        New-UDButton -Text "Add marker to cluster" -OnClick {
            Add-UDElement -ParentId 'cluster-layer' -Content {
                $Random = Get-Random -Minimum 0 -Maximum 100
                $RandomLat = $Random + 400
                New-UDMapMarker -Latitude "51.$RandomLat" -Longitude "-0.$Random"
            }
        }
        
        New-UDButton -Text "Add points to heatmap" -OnClick {
            Add-UDElement -ParentId 'heatmap' -Content {
                @(
                    @(51.505, -0.09, "625"),
                    @(51.505234, -0.0945654, "625"),
                    @(51.50645, -0.098768, "625"),
                    @(51.5056575, -0.0945654, "625"),
                    @(51.505955, -0.095675, "625"),
                    @(51.505575, -0.09657, "625"),
                    @(51.505345, -0.099876, "625"),
                    @(51.505768, -0.0923432, "625"),
                    @(51.505567, -0.02349, "625"),
                    @(51.50545654, -0.092342, "625"),
                    @(51.5045645, -0.09342, "625")
                )
            }
        }
        
        New-UDButton -Text "Clear heatmap" -OnClick {
            Clear-UDElement -Id 'heatmap'
        }
        
        New-UDMap -Id 'map' -Endpoint {
            New-UDMapLayerControl -Id 'layercontrol' -Content {
                New-UDMapBaseLayer -Name "Black and White" -Content {
                    New-UDMapRasterLayer -TileServer 'https://tiles.wmflabs.org/bw-mapnik/{z}/{x}/{y}.png' 
                } 
        
                New-UDMapBaseLayer -Name "Mapnik" -Content {
                    New-UDMapRasterLayer -TileServer 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png' 
                } 
        
                New-UDMapBaseLayer -Name "Bing" -Content {
                    New-UDMapRasterLayer -Bing -ApiKey 'asdf3rwf34afaw-sdfasdfa23feaw-23424dfsdfa' -Type Road
                } -Checked
        
                New-UDMapOverlay -Name "Markers" -Content {
                    New-UDMapFeatureGroup -Id 'Feature-Group' -Content {
                        New-UDMapMarker -Id 'marker' -Latitude 51.505 -Longitude -0.09
                    } -Popup (
                        New-UDMapPopup -Content {
                            New-UDCard -Title "Test123"
                        } -MaxWidth 600
                    )
                } -Checked
        
                New-UDMapOverlay -Name 'Vectors' -Content {
                    New-UDMapFeatureGroup -Id 'Vectors' -Content {
        
                    }
                } -Checked
        
                New-UDMapOverlay -Name "Heatmap" -Content {
                    New-UDMapHeatmapLayer -Id 'heatmap' -Points @() 
                } -Checked 
        
                New-UDMapOverlay -Name "Cluster" -Content {
                    New-UDMapMarkerClusterLayer -Id 'cluster-layer' -Markers @(
                        1..100 | ForEach-Object {
                            $Random = Get-Random -Minimum 0 -Maximum 100
                            $RandomLat = $Random + 400
                            New-UDMapMarker -Latitude "51.$RandomLat" -Longitude "-0.$Random"
                        }
                    )
                } -Checked
        
            }
            
        } -Latitude 51.505 -Longitude -0.09 -Zoom 13 -Height '100vh' -Animate
    }
} -Component @("UniversalDashboard.Map:1.0")
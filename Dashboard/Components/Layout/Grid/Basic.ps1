<#
title: Basic
description: Creates a dashboard with a basic grid.
file: dashboards.ps1
version: 1.5.8
#>
New-PSUDashboard -Name 'layout' -BaseUrl '/layout' -Framework 'UniversalDashboard:Latest' -Content {
    New-UDDashboard -Title 'layout' -Content {
        New-UDGrid -Container -Content {
            New-UDGrid -Item -ExtraSmallSize 12 -Content {
                New-UDPaper -Content { "xs-12" } -Elevation 2
            }
            New-UDGrid -Item -ExtraSmallSize 6 -Content {
                New-UDPaper -Content { "xs-6" } -Elevation 2
            }
            New-UDGrid -Item -ExtraSmallSize 6 -Content {
                New-UDPaper -Content { "xs-6" } -Elevation 2
            }
            New-UDGrid -Item -ExtraSmallSize 3 -Content {
                New-UDPaper -Content { "xs-3" } -Elevation 2
            }
            New-UDGrid -Item -ExtraSmallSize 3 -Content {
                New-UDPaper -Content { "xs-3" } -Elevation 2
            }
            New-UDGrid -Item -ExtraSmallSize 3 -Content {
                New-UDPaper -Content { "xs-3" } -Elevation 2
            }
            New-UDGrid -Item -ExtraSmallSize 3 -Content {
                New-UDPaper -Content { "xs-3" } -Elevation 2
            }
        }
    }
}
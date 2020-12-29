<#
title: Spacing
description: Creates a dashboard with a grid that has customizable spacing.
file: dashboards.ps1
version: 1.5.8
#>
New-PSUDashboard -Name 'layout' -BaseUrl '/layout' -Framework 'UniversalDashboard:Latest' -Content {
    New-UDDashboard -Title 'layout' -Content {
        New-UDDynamic -Id 'spacingGrid' -Content {
            $Spacing = (Get-UDElement -Id 'spacingSelect').value
        
            New-UDGrid -Spacing $Spacing -Container -Content {
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
        
        New-UDSelect -Id 'spacingSelect' -Label Spacing -Option {
            for($i = 0; $i -lt 10; $i++)
            {
                New-UDSelectOption -Name $i -Value $i
            }
        } -OnChange { Sync-UDElement -Id 'spacingGrid' } -DefaultValue 3
    }
}
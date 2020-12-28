<#
title: Retro Dashboard
description: Creates a retro themed dashboard for monitoring the local machine.
file: dashboards.ps1
version: 1.5.8
#>
New-PSUDashboard -Name 'Retro' -BaseUrl '/' -Component 'UniversalDashboard.Charts:1.3.1' -Framework 'UniversalDashboard:Latest' -Content {
    
    $Green =  '#4bdd35'
    
    $Theme = @{
        palette = @{
            primary = @{
                main = $Green
            }
            background = @{
                default = 'black'
                paper = 'black'
            }
            text = @{
                primary = $Green
            }
        }
        typography = @{
            fontFamily = "Consolas"
        }
    }
    
    $Pages = @()
    $Pages += New-UDPage -Name 'Hacker Dash' -Content {
    
        New-UDRow -Columns {
            New-UDColumn -LargeSize 4 -Content {
                    New-UDCard -Title 'Top CPU Usage Processes' -Content {
                        New-UDElement -Tag 'pre' -Content {
                            (Get-Process | Sort-Object -Property Cpu -Descending | Select-Object -First 10 | Out-String)
                        }
                    } 
                
            }
            New-UDColumn -LargeSize 4 -Content {
                $Data = Get-CimInstance -Class CIM_LogicalDisk | Select-Object @{Name="Size";Expression={$_.size/1gb}}, @{Name="FreeSpace";Expression={$_.freespace/1gb}}, @{Name="Free (%)";Expression={"{0,6:P0}" -f(($_.freespace/1gb) / ($_.size/1gb))}}, DeviceID, DriveType | Where-Object DriveType -EQ '3'
            
                $SizeDs = New-UDChartJSDataset -DataProperty Size -Label Size -BackgroundColor $Green
                $MemoryDs = New-UDChartJSDataset -DataProperty FreeSpace -Label 'Free Space' -BackgroundColor $Green
                
    
                $Options = @{
                    Type = 'bar'
                    Data = $Data
                    Dataset = @($SizeDs, $MemoryDs)
                    LabelProperty = "DeviceId"
                }
                
                New-UDChartJS @Options
            }
            New-UDColumn -LargeSize 4 -Content {
                New-UDChartJSMonitor -LoadData {
                     Get-CimInstance Win32_Processor | Measure-Object -Property LoadPercentage -Average | Select -Expand Average | Out-UDChartJSMonitorData
                } -Labels "CPU" -ChartBackgroundColor 'black' -ChartBorderColor $Green -RefreshInterval 1
            }
        }
    
        New-UDRow -Columns {
            New-UDColumn -LargeSize 4 -Content {
                    New-UDCard -Title 'Top Memory Usage Processes' -Content {
                        New-UDElement -Tag 'pre' -Content {
                            (Get-Process | Sort-Object -Property WorkingSet64 -Descending | Select-Object -First 10 | Out-String)
                        }
                    } 
            }
            New-UDColumn -LargeSize 4 -Content {
                New-UDChartJSMonitor -LoadData {
                     (Get-NetAdapterStatistics -Name 'Wi-Fi').SentBytes | Out-UDChartJSMonitorData
                } -Labels "Send Bytes" -ChartBackgroundColor 'black' -ChartBorderColor $Green -RefreshInterval 1
            }
            New-UDColumn -LargeSize 4 -Content {
                New-UDChartJSMonitor -LoadData {
                     (Get-NetAdapterStatistics -Name 'Wi-Fi').ReceivedBytes | Out-UDChartJSMonitorData
                } -Labels "Received Bytes" -ChartBackgroundColor 'black' -ChartBorderColor $Green -RefreshInterval 1
            }
        }
    
    
    
    } 
    
    New-UDDashboard -Title "Hello, World!" -Pages $Pages -Theme $Theme
}

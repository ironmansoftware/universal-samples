<#
title: Server-Side Table
description: Creates a dashboard with a table that processes on the server.
file: dashboards.ps1
version: 1.5.8
#>
New-PSUDashboard -Name 'SQL' -BaseUrl "/" -Framework 'UniversalDashboard:Latest' -Content {
    New-UDDashboard -Title 'SQL' -Content {
        New-UDTable -Title 'Shows' -LoadData {
            $TableData = ConvertFrom-Json $Body
        
            $OrderBy = $TableData.orderBy.field
            if ($OrderBy -eq $null)
            {
                $OrderBy = "name"
            }
        
            $OrderDirection = $TableData.OrderDirection
            if ($OrderDirection -eq $null)
            {
                $OrderDirection = 'asc'
            }
        
            $Where = ""
            if ($TableData.Filters) 
            {
                $Where = "WHERE "
        
                foreach($filter in $TableData.Filters)
                {
                    $Where += $filter.column.field + " LIKE '%" + $filter.value + "%' AND "
                }
        
                $Where += " 1 = 1"
            }
        
            $PageSize = $TableData.PageSize 
            # Calculate the number of rows to skip
            $Offset = $TableData.Page * $PageSize
            $Count = Invoke-DbaQuery -SqlInstance localhost\MSSQLSERVER -Database 'podcasts' -Query "SELECT COUNT(*) as count FROM shows $Where"
        
            $Data = Invoke-DbaQuery -SqlInstance localhost\MSSQLSERVER -Database 'podcasts' -Query "SELECT * FROM shows $Where ORDER BY $orderBy $orderdirection OFFSET $Offset ROWS FETCH NEXT $PageSize ROWS ONLY" | ForEach-Object {
                @{ 
                    name = $_.name 
                    host = $_.host
                }
            } 
            $Data | Out-UDTableData -Page $TableData.page -TotalCount $Count.Count -Properties $TableData.properties
        } -Columns @(
            New-UDTableColumn -Property 'name' -Sort $true -Filter $true
            New-UDTableColumn -Property 'host' -Sort $true -Filter $true
        ) -Sort -Filter
    }
}
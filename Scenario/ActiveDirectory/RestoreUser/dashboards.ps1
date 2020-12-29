New-PSUDashboard -Name 'Restore User' -BaseUrl '/' -Framework 'UniversalDashboard:Latest' -Content {
    New-UDDashboard -Title 'Restore User' -Content {
        $Columns = @(
            New-UDTableColumn -Property Name -Title "Name"
            New-UDTableColumn -Property DistinguishedName -Title "Distinguished Name"
            New-UDTableColumn -Property Restore -Title Restore -Render {
                $Item = $EventData
                New-UDButton -Id "btn$($Item.ObjectGuid)" -Text "Restore" -OnClick { 
                    Show-UDToast -Message "Restoring user $($Item.Name)" -Duration 5000

                    Invoke-UAScript -Name 'Restore User.ps1' -DistinguishedName $Item.DistinguishedName | Tee-Object -Variable job | Wait-UAJob

                    $Job = Get-UAJob -Id $Job.Id 
                    if ($Job.Status -eq 'Completed')
                    {
                        Show-UDToast -Message "Restored user $($Item.Name)" -Duration 5000
                    }
                    else 
                    {
                        $Output = Get-UAJobOutput -JobId $Job.Id | Select-Object -Expand Message
                        Show-UDToast -Message "Failed to restore user. $($Output -join "`n")" -BackgroundColor red -MessageColor white -Duration 5000
                    }
                }
            }
        )

        $DeletedUsers = Get-ADObject -Filter 'IsDeleted -eq $true -and objectClass -eq "user"' -IncludeDeletedObjects | ForEach-Object {
            @{
                distinguishedname = $_.DistinguishedName
                name = $_.Name
            }
        }
        New-UDTable -Data $DeletedUsers -Columns $Columns
    }
}
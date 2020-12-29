New-PSUScript -Name 'Restore User.ps1' -ScriptBlock {
    param($DistinguishedName)

    Restore-ADObject -Identity $DistinguishedName
}
<#
title: Reset Password
description: Resets an an account's password.
file: scripts.ps1
version: 1.5.8
#>

# This script requires access to Active Directory.
New-PSUScript -Name 'Reset Password' -ScriptBlock {
    param(
        [String]$Identity,
        [String]$Password,
        [Switch]$Unlock,
        [Switch]$ChangePasswordOnLogon
    )
    
    $SecurePassword = ConvertTo-SecureString $Password -AsPlainText -Force
    
    Set-ADAccountPassword -Identity $Identity -NewPassword $SecurePassword -Reset
    
    if ($Unlock)
    {
        Unlock-ADAccount –Identity $Identity
    }
    
    if ($ChangePasswordOnLogon)
    {
        Set-ADUser –Identity $Identity -ChangePasswordAtLogon $true
    }
}
<#
title: List Locked Accounts
description: Creates a script that lists locked Active Directory accounts.
file: scripts.ps1
version: 1.5.8
#>
New-PSUScript -Name 'LockedAccounts' -ScriptBlock {
    Search-ADAccount -LockedOut
}
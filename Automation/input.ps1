<#
title: Input
description: Demonstrates input capabilities of PowerShell Universal.
file: scripts.ps1
#>
New-PSUScript -Name 'Input' -ScriptBlock {
    param(
        $Test,
        [DateTime]$Time, 
        [int]$Number,
        [PSCredential]$Credential,
        [System.ConsoleColor]$Color
    )

    $Test
    $Time 
    $Number 
    $Credential 
    $Color
}
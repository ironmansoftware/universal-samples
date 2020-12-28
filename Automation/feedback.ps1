<#
title: Feedback
description: Demonstrates feedback capabilities of PowerShell Universal.
file: scripts.ps1
#>
New-PSUScript -Name 'Feedback' -ScriptBlock {
    Read-Host -Prompt "What's your name?"
}
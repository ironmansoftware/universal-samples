<#
title: Param Block
description: Accept variables via URLs with a param block.
file: endpoints.ps1
#>

New-PSUEndpoint -Url '/user/:name' -Endpoint {
    param([Parameter(Mandatory)]$Name, $Role = "Default")
}
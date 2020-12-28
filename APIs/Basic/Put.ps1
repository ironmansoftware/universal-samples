<#
title: Put
description: PUT data to an API
file: endpoints.ps1
#>
New-PSUEndpoint -Method "PUT" -Url "/put" -Endpoint {
    $Body
}
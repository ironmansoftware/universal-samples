<#
title: Delete
description: Delete data from an API
file: endpoints.ps1
#>
New-PSUEndpoint -Method "DELETE" -Url "/user" -Endpoint {
    "Hello, world"
}
<#
title: Get
description: Return data from an API
file: endpoints.ps1
#>
New-PSUEndpoint -Method "GET" -Url "/get" -Endpoint {
    "Hello, world"
}
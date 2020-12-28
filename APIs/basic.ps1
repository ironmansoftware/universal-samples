<#
title: Basic
description: Creates a basic endpoint that returns some data.
file: endpoints.ps1
#>
New-PSUEndpoint -Method "GET" -Url "/get" -Endpoint {
    "Hello, world"
}
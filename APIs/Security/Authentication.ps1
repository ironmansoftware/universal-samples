<#
title: Authentication
description: Creates an API the requires authentication.
file: dashboards.ps1
version: 1.5.8
#>
New-PSUEndpoint -Url '/endpoint' -Method 'GET' -Endpoint {
    "Hello, world!"
} -Authentication
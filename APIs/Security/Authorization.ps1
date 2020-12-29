<#
title: Authorization
description: Creates an API the requires authentication and the Administrator role.
file: dashboards.ps1
version: 1.5.8
#>
New-PSUEndpoint -Url '/endpoint' -Method 'GET' -Endpoint {
    "Hello, world!"
} -Authentication -Role "Administrator"
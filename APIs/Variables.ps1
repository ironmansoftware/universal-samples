<#
title: URL Variables
description: Accept variables via URLs.
file: endpoints.ps1
#>

# This endpoint accepts values via the route. Try: Invoke-RestMethod http://localhost:5000/user/123
New-PSUEndpoint -Url '/user/:id' -Method 'GET' -Endpoint {
    Get-User -Id $Id
 }
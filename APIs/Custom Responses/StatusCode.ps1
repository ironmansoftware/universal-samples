<#
title: Status Code
description: Return a custom status code.
file: endpoints.ps1
#>
New-PSUEndpoint -Url '/file' -Method Get -Endpoint {
    New-PSUApiResponse -StatusCode 410
}
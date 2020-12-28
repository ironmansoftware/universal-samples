<#
title: Send Binary Data
description: Send binary data using New-PSUApiResponse
file: endpoints.ps1
#>

New-PSUEndpoint -Url '/image' -Endpoint {
    $ImageData = [IO.File]::ReadAllBytes("image.jpeg")
    New-PSUApiResponse -ContentType 'image/jpg' -Data $ImageData
}
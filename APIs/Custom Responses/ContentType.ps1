<#
title: Content Type
description: Return a custom content type.
file: endpoints.ps1
#>
New-PSUEndpoint -Url '/file' -Method Get -Endpoint {
    New-PSUApiResponse -Body "<xml><node>1</node><node2>2</node2></xml>" -ContentType 'text/xml'
}
<#
title: Post
description: Post Data to an API
file: endpoints.ps1
#>
New-PSUEndpoint -Method "POST" -Url "/post" -Endpoint {
    $Body
}
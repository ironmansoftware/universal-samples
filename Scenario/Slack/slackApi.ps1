<#
title: Send Message
description: Sends a message to Slack.
file: endpoints.ps1
version: 1.5.8
#>
New-PSUEndpoint -Url "/slack" -Method POST -Endpoint {

    $Body = @{
        text = "Hello"
    } | ConvertTo-Json

    # Replace the URI with your webhook URL.
    Invoke-RestMethod -Uri 'https://hooks.slack.com/services/0000000000/00000000/00000000000000000' -Body $Body -Method POST
}
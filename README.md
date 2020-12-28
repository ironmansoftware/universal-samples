# PowerShell Universal Samples

This repository contains samples for PowerShell Universal.

# Licensing

Samples are licensed under MIT. 

# Contributing

We accept pull requests to this repository. 

## Single File Samples

Single file samples should be stored within the correct folder as a `.ps1` file. You should include a comment at the top within information about your sample. It should at least contain the `title`, `description`, and `author`. The comment should be in YAML syntax. 

```powershell
<#
title: A title for your sample
description: A description of your sample
file: Includes the file to update. 
version: The minium version number of Universal required for this sample
#>
```

The rest of your sample can just be PowerShell. 

```powershell
<#
title: A basic endpoint
description: A cool endpoint that does stuff.
file: endpoints.ps1
version: 1.5.0
file: 
#>
New-PSUEndpoint -Method GET -Url /get -Endpoint {
    "Hello, world"
}
```
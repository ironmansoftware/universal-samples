# Ironman Software Samples

This repository contains samples for Ironman Software products. 

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
author: Your GitHub account 
tags: an,array,of,tags
parameters: an,array,of,parameters
data: 
    - AdditionalData: ToInclude
#>
```

The rest of your sample can just be PowerShell. 

```powershell
<#
title: A basic endpoint
description: A cool endpoint that does stuff.
author: adamdriscoll
tags: universal,api
data: 
    - PowerShellUniversal: '^1.5.0'
#>
New-PSUEndpoint -Method GET -Url /get -Endpoint {
    "Hello, world"
}
```
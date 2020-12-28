# PowerShell Universal Samples

This repository contains samples for PowerShell Universal.

# Licensing

Samples are licensed under MIT. 

# Contributing

We accept pull requests to this repository. 

## PowerShell Universal Extension

Samples that are added to the repository will automatically show up in the [PowerShell Universal VS Code extension](https://marketplace.visualstudio.com/items?itemName=ironmansoftware.powershell-universal). 

## Single File Samples

Single file samples should be stored within the correct folder as a `.ps1` file. You should include a comment at the top within information about your sample. It should at least contain the `title`, `description`, `version`, and `file`. The comment should be in YAML syntax. 

```powershell
<#
title: A title for your sample
description: A description of your sample
file: Includes the file to update. 
version: The minium version number of Universal required for this sample
#>
```

The rest of your sample can just be PowerShell. The PowerShell script will be inserted into the appropriate file when the sample is used.

```powershell
<#
title: A basic endpoint
description: A cool endpoint that does stuff.
file: endpoints.ps1
version: 1.5.8
#>
New-PSUEndpoint -Method GET -Url /get -Endpoint {
    "Hello, world"
}
```

## Multi-File Samples

Multi-file samples can be included in a directory with a `manifest.yml` file. The manifest file should include all the same information as the single file sample; except the `file`.

```yml
title: Image Processing Dashboard
description: A dashboard that processes an image
version: 1.5.8
```

You can then include multiple files in the folder. The files should match the configuration files you wish to update. The PowerShell script will be inserted into existing files.
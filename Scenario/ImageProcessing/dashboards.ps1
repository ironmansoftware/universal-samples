New-PSUDashboard -Name 'Convert' -BaseUrl '/' -Framework 'UniversalDashboard:Latest' -Content {
    New-UDDashboard -Title 'Convert' -Content {
        New-UDForm -Content {
            New-UDUpload -Id 'image' -Text 'Image to Convert'
        } -OnSubmit {
            $bytes = [System.Convert]::FromBase64String($EventData.image.Data)
    
            $Bitmap = [System.Drawing.Image]::FromStream([System.IO.MemoryStream]::new($bytes))
            $Bitmap.Save("C:\images\$($EventData.Image.Name)".Replace("jpeg", "png"), 'PNG')
    
            New-UDImage -Url "/images/$($EventData.Image.Name.Replace('jpeg', 'png'))"
        }
    }
}
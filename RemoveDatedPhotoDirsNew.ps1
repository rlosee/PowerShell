<#
Another attempt to find folders named by dates and moves the 
photos up to the year level.
#>
$sourcefolder = "C:\Users\Public\Pictures\!!! Bob's Images\2009"

$files = Get-ChildItem -Recurse $sourcefolder | where {($_.PSIScontainer -eq $true)  -and  ($_.Name -match ".*\d{4}[\s_]\d{2}[\s_]\d{2}.*")}

foreach ($file in $files)
	{
        $sourceFiles = $sourcefolder + "\" + $file.Name + "\*.*"
        $destinationFolder = Split-Path -Parent $file.FullName

        Write-Host ("sourceFolder:      " + $file.Name)
   		Write-Host ("sourceFiles:       " + $sourceFiles)
        Write-Host ("destinationFolder: " + $destinationFolder) 

		Move-Item -Path $sourceFiles -Destination $destinationFolder
	}

<# A dude wrote this
$sourcefolder = "C:\Users\Public\Pictures\!!!Bob's Images\2010"

$files = Get-ChildItem -Recurse $sourcefolder | where {$_.PSIScontainer -eq $false}
foreach ($file in $files)
	{
		$destinationFolder = Split-Path -Parent $file.Directory.FullName
		move-item $file.FullName $destinationFolder
	}
#>

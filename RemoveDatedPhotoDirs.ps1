<#
This powershell script finds folders named by dates and moves the 
photos up to the year level.
#>
Write-Host "Starting Script"

$picsPath = "C:\Users\Public\Pictures\!!!Bob's Images"

$dateDirs = Get-ChildItem -Directory -Recurse `
    -Path $picsPath `
    | Where{$_ -match "\d{4}_\d{2}_\d{2}"} 

foreach ($dir in $dateDirs)
    { 
    $yearDir = $dir.Name.Substring(0,4)
    $fromFilePath = $picsPath + "\" + $yearDir + "\" + $dir + "\*.*"
    $toFilePath   = $picsPath + "\" + $yearDir
    
    Write-Host ($fromFilePath + "  TO  " + $toFilePath)
    Move-Item -Path $fromFilePath -Destination $toFilePath

    #break
    }

<# Another dude did this:
$sourcefolder = "path to folder"

$files = Get-ChildItem -Recurse $sourcefolder | where {$_.PSIScontainer -eq $false}
foreach ($file in $files)
	{
		$destinationFolder = Split-Path -Parent $file.Directory.FullName
		move-item $file.FullName $destinationFolder
	}
#>
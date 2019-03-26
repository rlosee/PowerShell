# Get the files which should be moved, without folders
$sourcePath = 'C:\Users\Robert\Documents\BID\unSorted' 
# Target Filder where files should be moved to. The script will automatically create a folder.
$targetPath = 'C:\Users\Robert\Documents\BID\bookmarked_sorted'

$files      = Get-ChildItem $sourcePath -Recurse | where {!$_.PsIsContainer}
$fileCnt    = $files.Count
 
# List Files which will be moved
#$files

 
<#[regex]$rxSD = "(.*\<value\>)(?<sdate>\d\d\d\d-\d\d-\d\d)( 12:00:00.*)"
    $m = $rxSD.Match($content[16])    # [16] is the start date line
    $sdate = $m.Groups["sdate"].Value
#> 

$onFile = 0
foreach ($file in $files)
{
  $filename = [System.IO.Path]::GetFileNameWithoutExtension($file)
  $LastChar = $filename.Substring($filename.get_Length()-1)
  
  
  # Out FileName, year and month
  #$file.Name
  $lastChar + '  ' + $onFile + ' of ' + $fileCnt 
  $onFile += 1
 
  # Set Directory Path
  $Directory = $targetPath + "\" + $LastChar
  
  # Create directory if it doesn't exsist
  if (!(Test-Path $Directory))
  {
    New-Item $directory -type directory
  }
 
  # Move File to new location
  $file |  Move-Item -Destination $Directory
}

"=========== Finished ==========="
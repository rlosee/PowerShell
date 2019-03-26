# Get the files which should be moved, without folders
$files      = Get-ChildItem 'C:\Users\Robert\Documents\BID\Sorted' -Recurse | where {!$_.PsIsContainer}
 
# List Files which will be moved
#$files
 
# Target Filder where files should be moved to. The script will automatically create a folder for the year and month.
$targetPath = 'C:\Users\Robert\Documents\BID\bookmarked_sorted'
 
foreach ($file in $files)
{
  $1stChar = $file.Name.Substring(0,1)
  
  # Out FileName, year and month
  $file.Name
 
  # Set Directory Path
  $Directory = $targetPath + "\" + $1stChar
  # Create directory if it doesn't exsist
  if (!(Test-Path $Directory))
  {
    New-Item $directory -type directory
  }
 
  # Move File to new location
  $file | Move-Item -Destination $Directory
}

"=========== Finished ==========="
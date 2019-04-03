$readPath = "C:\Users\Public\Pictures\!!! Images Timeline\2019\2019 Maui\RENAMED\RENAMED2\RENAMED3"
Set-Location $path

Clear-Host
Write-Host ("Starting Renaming")

$readPathFiles = $readPath + "\*.jpg"

$seqNum = 1
$CurrentLWD = ""

$writePath = $readPath + '\RENAMED4\'
If(!(test-path $writePath))
{
      New-Item -ItemType Directory -Force -Path $writePath
}

#Get-ChildItem $readPath -File | Sort-Object LastWriteTime |
Get-ChildItem $readPathFiles -File | Sort-Object -Property LastWriteTime |
Foreach-Object {
   $thisLWD = $_.LastWriteTime.ToString('yyyy-MM-dd')
   $prefixName = $_.Directory.Name.Replace(" ", "_")
   
   # change seq # when date changes
   if ($currentLWD -ne $thisLWD) {
      $currentLWD = $thisLWD
      $seqNum = 1
   } else {
      $seqNum += 1
   }

   $returnCode = $_.Name -match "(?<name>.*_)(?<Date>\d{4}-\d\d-\d\d_)(?<oldSeqNum>\d{2,4})(?<suffix>_.*)"
   $NewName = $writePath + $Matches.name + $thisLWD + '_' + $seqNum.ToString('000') + $Matches.suffix
   Write-Host ("Old: " + $_ + "     New: " + $newName)  
   Move-Item -Path $_.FullName -Destination $NewName #-WhatIf 
}

Write-Host ("All Done")
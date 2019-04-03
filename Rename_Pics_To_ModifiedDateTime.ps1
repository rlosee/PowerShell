$path = "C:\Users\Public\Pictures\!!! Images Timeline\2019\2019 Maui"
Set-Location $path

Clear-Host
Write-Host ("Starting Renaming")

$confirmation = Read-Host "Have you adjusted for time zone?"
if ($confirmation -ne 'y') {
   write-host ("Use BulkFileChanger")
   return
}

$path = $path + "\*.jpg"

$seqNum = 1
$CurrentLWD = ""

#Get-ChildItem $path -File | Sort-Object LastWriteTime |
Get-ChildItem $path -File | Sort-Object -Property LastWriteTime |
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
   
   if ($_.Name.Substring(0,4).Equals("DSC_")) {
      $newName = $prefixName+"_"+$_.LastWriteTime.ToString('yyyy-MM-dd')+'_'+$seqNum.ToString('###').PadLeft(3,'0')+'_Nk'+$_.Extension 
      #$newName = $_.LastWriteTime.ToString('yyyy-MM-dd')+'_'+$seqNum.ToString('###')+$_.Extension 
   } ElseIf (($_.Name.Substring(0,4).Equals("IMG_")) -or ($_.Name.Substring(0,6).Equals("MVIMG_"))) {
      $newName = $prefixName+"_"+$_.LastWriteTime.ToString('yyyy-MM-dd')+'_'+$seqNum.ToString('###').PadLeft(3,'0')+'_Px2'+$_.Extension   
   } Else {return} # it's tempting to use "continue" but this breaks out of loop

   Write-Host ("Old: " + $_ + "     New: " + $newName)   
   Rename-Item  $_ -NewName $newName #-WhatIf
}

Write-Host ("All Done")
#Get-ChildItem | Rename-Item -NewName {$_.LastWriteTime.ToString('yyyy-MM-dd')+$_.Extension }
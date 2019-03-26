$path = "C:\Users\Public\Pictures\!!! Images Timeline\2019\2019 Maui"

Set-Location $path

$seqNum = 1
$CurrentLWD = ""

#Get-ChildItem $path -File | Sort-Object LastWriteTime |
Get-ChildItem $path -File | Sort-Object  |
Foreach-Object {
   $thisLWD = $_.LastWriteTime.ToString('yyyy-MM-dd')
   
   # change seq # when date changes
   If ($currentLWD -ne $thisLWD) {
      $currentLWD = $thisLWD
      $seqNum = 1
   } else {
      $seqNum += 1
   }
   
   $newName = $_.LastWriteTime.ToString('yyyy-MM-dd')+'_'+$seqNum.ToString('###').PadLeft(3,'0')+$_.Extension 
   #$newName = $_.LastWriteTime.ToString('yyyy-MM-dd')+'_'+$seqNum.ToString('###')+$_.Extension 
   Write-Host ("Old: " + $_ + "     New: " + $newName)
   
   Rename-Item  $_ -NewName $newName #-WhatIf
}
#Get-ChildItem | Rename-Item -NewName {$_.LastWriteTime.ToString('yyyy-MM-dd')+$_.Extension }
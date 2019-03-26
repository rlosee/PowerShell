$path = 'C:\Users\Robert\Documents\Bulk Image Downloader'
#Get-ChildItem $path -Filter *.gif -recurse |?{$_.PSIsContainer -eq $false -and $_.length -lt 500}|?{Remove-Item $_.fullname -WhatIf}

$Dir = "F:\stuff"
$SizeMin = 50 #MB or KB
#Get-ChildItem -Path $path -Filter *.gif -Recurse | Where { $_.Attributes -ne "Directory" -and $_.Length / 1MB -lt $SizeMin } | Remove-Item -Force
Get-ChildItem -Path $path -Filter *.gif -Recurse | Where { $_.Attributes -ne "Directory" -and $_.Length / 1KB -lt $SizeMin } | Remove-Item -WhatIf
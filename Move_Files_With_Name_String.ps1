# move file based on name
Clear-Host
#New-Item  -ItemType "directory" -Name "Taissia_Culled"
Get-ChildItem -Filter '*Taissia*.*' -File |
   Move-Item -Destination ".\Taissia_Culled"
<# find biggest files in directory and subdirectories #>

Set-location -Path "C:\Users\Public\Pictures\PICTURE FRAME"

Get-ChildItem -re -in * |
  ?{ -not $_.PSIsContainer } |
  sort Length -descending |
  select -first 10
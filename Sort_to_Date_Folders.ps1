#$do_this_folder = 'C:\Users\Public\Pictures\!!! Images Timeline\2018\2018 Yellowstone'
$do_this_folder = 'O:\SortMe'

Get-ChildItem -Path $do_this_folder -Recurse | ForEach-Object -Process {
  #$ct  = $_.CreationTime.ToShortDateString()
  $lwt = $_.LastWriteTime.ToShortDateString()
  $new_folder_name = Get-Date -Date $lwt -Format yyyy.MM.dd
  $des_path = $do_this_folder + "\$new_folder_name"
  #if ($ct -ne $lwt) {
  #  Write-Host $ct ' ' $lwt
  #}

  if (test-path $des_path) {
    Move-Item $_.fullname $des_path
  } else {
    New-Item -ItemType directory -Path $des_path
    Move-Item $_.fullname $des_path
  }
}
#Get-ChildItem . -file -Filter "EP*" | Rename-Item -newname { $_.name -replace "^.*\]\%20", ""} #-WhatIf
#Get-ChildItem . -file -Filter "EP*" | Rename-Item -newname { $_.name -replace "%20", "_"} #-WhatIf
Get-ChildItem . -file | Rename-Item -newname { $_.name -replace "%20", "_"} #-WhatIf
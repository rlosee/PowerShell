# Find Web Links on Page
$WR = Invoke-WebRequest -URI 'http://google.com'
$WR.ParsedHtml.getElementsByTagName("span") | % textcontent
#$WR.AllElements | where {$_.innerhtml -like "*=*"} | Sort { $_.InnerHtml.Length } #| Select InnerText -First 5

# Read in HTML file'
$html = New-Object -ComObject "HTMLFile"
$html.IHTMLDocument2_Write($(Get-Content 'C:\Users\587065\OneDrive\Tabs Outliner.html' -raw))
$html.all.tags("p") | % innertext 

$html2json = Get-Content 'C:\Users\587065\OneDrive\Tabs Outliner.html' | ConvertTo-Json -Depth 5

$html2json | Out-File "C:\Users\587065\Desktop\JSONedTabsOutliner.txt"

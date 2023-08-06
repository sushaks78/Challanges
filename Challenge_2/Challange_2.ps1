$outputPath = "C:\test"
New-Item -Path $outputPath -ItemType Directory -ErrorAction Ignore
$vmname= Get-ComputerInfo | select csname
$Proxy=New-object System.Net.WebProxy
$WebSession=new-object Microsoft.PowerShell.Commands.WebRequestSession
$WebSession.Proxy=$Proxy
$challange_2=Invoke-RestMethod -Headers @{"Metadata"="true"} -Method GET -Proxy $Null -Uri "http://169.254.169.254/metadata/instance?api-version=2021-01-01" -WebSession $WebSession
$challange_json=$challange_2 | ConvertTo-Json -Depth 6
$challange_json | Out-File c:\test\metadata.json -Append

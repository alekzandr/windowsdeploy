cd $env:USERPROFILE\Desktop\windowsdeploy

Copy-Item -Force -Recurse -Verbose .\sysmon -Destination 'C:\Program Files'

Copy-Item -Force -Recurse -Verbose .\winlogbeat -Destination 'C:\Program Files'

cd -Path 'C:\Program Files\sysmon'

.\sysmon64.exe -accepteula -i 'C:\Program Files\sysmon\sysmonconfig-export.xml'

cd 'C:\Program Files\winlogbeat'

.\install-service-winlogbeat.ps1

Start-Service winlogbeat
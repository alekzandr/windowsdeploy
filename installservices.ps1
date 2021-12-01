#Download winlogbeats from Elastic and uncompress it.
$ProgressPreference = 'SilentlyContinue'
wget https://artifacts.elastic.co/downloads/beats/winlogbeat/winlogbeat-7.15.2-windows-x86_64.zip -UseBasicParsing -OutFile $env:USERPROFILE\Downloads\winlogbeat-7.15.2-windows-x86_64.zip
Expand-Archive -Path $env:USERPROFILE\Downloads\winlogbeat-7.15.2-windows-x86_64.zip -DestinationPath $env:USERPROFILE\Downloads\winlogbeat-7.15.2-windows-x86_64

# Copy the Elastic Winlogbeat executable into our file location
# then move sysmon and Winlogbeat into C:\Program Files
Copy-Item -Force -Verbose $env:USERPROFILE\Downloads\winlogbeat-7.15.2-windows-x86_64\winlogbeat-7.15.2-windows-x86_64\winlogbeat.exe -Destination .\winlogbeat\winlogbeat.exe
Copy-Item -Force -Recurse -Verbose .\sysmon -Destination 'C:\Program Files'
Copy-Item -Force -Recurse -Verbose .\winlogbeat -Destination 'C:\Program Files'

# Run and install sysmon
& "C:\Program Files\sysmon\sysmon64.exe" -accepteula -i 'C:\Program Files\sysmon\sysmonconfig-export.xml'

# Install winlogbeat service
& "C:\Program Files\winlogbeat\install-service-winlogbeat.ps1"

#Wait for install-service-winlogbeat.ps1 to finish
start-sleep -Seconds 5

#start Winlogbeat
Start-Service winlogbeat

#Print Statuses
get-service winlogbeat
get-service sysmon64

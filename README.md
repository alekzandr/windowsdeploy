# windowsdeploy
A set of install scripts and configurations for Elastic Winglogbeat.

Winlogbeats download location:
https://artifacts.elastic.co/downloads/beats/winlogbeat/winlogbeat-7.13.3-windows-x86_64.zip

1. Copy windowsdeploy folder to desktop
2. Add elastic server and port to windowsdeploy/winlogbeat/winlogbeat.yml
	- example: hosts: ["192.168.1.10:9200"]
3. Download winlogbeats.exe and move the executable to windowsdeploy/winlogbeat/
3. Run installservices.ps1 as an administrator. 
4. Confirm services were installed correctly. 

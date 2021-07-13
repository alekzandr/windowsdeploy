# windowsdepoly
A set of install scripts and configurations for Elastic Winglogbeats


1. Copy windowsdeploy folder to desktop
2. Add logstash server and port to windowsdeploy/winlogbeat/winlogbeat.yml
	- example: hosts: ["192.168.1.10:5044"]
3. Run installservices.ps1 as an administrator. 
4. Confirm services were installed correctly. 

# windowsdeploy
A set of install scripts and configurations for Elastic Winglogbeat.

1. Download the windowsdeploy repo
2. Unzip windowsdeply on target machine.
3. Run windowsdeploy/installservices.ps1 as an administrator. 
4. Confirm services were installed correctly. 
5. Create winlogbeat* index pattern in Kibana.

# Starting Services
If you need to start services on machines within the domain, inside the ```/scripts/``` folder is a PowerShell script to start the WinlogBeats and Sysmon services.

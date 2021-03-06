Get-ADComputer -Filter * | Select-Object -ExpandProperty Name | out-file computers.txt
$computers = gc computers.txt

$script_block = {
    param ($computer_name, $online)
    if ($online) {
        copy-item -Force "C:\windowsdeploy-main\windowsdeploy-main\winlogbeat\winlogbeat.yml" -Destination "\\$computer_name\c$\Program Files\winlogbeat"
        Invoke-Command -ComputerName $computer_name -ScriptBlock {sc.exe config winlogbeat start= auto; sc.exe config sysmon64 start= auto; start-Service winlogbeat; start-service sysmon64}
    }
}


ForEach ($computer in $computers) {
    $online_boolean = Test-Connection -ComputerName $computer -Count 1 -ErrorAction SilentlyContinue
    Start-Job -ScriptBlock $script_block -ArgumentList @($computer, $online_boolean)
}

#clear-host
<#
$objs = "RS5000.exe", "LogixDesigner.exe", "RSLogix5000RcaServices.exe", "arm-rockwell-eabi-g++.exe", "I686-rockwell-elf-g++.exe", "CodeMeterCC.exe", "FTLoginLogout.exe", "RSLinx.exe", "RSLogix5000Services.exe", "CodeMeter.exe", "SolDisk5.sys", "Solfs5.sys", "EventClientMultiplexer", "EventServer", "Factory Talk Activation Service", "FTActivationBoost", "FTAE_Archiver", "FTAE_HistServ", "FTSysDiagSvcHost", "Harmony", "NmspHost", "Radaq", "ramkMsgKernelSvc", "raOSGi", "RdcyHost", "RnaAeServer", "RnaAlarmMux", "RnaAeServer", "RNADirMultiplexor", "RNADirectory", "RSLinx", "RSLinxNG", "RsvcHost"
$dirs = "*\ArmToolChain\bin", "C:\Program Files (x86)\Common Files\Rockwell", "C:\Program Files\Rockwell Automation", "C:\Program Files (x86)\Rockwell Software", "C:\Program Data\Rockwell", "C:\Program Data\Rockwell Automation", "C:\ProgramData\CodeMeter\CmAct"
$objs | ForEach-Object {
    $thisObj = $_
    $dirs | ForEach-Object { 
        #Write-Host "$thisObj in $($_):"
        Get-ChildItem -Path $_ -File -Include "*$thisObj*.exe" -Recurse -ErrorAction SilentlyContinue -Force
    }
}
#>

Get-WmiObject win32_Process | ? {$_.Name -in ("RS5000.exe", "LogixDesigner.exe", "RSLogix5000RcaServices.exe", 
                                              "arm-rockwell-eabi-g++.exe", "I686-rockwell-elf-g++.exe", "CodeMeterCC.exe", 
                                              "FTLoginLogout.exe", "RSLinx.exe", "RSLogix5000Services.exe", "CodeMeter.exe", 
                                              "SolDisk5.sys", "Solfs5.sys", "EventClientMultiplexer", "EventServer", 
                                              "Factory Talk Activation Service", "FTActivationBoost", "FTAE_Archiver", 
                                              "FTAE_HistServ", "FTSysDiagSvcHost", "Harmony", "NmspHost", "Radaq", "ramkMsgKernelSvc", 
                                              "raOSGi", "RdcyHost", "RnaAeServer", "RnaAlarmMux", "RnaAeServer", "RNADirMultiplexor", 
                                              "RNADirectory", "RSLinx", "RSLinxNG", "RsvcHost") } | 
                              Select-Object Path | Sort-Object Path | Get-Unique -AsString | Export-CSV -Path "C:\users\fridkbj\desktop\ProcessPathExclusions.csv" -NoTypeInformation

# References:
# 1.  https://stackoverflow.com/questions/24449113/how-can-i-extract-path-to-executable-of-all-services-with-powershell
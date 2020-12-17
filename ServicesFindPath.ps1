clear-host

#get-service | Where-Object { $_.Name -in ("CodeMeter.exe", "Solfs5.sys", "EventClientMultiplexer", "EventServer", "Factory Talk Activation Service", "FTActivationBoost", "FTAE_Archiver", "FTAE_HistServ", "FTSysDiagSvcHost", "Harmony", "NmspHost", "Radaq", "ramkMsgKernelSvc", "raOSGi", "RdcyHost", "RnaAeServer", "RnaAlarmMux", "RnaAeServer", "RNADirMultiplexor", "RNADirectory", "RSLinx", "RSLinxNG", "RsvcHost") }

Get-WmiObject win32_service | ? {$_.Name -in ("CodeMeter.exe", "Solfs5.sys", "EventClientMultiplexer", "EventServer", "Factory Talk Activation Service", 
                                              "FTActivationBoost", "FTAE_Archiver", "FTAE_HistServ", "FTSysDiagSvcHost", "Harmony", "NmspHost", "Radaq", 
                                              "ramkMsgKernelSvc", "raOSGi", "RdcyHost", "RnaAeServer", "RnaAlarmMux", "RnaAeServer", "RNADirMultiplexor", 
                                              "RNADirectory", "RSLinx", "RSLinxNG", "RsvcHost") } |
                            select Name, PathName | Export-CSV -Path "C:\users\fridkbj\desktop\ServicePathExclusions.csv" -NoTypeInformation
# References
# 1. https://www.tutorialspoint.com/how-to-get-the-running-processes-with-the-wmi-object-using-powershell
# 2. https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/get-unique?view=powershell-7.1
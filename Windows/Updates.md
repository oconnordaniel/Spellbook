# Updates

## Updates via powershell

``` PwSh
Install-Module PSWindowsUpdate
Import-Module PSWindowsUpdate
Get-WindowsUpdate
Install-WindowsUpdate

Get-WindowsUpdate -AcceptAll -Install -AutoReboot

Get-WURebootStatus
```

## Clear and restart updates

``` cmd
net stop wuauserv
net stop cryptSvc
net stop bits
net stop msiserver

net stop wuauserv && net stop cryptSvc && net stop bits && net stop msiserver

del C:\Windows\SoftwareDistribution 
del C:\Windows\System32\catroot2 

net start wuauserv && net start cryptSvc && net start bits && net start msiserver

wusa.exe /updatenow 

net start wuauserv
net start cryptSvc
net start bits
net start msiserver
```

``` PwSh
Stop-Service -name "wuauserv"
Stop-Service -name "cryptSvc"
Stop-Service -name "bits"
Stop-Service -name "msiserver"
>>>>>>> a09d74fc5814b157389d6ae9ac3e7e6d06edff49

Rename-Item "C:\Windows\SoftwareDistribution SoftwareDistribution.old"
Rename-Item "C:\Windows\System32\catroot2 Catroot2.old"

<<<<<<< HEAD
=======
Start-Service -name "wuauserv"
Start-Service -name "cryptSvc"
Start-Service -name "bits"
Start-Service -name "msiserver"
```

## Manually install

<https://www.catalog.update.microsoft.com/Home.aspx>
Download the update that's failing manually and run `wusa.exe C:\Path\to\installer\`

## Windows 10 Update Assistant

<https://www.microsoft.com/en-us/software-download/windows10>

### Repair Image

``` Power-Shell
Repair-WindowsImage -Online -RestoreHealth
```

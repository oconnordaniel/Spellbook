# Updates

## Updates via Powershell

``` Powershell
Install-Module PSWindowsUpdate
Import-Module PSWindowsUpdate

# may need 
Set-ExecutionPolicy Unrestricted

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

``` PowerShell
Stop-Service -name "wuauserv"
Stop-Service -name "cryptSvc"
Stop-Service -name "bits"
Stop-Service -name "msiserver"

Rename-Item "C:\Windows\SoftwareDistribution" "SoftwareDistribution.old"
Rename-Item "C:\Windows\System32\catroot2" "Catroot2.old"

Start-Service -name "wuauserv"
Start-Service -name "cryptSvc"
Start-Service -name "bits"
Start-Service -name "msiserver"
```

## Manually install

<https://www.catalog.update.microsoft.com/Home.aspx>
Download the update that's failing manually and run `wusa.exe C:\Path\to\installer\`

## Windows 10 Update Assistant

<https://support.microsoft.com/en-us/topic/windows-10-update-assistant-3550dfb2-a015-7765-12ea-fba2ac36fb3f>

<https://www.microsoft.com/en-us/software-download/windows10>

[Trouble shooting](https://learn.microsoft.com/en-us/windows/deployment/upgrade/resolve-windows-10-upgrade-errors)

[Error 0x80240022](https://www.techinpost.com/error-0x80240022-windows-code/)

### Repair Image

``` Power-Shell
Repair-WindowsImage -Online -RestoreHealth
```


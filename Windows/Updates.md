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

ren C:\Windows\SoftwareDistribution SoftwareDistribution.old 
ren C:\Windows\System32\catroot2 Catroot2.old

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

Rename-Item "C:\Windows\SoftwareDistribution SoftwareDistribution.old"
Rename-Item "C:\Windows\System32\catroot2 Catroot2.old"

Start-Service -name "wuauserv"
Start-Service -name "cryptSvc"
Start-Service -name "bits"
Start-Service -name "msiserver"
```

## Manually install

<https://www.catalog.update.microsoft.com/Home.aspx>
Download the update that's failing manually and run `wsua C:\Path\to\installer\`

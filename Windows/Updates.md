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
```


https://www.catalog.update.microsoft.com/Home.aspx
Download the update that's failing manually and run `wusa.exe C:\Path\to\installer\`

## Windows 10 Update Assistant

https://www.microsoft.com/en-us/software-download/windows10


### Repair Image

``` Power-Shell
Repair-WindowsImage -Online -RestoreHealth
```

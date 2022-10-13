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

https://www.catalog.update.microsoft.com/Home.aspx
Download the update that's failing manually and run `wsua C:\Path\to\installer\`



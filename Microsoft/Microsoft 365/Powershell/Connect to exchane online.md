1.  `pwsh -Command 'Install-Module -Name PSWSMan -Force'`
2.  `sudo pwsh -Command 'Install-WSMan'`


``` Powershell

Install-Module -Name ExchangeOnlineManagement -RequiredVersion 3.2.0

pwsh -Command 'Install-Module -Name PSWSMan'
sudo pwsh -Command 'Install-WSMan'

Import-Module ExchangeOnlineManagement
Connect-ExchangeOnline
```

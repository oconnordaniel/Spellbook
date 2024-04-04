# Win Event Logs

```powershell
Event logs:
C:\Windows\System32\WinEVT\Logs\*.evtx
Registry keys:
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\EventLog\<channel>\<provider>
```

Run Event Viewer `eventvwr.msc`


## Get logs

``` Powershell
Get-WinEvent -ListLog *
```

## Powershell - Get-WinEvent Providers

``` Powershell
Get-WinEvent -ListProvider *
```

## Powershell - Get-WinEvent Filters via where-object

``` Powershell
Get-WinEvent -LogName Application | Where-Object { $_.ProviderName -Match 'WLMS' }
```

## Powershell - Get-WinEvent Filters via hashable

``` Powershell
Get-WinEvent -FilterHashtable @{
  LogName='Application' 
  ProviderName='WLMS' 
}
```

### Powershell - Get-WinEvent Filters

``` Powershell
Get-WinEvent -FilterHashtable @{LogName='Microsoft-Windows-PowerShell/Operational'; ID=4104} | Select-Object -Property Message | Select-String -Pattern 'SecureString'
```

### XPath Query Powershell

``` Powershell
Get-WinEvent -LogName Application -FilterXPath '*/System/EventID=100'

Get-WinEvent -LogName Application -FilterXPath '*/System/Provider[@Name="WLMS"]'

Get-WinEvent -LogName Security -FilterXPath '*/EventData/Data[@Name="TargetUserName"]="System"' -MaxEvents 1
```

## Event ID

|Event ID|Description|
|---|---|
|4624|A successful account logon event|
|4625|An account failed to log on|
|4648|A logon was attempted using explicit credentials|
|4634|An account was logged off|
|4647|User initiated logoff|
|4740|A user account was locked out|

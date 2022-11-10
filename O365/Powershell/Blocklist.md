## Add sender to block list 
``` PowerShell
Set-HostedContentFilterPolicy -Identity 'Default' -BlockedSenderDomains @{Add="Value1"}

Set-HostedContentFilterPolicy -Identity 'Default' -BlockedSenders @{Add="Value1"}
```

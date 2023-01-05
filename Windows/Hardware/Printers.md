
# Print queue wont clear
```Powershell
Stop-Service -Name "spooler"
Get-ChildItem C:\Windows\System32\Spool\Printers -Recurse | Remove-Item
Start-Service -Name "spooler"
```


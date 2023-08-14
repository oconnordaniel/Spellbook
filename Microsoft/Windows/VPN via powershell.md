``` PowerShell
Remove-VpnConnection -Name "VPN Name" -Force
Add-VpnConnection -Name "VPN" -ServerAddress "0.0.0.0" -TunnelType L2tp -EncryptionLevel Optional -L2tpPsk "PreSharedK3y" -AuthenticationMethod Pap -Force -RememberCredemtials
```



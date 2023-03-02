``` PowerShell
Remove-VpnConnection -Name "VPN Name" -Force
Add-VpnConnection -Name "VPN" -ServerAddress "0.0.0.0" -TunnelType L2tp -EncryptionLevel Optional -L2tpPsk "PreSharedK3y" -AuthenticationMethod Pap -Force

Add-VpnConnection -Name "VPN" -ServerAddress "office-appliance-vmccvmzpvt.dynamic-m.com" -TunnelType L2tp -EncryptionLevel Optional -L2tpPsk "rDYJ1xoV4gejYMum-N1a7XxSKlxhABp_" -AuthenticationMethod Pap -Force

```



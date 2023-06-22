New AD user

``` Powershell
PS C:\> $NewPassword = (Read-Host -Prompt "Provide New Password" -AsSecureString) 
PS C:\> Set-ADAccountPassword -Identity DavidChe -NewPassword $NewPassword -Reset Provide New Password: **********
```
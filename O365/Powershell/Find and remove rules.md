``` Powershell
$addresses = Get-Mailbox -ResultSize Unlimited | Select-Object PrimarySmtpAddress

Get-InboxRule -Mailbox $address -IncludeHidden


Get-InboxRule –Mailbox <mailbox_user> | Select Name, Description | FL

Remove-InboxRule -Mailbox Joe@Contoso.com -Identity "ProjectA-MoveToFolderA"
```

## Password reset
``` Powershell
Set-MsolUserPassword -UserPrincipalName "davidchew@contoso.com" -ForceChangePassword

Set-MsolUserPassword -UserPrincipalName "davidchew@consoso.com" -NewPassword "pa$$word"
```

## Sign out of all sessions 
``` Powershell 
Install-Module AzureAD
Connect-AzureAD
Get-AzureADUser -SearchString user@contoso.com | Revoke-AzureADUserAllRefreshToken
```


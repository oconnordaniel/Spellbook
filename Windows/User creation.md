``` cmd
net user <username> <passwd> /add
net localgroup administrators <username> /add
WMIC USERACCOUNT WHERE Name='<username>' SET PasswordExpires=FALSE
```

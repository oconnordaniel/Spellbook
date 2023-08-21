## Via Control Panel

•	Use Computer Management to view users
•	To add user, click Action -> new user
•	To delete user, right click on user -> Delete

## Via CMD

Create a new user
``` cmd
net user <username> <passwd> /add
```

Set password of existing user
``` cmd
net user <username> <passwd>
```

Add user to administrators group
``` cmd
net localgroup administrators <username> /add
```

Set password to never expire
```
WMIC USERACCOUNT WHERE Name='<username>' SET PasswordExpires=FALSE
```

## Via Powershell

<https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.localaccounts/new-localuser?view=powershell-5.1> 

``` PowerShell
New-LocalUser -Name 'User02' -Description 'Description of this account.'
```

You can use `-Password` to define the password. (best not to do this on the command line for logging reasons). Either store the password in a `Read-Host` var or omit it to have the system ask for the new password. 

``` PowerShell
$Password = Read-Host -AsSecureString
$params = @{
    Name        = 'User03'
    Password    = $Password
    FullName    = 'Third User'
    Description = 'Description of this account.'
}
New-LocalUser @params

Name    Enabled  Description
----    -------  -----------
User03  True     Description of this account.
```

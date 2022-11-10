#!/bin/pwsh 

$addresses = Get-Mailbox -ResultSize Unlimited | Select-Object PrimarySmtpAddress

foreach ($address in $addresses) {
    Get-InboxRule -Mailbox $address -IncludeHidden
}


## Add user to calendar 

Calendar access does not have an easy GUI way to manage it.  

You must first connect to exchange online via powershell  
`Connect-ExchangeOnline -UserPrincipalName user@domain.tld`

To view the permissions of the calendar
`Get-MailboxFolderPermission user!@domain.tld:\calendar`

To add access to the calendar
`Add-MailboxFolderPermission -Identity user1@domain.com:\calendar -user user2@domain.com -AccessRights Reviewer`

After this user will still need to go to Outlook > Calendar > Add > Open Shared Callendar... and enter ther name of the mailbox.


## Outlook Calendar Roles and Permissions

When managing calendar and Outlook folder permissions, you can use the following predefined permissions level roles:

-   **Owner** — gives full control of the mailbox folder: read, create, modify, and delete all items and folders. Also, this role allows to manage item’s permissions;
-   **PublishingEditor** — read, create, modify, and delete items/subfolders (all permissions, except the right to change permissions);
-   **Editor** — read, create, modify, and delete items (can’t create subfolders);
-   **PublishingAuthor** — create, and read all items/subfolders. You can modify and delete only items you create;
-   **Author** — create and read items. Edit and delete own items;
-   **NonEditingAuthor** — full read access, and create items. You can delete only your own items;
-   **Reviewer** — read folder items only;
-   **Contributor** — create items and folders (can’t read items);
-   **AvailabilityOnly** — read Free/Busy info from the calendar;
-   **LimitedDetails** — view availability data with calendar item subject and location;
-   **None** — no permissions to access folders and files.

http://theitbros.com/add-calendar-permissions-in-office-365-via-powershell/
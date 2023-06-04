## Lost Trust with Domain

`Error: The security database on the server does not have a computer account for this workstation trust relationship

•	Log into LOCAL admin account
•	If none exists, create one using cmd
		 - net user /add \[*username] \[password]* *
		 - net localgroup administrators [username] /add
•	Once logged in, run domain connection test in Powershell as administrator
		 - Test-ComputerSecureChannel
				 - If Fail, run:
		 - Test-ComputerSecureChannel -Repair
				 - Should say True
•	If still doesn’t work, go to control panel
•	disconnect from domain, add to workgroup (just call it workgroup)
•	restart computer, then reconnect to domain
	- If can't connect, go to Network Adapter Settings 
	- Turn off IPv6
	- Try to connect again
•	Restart one more time, should be able to log in now

## Domain Account Keeps Locking

- Computer says account is locked when trying to log into Windows
- You unlock the account, log in again, but it locks again 

1. Log them out of all devices
2. Turn off windows folder sync offline files (on all computers)
	1. Go to Control Panel -> Sync Center
	2. Select Manage Offline Files from left menu
	3. Disable offline files
3. Clear cached credentials in credential manager
4. Make sure they're not remoted in anywhere
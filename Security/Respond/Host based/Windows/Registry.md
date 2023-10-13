# Notable RegKeys

1. HKEY_USERS
    Contains all the actively loaded user profiles on the computer. HKEY_CURRENT_USER is a subkey of HKEY_USERS. HKEY_USERS is sometimes abbreviated as HKU.
2. HKEY_CURRENT_USER
    Contains the root of the configuration information for the user who is currently logged on. This information is associated with the user's profile. This key is sometimes abbreviated as HKCU.
3. HKEY_LOCAL_MACHINE
    Contains configuration information particular to the computer (for any user). This key is sometimes abbreviated as HKLM.
4. HKEY_CURRENT_CONFIG
    Contains information about the hardware profile that is used by the local computer at system startup.
5. HKEY_CLASSES_ROOT
    Is a subkey of HKEY_LOCAL_MACHINE\Software. The information that is stored here makes sure that the correct program opens when you open a file by using Windows Explorer. This key is sometimes abbreviated as HKCR.

    Starting with Windows 2000, this information is stored under both the HKEY_LOCAL_MACHINE and HKEY_CURRENT_USER keys. The HKEY_LOCAL_MACHINE\Software\Classes key contains default settings that can apply to all users on the local computer. The HKEY_CURRENT_USER\Software\Classes key has settings that override the default settings and apply only to the interactive user.

If you are accessing a live system, you will be able to access the registry using regedit.exe

The majority of these hives are located in the `C:\Windows\System32\Config` directory and are:

1. `C:\Windows\System32\Config\DEFAULT` (mounted on `HKEY_USERS\DEFAULT`)
2. `C:\Windows\System32\Config\SAM` (mounted on `HKEY_LOCAL_MACHINE\SAM`)
3. `C:\Windows\System32\Config\SECURITY` (mounted on `HKEY_LOCAL_MACHINE\Security`)
4. `C:\Windows\System32\Config\SOFTWARE` (mounted on `HKEY_LOCAL_MACHINE\Software`)
5. `C:\Windows\System32\Config\SYSTEM` (mounted on `HKEY_LOCAL_MACHINE\System`)

Hives containing user information:

1. `C:\Users\%username%\NTUSER.DAT` (mounted on `HKEY_CURRENT_USER` when a user logs in)
2. `C:\Users\<username>\AppData\Local\Microsoft\Windows\USRCLASS.DAT` (mounted on `HKEY_CURRENT_USER\Software\CLASSES`)

AmCache hive. This hive is located in `C:\Windows\AppCompat\Programs\Amcache.hve`. Windows creates this hive to save information on programs that were recently run on the system.

Transaction Logs and Backups:

Transaction Logs are stored in the same folder as the hive. They have the extention `.LOG1` 
Backup hives are stored at `C:\Windows\System32\Config\RegBack`

## References

<https://tryhackme.com/room/windowsforensics1>

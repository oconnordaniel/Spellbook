Location: 
```powershell
%SYSTEM%\AppCompat\Progrems\Amcache.hve
C:\Windows\AppCompat\Programs\Amcache.hve
```

The Amcache.hve file can help to analyze user activity during digital forensic investigations – specifically user activity related to recently executed/installed applications. The metadata found within the Amcache includes:

- The full file path of the executable
- The SHA1 hash of the executable
- Timestamp information (created and last modified, which can be considered the runtime of the executable in some cases)
- [PE](https://en.wikipedia.org/wiki/Portable_Executable) properties (header data and PE linker timestamp)
- File version information (ProductName, CompanyName, Description)
- The install and uninstall timestamps

## AppCompatCache

More recent versions of Windows:
`HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SessionManager\AppCompatCache, AppCompatCache`
Windows XP:
`HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SessionManager\AppCompatibility, AppCompatCache`

includes:

- Full file path
- File size
- The MFT `$SI` (`$Standard_Information`) last modified time
- Cache entry position
- ShimCache last updated time
- Process execution flag

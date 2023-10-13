``` cmd
--------
System
--------
ComSpec=%SystemRoot%\system32\cmd.exe
DriverData=C:\Windows\System32\Drivers\DriverData
NUMBER_OF_PROCESSORS=4
OS=Windows_NT
Path=C:\Program Files (x86)\Windows Resource Kits\Tools\;%SystemRoot%\system32;%SystemRoot%;%SystemRoot%\System32\Wbem;%SYSTEMROOT%\System32\WindowsPowerShell\v1.0\;%SYSTEMROOT%\System32\OpenSSH\;C:\Program Files\dotnet\
PATHEXT=.COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.cpl
PROCESSOR_ARCHITECTURE=AMD64
PROCESSOR_IDENTIFIER=Intel64 Family 6 Model 126 Stepping 5, GenuineIntel
PROCESSOR_LEVEL=6
PROCESSOR_REVISION=7e05
PSModulePath=%ProgramFiles%\WindowsPowerShell\Modules;%SystemRoot%\system32\WindowsPowerShell\v1.0\Modules
TEMP=%SystemRoot%\TEMP
TMP=%SystemRoot%\TEMP
USERNAME=SYSTEM
windir=%SystemRoot%
 
--------
Volatile - These are set at logon
--------
LOGONSERVER=\\LAPTOP
USERDOMAIN=LAPTOP
USERNAME=David Candy
USERPROFILE=C:\Users\David Candy
HOMEPATH=\Users\David Candy
HOMEDRIVE=C:
APPDATA=C:\Users\David Candy\AppData\Roaming
LOCALAPPDATA=C:\Users\David Candy\AppData\Local
USERDOMAIN_ROAMINGPROFILE=LAPTOP
 
--------
User - These override system variables, and in the case of PATH are added to the system PATH
--------
OneDrive=C:\Users\David Candy\OneDrive
Path=C:\Users\David Candy\AppData\Local\Microsoft\WindowsApps;;C:\Users\David Candy\AppData\Local\Programs\Fiddler
TEMP=%USERPROFILE%\AppData\Local\Temp
TMP=%USERPROFILE%\AppData\Local\Temp
 
--------
Process - This is the combined environment from the above for the program
          Variables starting with an equals sign, such as =C:=C:\Windows are internal CMD variables
          CMD simulates a default directory per drive like MSDos. This is how it keeps track
--------
=C:=C:\Windows\System32
ALLUSERSPROFILE=C:\ProgramData
APPDATA=C:\Users\David Candy\AppData\Roaming
CommonProgramFiles=C:\Program Files\Common Files
CommonProgramFiles(x86)=C:\Program Files (x86)\Common Files
CommonProgramW6432=C:\Program Files\Common Files
COMPUTERNAME=LAPTOP
ComSpec=C:\Windows\system32\cmd.exe
DriverData=C:\Windows\System32\Drivers\DriverData
HOMEDRIVE=C:
HOMEPATH=\Users\David Candy
LOCALAPPDATA=C:\Users\David Candy\AppData\Local
LOGONSERVER=\\LAPTOP
NUMBER_OF_PROCESSORS=4
OneDrive=C:\Users\David Candy\OneDrive
OS=Windows_NT
Path=C:\Program Files (x86)\Windows Resource Kits\Tools\;C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;C:\Windows\System32\OpenSSH\;C:\Program Files\dotnet\;C:\Users\David Candy\AppData\Local\Microsoft\WindowsApps;C:\Users\David Candy\AppData\Local\Programs\Fiddler
PATHEXT=.COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.cpl
PROCESSOR_ARCHITECTURE=AMD64
PROCESSOR_IDENTIFIER=Intel64 Family 6 Model 126 Stepping 5, GenuineIntel
PROCESSOR_LEVEL=6
PROCESSOR_REVISION=7e05
ProgramData=C:\ProgramData
ProgramFiles=C:\Program Files
ProgramFiles(x86)=C:\Program Files (x86)
ProgramW6432=C:\Program Files
PROMPT=$P$G
PSModulePath=C:\Program Files\WindowsPowerShell\Modules;C:\Windows\system32\WindowsPowerShell\v1.0\Modules
PUBLIC=C:\Users\Public
SystemDrive=C:
SystemRoot=C:\Windows
TEMP=C:\Users\DAVIDC~1\AppData\Local\Temp
TMP=C:\Users\DAVIDC~1\AppData\Local\Temp
USERDOMAIN=LAPTOP
USERDOMAIN_ROAMINGPROFILE=LAPTOP
USERNAME=David Candy
USERPROFILE=C:\Users\David Candy
windir=C:\Windows
 
--------
Dynamic - These are updated each time they are used
--------
CD
DATE
TIME
RANDOM
ERRORLEVEL
CMDEXTVERSION
CMDCMDLINE
HIGHESTNUMANODENUMBER
```

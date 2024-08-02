
The Windows operating system has a functionality called **prefetch** which allows commonly used applications to load faster. To achieve this, Windows records data about an executable for up to ten seconds after execution. This is then saved to a trace file known as a **prefetch file**. Windows can then reference it the next time that application is run, leading to faster load times.

The metadata of forensic value stored within a prefetch file includes:

- The name of the executable file (up to 29 characters)
- The path of the executable file
- The creation, last modified, and last accessed timestamps of the executable file
- The run count of the executable
- Last run timestamp
- Additional timestamps for the last seven runtimes
- Files and directories referenced by the executable during startup
- Volume information

Prefetch files are found in the following directory:

```powershell
C:\Windows\Prefetch\*.pf
```

The prefetch file name format is made up of the **name of the executable**, followed by a **dash**, then an **eight-character long** [**hash**](https://forensicswiki.xyz/wiki/index.php?title=Prefetch#Prefetch_hash) of the location it was run from (all in uppercase), and ending with a **.pf file extension**. For example:

``` powershell
ExampleProg.EXE-8BC49CF0.pf`
```

To enable or disable prefetch files, you can edit the following registry key:

```powershell
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters
```
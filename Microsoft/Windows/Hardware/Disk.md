# Disk repair options

`chkdsk C: /f /r /scan /perf`

`/r` - Locates bad sectors and recovers readable information. The disk must be locked. /r includes the functionality of /f, with the additional analysis of physical disk errors.  (will always happen when targeting booted disk)

`/f` - Fixes errors on the disk. The disk must be locked. If chkdsk cannot lock the drive, a message appears that asks you if you want to check the drive the next time you restart the computer.

`/scan` - Use with NTFS only. Runs an online scan on the volume.

`/perf` - Use with NTFS only (must be used with /scan). Uses more system resources to complete a scan as fast as possible. This may have a negative performance impact on other tasks running on the system.

`DISM /Online /Cleanup-Image /CheckHealth`
`DISM /Online /Cleanup-Image /RestoreHealth`

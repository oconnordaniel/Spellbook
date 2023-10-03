# Windows IR quick commands

``` cmd
# Get list of all open connections
netstat -naob

# Get the command that ran the process id in question 
wmic process where processid=# get commandline

# get dll's accociated with pid 
tasklist /m /fi "pid eq #"
    ntdll.dll
    wow64.dll
    wow64win.dll
    wow64cpu.dll
```

# Windows IR quick list

## Get list of all open connections

1. Get list of the open connections.
`etstat -naob`

2. Get the command that ran the process id in question 
`wmic process where processid=# get commandline`

2. get dll's accociated with pid 
`tasklist /m /fi "pid eq #"`
    ntdll.dll
    wow64.dll
    wow64win.dll
    wow64cpu.dll
    
## Task Scheduler

## Check Registry 


# Get battery report

Open command prompt and run `powercfg /batteryreport`. This will generate the battery report as a .html file that is saved at `C:\WINDOWS\system32\battery-report.html` unless you used the `/output` flag to save it to somewhere else. 

``` cmd 
powercfg /batteryreport /output C:\battery_report.html`
```

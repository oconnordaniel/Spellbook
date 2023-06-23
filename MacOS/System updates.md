Run system updates via cli

``` Bash
# Check for updates
/usr/bin/sudo /usr/sbin/softwareupdate -l
# Install all updates
/usr/bin/sudo /usr/sbin/softwareupdate -i -a -R
# Install select package
/usr/bin/sudo /usr/sbin/softwareupdate -i '<package name>'
```

softwareupdate help

``` bash
-l | --list     List all appropriate update labels (options:  --no-scan, --product-types)
-i | --install    Install
    <label> ...     specific updates
    -a | --all              All appropriate updates
    -R | --restart          Automatically restart (or shut down) if required to complete installation. 

--agree-to-license    Agree to the software license agreement without user interaction.
--verbose    Enable verbose output
```

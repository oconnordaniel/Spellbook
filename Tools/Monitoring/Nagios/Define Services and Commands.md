
## Define Service

This is done in the `servers/name.cfg` file. A service is applied to a host or hostgroup


``` cfg
define service{
        use                     local-service
        hostgroup_name          linux-server
        service_description     Check Alive
        check_command           check-host-alive
}
```
## Define command 

This is done in the `objects/commands.cfg` file. A command take a command_name and runs a command line.

Can run with variables listed [here](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/3/en/macrolist.html#hostname)

``` config
define command {
    command_name    check-host-alive
    command_line    $USER1$/check_ping -H $HOSTADDRESS$ -w 3000.0,80% -c 5000.0,100% -p 5
}
```

Server:

1. Install `nagios-nrpe-server nagios-plugins nagios-nrpe-plugin`
2. Run `/usr/lib/nagios/plugins/check_nrpe -H <ip_of_client> ` to confirm connection to client.
3. Main config file needs to have a folder added to it. 
4. Each file in that folder will be evaluated.
5. In those configs can be
    - Host
    - Host Group
    - Service
    Service can run commands from the `/usr/local/nagios/etc/objects/commands.cfg` file.
6. commands 

``` 
define hostgroup{
    hostgroup_name          linux-server
    alias                   Linux Servers
    members                 ubuntu-nagios-client
}

define host{
    use                     linux-server
    host_name               ubuntu-nagios-client
    alias                   ubuntu-nagios-client
    address                 10.10.10.63
}


define service{
    use                     local-service
    host_name               ubuntu-nagios-client
    service_description     Check Ping
    check_command           check_ping
}
```

Client:

1. Install nrpe
2. Configure file to allow access
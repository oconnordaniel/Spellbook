# Groups and Hosts

## Configure the config file to use our host.cfg file

In `/usr/local/nagios/etc/nagios.cfg` make sure the line `cfg_dir=/usr/local/nagios/etc/servers` exists. Should just need to comment it out. 

Then `touch /usr/local/nagios/etc/servers/linux-servers.cfg`. Can be named anything that ends in `.cfg`. All will be evaluated. Easy way to separate classes of infrastructure. 

## Define a Host Group

``` conf
define hostgroup {
    hostgroup_name <name_of_group>
    alias <Friendly Name of Group>
    mambers <name_of_host_A>, <name_of_host_B> # Comma seperated list
}
```

## Define a Host

``` conf
define host {
    host_name <name_of_host_A>
    alias <Friendly Name of Host A>
    address <ip_addr> or <dns_name>
    use #no idea what this is yet. Template I used set this to the hostgroup_name
}
```

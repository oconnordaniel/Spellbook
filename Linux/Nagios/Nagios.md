# Nagios

## Install 

[Install guide](https://support.nagios.com/kb/article/nagios-core-installing-nagios-core-from-source.html#Ubuntu)

Community articles:
[linuxtechi - How to Add Windows and Linux host to Nagios Server for Monitoring](https://tecadmin.net/how-to-install-nrpe-on-ubuntu-20-04/)
[tecadmin- How to Install Nagios NRPE Client on Ubuntu 20.04](https://www.linuxtechi.com/add-windows-linux-host-to-nagios-server/)

## Setup Client

Install the nagios NRPE server

``` bash
sudo apt update
sudo apt install nagios-nrpe-server nagios-plugins
```

Configure the NRPE server to listen. 

`/etc/nagios/nrpe.cfg`

``` conf
# SERVER ADDRESS
# Address that nrpe should bind to in case there are more than one interface
# and you do not want nrpe to bind on all interfaces.
# This should be the local ip address.
server_address=

# ALLOWED HOST ADDRESSES
# This is an optional comma-delimited list of IP address or hostnames
# that are allowed to talk to the NRPE daemon.
allowed_hosts=
```

Restart the NRPE server.

``` bash
systemctl restart nagios-nrpe-server
systemctl enable nagios-nrpe-server
systemctl status nagios-nrpe-server
```

## Configure Nagios Server to monitor Linux host

``` bash
sudo apt install nagios-nrpe-server nagios-plugins
```



## Thoughts

The server has a file or files that dictate what hosts to check and what services to check. Not that in the ethos of Nagios checking a host is not checking the services of that host. 

The server runs commands that are located at `/usr/lib/nagios/plugins/`. These are just command that can be run from the command line. In the `/etc/nagios/nrpe.cfg` file they are configure as follows. 

``` config
command[**check_users**]=/usr/lib/nagios/plugins/check_users -w 5 -c 10
command[**check_load**]=/usr/lib/nagios/plugins/check_load -w 15,10,5 -c 30,25,20
command[**check_hda1**]=/usr/lib/nagios/plugins/check_disk -w 20% -c 10% -p /dev/hda1
command[**check_zombie_procs**]=/usr/lib/nagios/plugins/check_procs -w 5 -c 10 -s Z
command[**check_total_procs**]=/usr/lib/nagios/plugins/check_procs -w 150 -c 200
```

And you can run `/usr/lib/nagios/plugins/<command> --help` to get parameters for commands. 

The client needs to be setup with the nrpe-server package. Then just needs to be configure to allow the monitor server to check it. As well as having the ports opened.
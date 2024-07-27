# Nagios

## Overview

1. Install the Nagios server

    <https://support.nagios.com/kb/article/nagios-core-installing-nagios-core-from-source-96.html#Ubuntu>

 This has also been added to the install.sh scrip in the Ans-Nagios playbook

1. Install the extra tools on the Nagios server

    - nagios-nrpe-server
    - nagios-plugins
    - nagios-nrpe-plugin

ncpa

    - nagios-nrpe?

2. Install the NRPE server on the client

3. Configure the NRPE server on the client

The Nagios server has the nagios NRPE service running.
That service uses the `/usr/local/nagios/etc/nagios.cfg` as it's root config.
In that file add the option to use the `/usr/local/nagios/etc/servers/ubuntu-host.cfg` file.
Both the `servers/ubuntu-host.cfg` and the `objects/localhost.cfg` file are used to configure what commands to check.
The command file describes what commands to run.

The server runs commands that are located at `/usr/lib/nagios/plugins/`. These are just command that can be run from the command line. In the `/etc/nagios/nrpe.cfg` file they are configure as follows. And you can run `/usr/lib/nagios/plugins/<command> --help` to get parameters for commands.

The client needs to be setup with the `nagios-nrpe-server` package. Then just needs to be configure to allow the monitor server to check it. As well as having the ports opened. `5666`

### Install NRPE Script

You must run the following commands as root.

``` bash
cd /tmp
wget http://assets.nagios.com/downloads/nagiosxi/agents/linux-nrpe-agent.tar.gz
tar xzf linux-nrpe-agent.tar.gz  
cd linux-nrpe-agent  
./fullinstall
```

<https://support.nagios.com/kb/article/nrpe-how-to-install-nrpe-8.html>

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
server_address=0.0.0.0

# ALLOWED HOST ADDRESSES
# This is an optional comma-delimited list of IP address or hostnames
# that are allowed to talk to the NRPE daemon.
allowed_hosts=10.10.10.0/24
```

Restart the NRPE server.

``` bash
systemctl restart nagios-nrpe-server
systemctl enable nagios-nrpe-server
systemctl status nagios-nrpe-server
```

## Configure Nagios Server to monitor Linux host

``` bash
sudo apt install nagios-nrpe-server nagios-plugins nagios-nrpe-plugin
```

``` bash
# run this to check if monitor can connect to client. 
/usr/lib/nagios/plugins/check_nrpe -H <ip_of_client> 
```

### Add the the servers folder to the config file

Edit the `vim /usr/local/nagios/etc/nagios.cfg` file and uncomment the line `cfg_dir=/usr/local/nagios/etc/servers`

``` bash
mkdir /usr/local/nagios/etc/servers
touch /usr/local/nagios/etc/servers/ubuntu-host.cfg
```

Update the server's config file to be able to monitor clients with repeatable commands

`/etc/nagios/nrpe.cfg`

``` config
```

Add to commands.cfg

``` config
define command{
    command_name check_nrpe
    command_line $USER1$/check_nrpe -H $HOSTADDRESS$ -c $ARG1$
}
```

We don't care about user count that much.

``` config
command[**check_users**]=/usr/lib/nagios/plugins/check_users -w 5 -c 10
```

Checks the client load.
The numbers after are the load across the last 1, 5, and 15 minutes.

``` config
command[**check_load**]=/usr/lib/nagios/plugins/check_load -w 15,10,5 -c 30,25,20
```

Checks the free disk space of a disk.
Defaults to sda but may need to be adjusted.

```config
command[**check_hda1**]=/usr/lib/nagios/plugins/check_disk -w 20% -c 10% -p /dev/sda
```

Checks the total number of processes.

``` config
command[**check_total_procs**]=/usr/lib/nagios/plugins/check_procs -w 150 -c 200
command[**check_zombie_procs**]=/usr/lib/nagios/plugins/check_procs -w 5 -c 10 -s Z
```

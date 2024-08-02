# Systemd

## Unit types: 
- service
- timers
- target
- mounts
- automounts
- socket

## Commands:

`systemctl [action] [unitname]`

Actions:
- start
- stop
- enable
- disable
- restart
- reload

`systemctl daemon-reload` to refresh deamons.
`systemctl edit [service name]` Edit the override.conf file

## Folders:

`/etc/systemd/system/` 
`/run/systemd/system/` Runtime units
`/lib/systemd/system/` Default spot for new installs

These are checked in this priority. 

## File structure

[Freedesktop Docs](https://www.freedesktop.org/software/systemd/man/latest/systemd.unit.html#%5BUnit%5D%20Section%20Options)

``` bash
[Unit]
Description=<Description goes here>
Wants=<Prerequisit Services>
Before=<>
After=<>
Documentation=<>
[Service]

[Install]

```

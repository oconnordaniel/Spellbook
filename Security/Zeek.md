# Zeek

## Intro

Zeek is functionally (as far as I can tell) a super fancy `tcpdump` tool.

## Install Zeek

<https://docs.zeek.org/en/current/install.html#linux>

## Configure interface

<https://blog.securityonion.net/2011/10/when-is-full-packet-capture-not-full.html>

## Configure Zeek

Files to edit

`/opt/zeek/share/zeek/site/local.zeek`

```conf
# Uncomment this to source zkg's package state
#@load packages
#@load frameworks/files/extract-all-files
# Load packages only if you've installed them with the zeek package manager
redef ignore_checksums=T;
redef LogAscii::use_json=T; # This saves the output in json
```

`/opt/zeek/etc/node.cfg`

``` conf
type=standalone
host=localhost
interface=<interface name>
```

```bash
sudo /opt/zeek/bin/zeekctl check
sudo /opt/zeek/bin/zeekctl deploy
sudo /opt/zeek/bin/zeekctl status
```

## Reading logs

Logs are in the `/opt/zeek/logs` directory. Current is the current running process and the rest will have a dated folder.

## Running Zeek against .pcap

`/opt/zeek/bin/zeek -C -e 'redef LogAscii::use_json=T;' -r  <file name>.pcap`

The -C flag is the same as `-e 'redef ignore_checksums=T;'`

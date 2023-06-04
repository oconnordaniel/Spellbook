# Suricata

<https://docs.suricata.io/en/latest/quickstart.html>

## Download and install

```bash
sudo add-apt-repository ppa:oisf/suricata-stable
sudo apt update
sudo apt install suricata jq

sudo suricata --build-info
sudo systemctl status suricata
```

## Config

`/etc/suricata/`

`suricata.config`
``` yaml
vars:
    address-groups:
        HOME_NET: "[ <home_subnet> ]"

af-packet: 
    -interface: <interface> 

pcap: 
    -interface: <interface> 
    
outputs: 
  - eve-log: 
      community-id: true # Set to true
      
default-rule-path: /var/lib/suricata/rules

rule-files:                                                                     │
  - suricata.rules                                                              │
```

`rules/`
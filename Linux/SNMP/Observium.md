# Setup server

```
wget http://www.observium.org/observium_installscript.sh
chmod +x observium_installscript.sh
./observium_installscript.sh
```

https://docs.observium.org/install_debian/

# Setup client

` sudo apt update
` sudo apt install snmpd

` sudo nano /etc/snmp/snmpd.conf

```
# AGENT BEHAVIOR
agentAddress  udp:127.0.0.1:161
agentAddress udp:[LOCAL-IP-ADDRESS]:161,udp6:[::1]:161


# ACCESS CONTROL
rocommunity [COMMUNITY] [OBSERVIUM-IP-ADDRESS]
rocommunity6 [COMMUNITY] [OBSERVIUM-IP-ADDRESS]
```
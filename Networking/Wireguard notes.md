Build a wireguard tunnel from Dan's Nanode to Dan's mikrotik

# Set Interface
1. Create interface
2. Listening port 13231
3. Gen Priv and Pub keys

> interface wireguard add name=wireguard-device mtu=[default 1400] listen-port=[default 13231] comment=""

# Set Peer
1. Set interface
2. Set pub key of other device 
3. Set endpoint
4. Set port
5. Set Allowed address with /subnet

# Assign IP to wireguard interface
Create IP address
Assigned to Wireguard-device interface

# High level 
 - Give side A a subnet
 - Give side B a subnet
 - Give the tunnel a subnet
 - Create an Interface on side A and side B
 - Create a Peer on each side for the other side
 - Create an IP for the tunnel on each side
 - Create allowed list for what ranges come over the tunnel 
 - Create routes for goes over the tunnel
 
 
 ## Pub key for wireguard Nanode
 hQcb6ewlDLY4XQvLrNrIgIfWYW48yaS+MwJKQy1qoG4=
 
IPs
XF-ext: 73.14.119.57
XF-int: 10.0.0.1
MT-ext: 10.0.0.204 DHCP from xfi
MT-int: 10.10.10.1


Configs:
Home

peer
Endpoint (connect to) = 73.14.119.57
ListenPort = 13231
Allowed = ip/32 of device


Macbook
[interface]
PrivKey = [****]
ListenPort = 13231
Adresses = 
[Peers]
PubKey = [homePubKey]
AllowedIPs = 


iPhone




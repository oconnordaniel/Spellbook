Check Hardware
Check neighbors and masks
Check for duplicate ips
Check for duplicate macs

ping loopback
ping host
ping gateway
ping neighbor 
ping anything on wan
ping target by ip
ping target by name
establish session




| Type | Prefix | Leading Hex Characters
| --- | --- | --- | 
| Global unicast | 2000::/3 | 2 3 | 
| Link local unicast | fe81::/10 | fe80 | 
| Multicast | ff00::/8 | ff | 
| Multicast (link local) | ff02::/16 | ff02::1 (all nodes) ff02::2 (all routers) ff02::1:2 (DHCP) | 
| Solicited-node | ff02::1:ff00:0/104 | ff02::1:ff | 
| Unspecified | ::/128 | 0::0 | 
| Loopback | ::1/128 | ::1 |
| Documentation/Examples | 2001:db8::/32 | 2001:db8 | 
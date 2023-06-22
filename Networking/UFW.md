
``` bash 
sudo ufw status
sudo ufw reload

sudo ufw default deny incoming
sudo ufw allow proto tcp from 10.10.10.0/24 to any port ###

### ssh
22/tcp

### http https
80/tcp 		http
443/tcp 	https

### DNS
53/tcp
53/udp

### RDP
3389/tcp	Microsoft Terminal Server

# SMB
445/tcp
```

## Setup
```
sudo apt install snort 
ip link set eth0 promisc on
```

Edit /etc/snort/snort.conf
`ipvar HOME_NET 10.10.10.0/24`


 
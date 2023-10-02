# Snort

## Setup

``` conf
sudo apt install snort 
ip link set eth0 promisc on
```

Edit /etc/snort/snort.conf
`ipvar HOME_NET 10.10.10.0/24`

## random script

``` bash
sudo snort -r snort.log.1234 -X > file && sed -E 's/^0x[0-9A-F]{4}: ([A-F0-9]{2} )* / /g' file
```

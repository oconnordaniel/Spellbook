List connections

`nmcli connection show`

```
NAME                UUID                                  TYPE      DEVICE  
Wired connection 1  < some UUID >                         ethernet  eth0    
# might show lo, or docker here too
```

Modify the connection (replace "Wired connection 1" with your connection name)

```
sudo nmcli connection modify "Wired connection 1" \
    ipv4.method manual \
    ipv4.addresses 10.10.10.xxx/24 \ # Replace with desired address
    ipv4.gateway 10.10.10.1 \
    ipv4.dns "10.10.10.101 1.1.1.1"
```

Restart the connection

```
sudo nmcli connection down "Wired connection 1"
sudo nmcli connection up "Wired connection 1"
```

/etc/netplan/00-installer-config.yaml

```

network:
  ethernets:
    ens**:    // Divice ID
	  addresses: [192.168.2.141/24]    // Address.
        gateway4: 192.168.1.1    // Router 
        nameservers:
          addresses: [192.168.2.102]
  version: 2
```

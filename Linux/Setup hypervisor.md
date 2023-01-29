install tools [[Libvirt install]]

## Netplan (ubuntu)

### 1. Disable netfiler

> `/etc/sysctl.d/bridge.conf
``` conf
net.bridge.bridge-nf-call-ip6tables=0  
net.bridge.bridge-nf-call-iptables=0  
net.bridge.bridge-nf-call-arptables=0
```

> `/etc/udev/rules.d/99-bridge.rules`
``` conf
ACTION=="add", SUBSYSTEM=="module", KERNEL=="br_netfilter", RUN+="/sbin/sysctl -p /etc/sysctl.d/bridge.conf"
```

### 2. Disable virsh's default bridge 
``` bash
virsh net-destroy default
virsh net-undefine default
```

### 3. Set bridge in netplan
> `/etc/netplan/00-installer-config.yaml`
``` yaml
network:
  ethernets:
    {{interface name}}:
      dhcp4: false
      dhcp6: false
  bridges:
    br0:
      interfaces: [ {{interfacename}}]
      addresses: [{{host_ip_in_cidr}}]
      routes:
      - to: default
        via: {{gatrway_address}}
      mtu: 1500
      nameservers:
        addresses: [{{list_of_nameservers}}]
      parameters:
        stp: true
        forward-delay: 4
      dhcp4: no
      dhcp6: no
  version: 2
```

### 4. apply
`netplan try` and `netplan apply`

https://levelup.gitconnected.com/how-to-setup-bridge-networking-with-kvm-on-ubuntu-20-04-9c560b3e3991

### 5. Add bridge0 to virsh

> `~/host-bridge.xml`
``` xml
<network>
  <name>host-bridge</name>
  <forward mode="bridge"/>
  <bridge name="br0"/>
</network>
```

``` bash 
sudo virsh net-define host-bridge.xml
sudo virsh net-start host-bridge
sudo virsh net-autostart host-bridge
```


## Network nmcli (RHEL)
setup bridge adapter
    1. Setnew bridge addpter in redhat web ui ? 
        - http://blog.leifmadsen.com/blog/2016/12/01/create-network-bridge-with-nmcli-for-libvirt/
``` bash
nmcli con show --active
interface_to_bridge = "Wired interface name" Device
nmcli con add ifname br0 type bridge con-name br0
nmcli con add type bridge-slave ifname interface_to_bridge master br0
nmcli con modify br0 bridge.stp no
nmcli con down "Wired interface name" 
nmcli con up br0
sudo systemctl restart NetworkManager.service

virsh net-list --all
```

    2. Make brige.xml file
``` xml
<network>
    <name>host-bridge</name>
    <forward mode="bridge"/>
    <bridge name="br0"/>
</network>
```
    3. 
``` bash 
sudo virsh net-define bridge.xml
sudo virsh net-start host-bridge
sudo virsh net-autostart host-bridge
```
    4. When deploying vm, set nic to br0 
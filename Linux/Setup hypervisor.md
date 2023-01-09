install tools [[Libvirt install]]

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
    3. `bash virsh net-define bridge.xml`
    5. When deploying vm, set nic to bridge0 
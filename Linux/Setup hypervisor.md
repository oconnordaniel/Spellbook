install tools [[Setup hypervisor]]

setup bridge adapter
    1. Setnew bridge addpter in redhat web ui ? 
        - http://blog.leifmadsen.com/blog/2016/12/01/create-network-bridge-with-nmcli-for-libvirt/
    2. Make brige.xml file
``` xml
<network>
    <name>host-bridge</name>
    <forward mode="bridge"/>
    <bridge name="br0"/>
</network>
```
    3. `bash virsh net-define bridge.xml`
    4. When deploying vm, set nic to bridge0 
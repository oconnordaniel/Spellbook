# Check for viraul cores availible 
``` bash
# check for hypervisor support
egrep -c '(vmx|svm)' /proc/cpuinfo 

    # install packages ubuntu
sudo apt install bridge-utils libvirt-clients libvirt-daemon-system qemu-kvm -y 

# install packages fedora
sudo dnf install libvirt qemu-kvm virt-install libguestfs-tools libguestfs-tools-c -y

# check for kvm and libvirt groups. add dan to groups
cat /etc/group | grep kvm 
cat /etc/group | grep libvirt
sudo usermod -aG kvm dan
sudo usermod -aG libvirt dan

# add kvm group to images folders
ls -l /var/lib/libvirt 
ls -l /var/lib/libvirt 
sudo chown :kvm /var/lib/libvirt/images
sudo chmod g+rwx /var/lib/libvirt/images
```

8192
4
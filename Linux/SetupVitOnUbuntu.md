# Check for viraul cores availible 
egrep -c '(vmx|svm)' /proc/cpuinfo 

sudo apt install bridge-utils libvirt-clients libvirt-daemon-system qemu-kvm

cat /etc/group | grep kvm 
cat /etc/group | grep libvirt
usermod -aG kvm dan
usermod -aG libvirt dan


ls -l /var/lib/libvirt 
chown :kvm /var/lib/libvirt/images
chmod g+rwx /var/lib/libvirt/images




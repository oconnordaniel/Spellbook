Cloud init tmeplate

https://docs.technotim.live/posts/cloud-init-cloud-image/ 

wget https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64-disk-kvm.img
    or any other image to be base image https://cloud-images.ubuntu.com/

qm create 8000 --memory 2048 --core 2 --name ubuntu-cloud --net0 virtio,bridge=vmbr0
qm importdisk 8000 focal-server-cloudimg-amd64.img local-lvm
qm set 8000 --scsihw virtio-scsi-pci --scsi0 local-lvm:vm-8000-disk-0
qm set 8000 --ide2 local-lvm:cloudinit
qm set 8000 --boot c --bootdisk scsi0
qm set 8000 --serial0 socket --vga serial0

go to 
ProxMox -> machine -> cloudinit -> 
    Set Username, Password, public ssh, and DHCP

Convert to template

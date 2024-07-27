
## Templates

1. Create VM "as is" just with no ISO boot image
2. Also remove the disk image
3. Finish creating
4. Go to hardware -> Add -> Cloud Init
5. Add User, Pass, SSH

Download from https://cloud-images.ubuntu.com/minimal/releases/

```
qm set <VM ID> --serial0 socket --vga serial0
```

### Change the file extension of the image to .qcow2

```
mv ubuntu-22.04-minimal-cloudimg-amd64.img ubuntu-22.04.qcow2
```

### Resize the downloaded cloud image

```
qemu-img resize ubuntu-22.04.qcow2 32G
```

### Import the cloud image into Proxmox

```
qm importdisk 900 ubuntu-22.04.qcow2 local-lvm
```
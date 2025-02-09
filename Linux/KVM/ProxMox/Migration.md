# Migrate disk
## Move Container

https://pve.proxmox.com/pve-docs/pct.1.html
`pct move-volume <vmid> <volume> [<storage>]`
I.e. `pct move-volume 100 rootfs Pool`

May need  `pct shutdown 101`

## Move VM 

https://pve.proxmox.com/pve-docs/qm.1.html
`qm disk move <vmid> <disk> [<storage>] [OPTIONS]`
i.e. `qm move_disk 100 scsi0 Pool`

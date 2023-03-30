Prox:
	Get the Info
		`lshw`
		ls -l /dev/disk/by-id/
		lsblk

	Note what disks / ID go to Prox and what disks got to NAS
		Server > Disks > ZFS > New Pool (Host Pool for VM storage)
		Create VM Don't Start
		Server > Shell >
			`qm set ###  -scsi$ /dev/disk/by-id/{DRIVE-ID}`

The commands you will need to assign your disks to FreeNAS are:

`lsblk`
`ls -l /dev/disk/by-id`
`lshw -class disk -class storage`

`qm set ###  -scsi$ /dev/disk/by-id/{DRIVE-ID}`

Where ### is your VM ID (in my case, 100)
$ is the SCSI port you're using in the VM (SCSI0 is your boot disk, so anything 1-99 should work here, but each drive needs it's own unique port number)
And {DRIVE-ID} is the drive listing from /dev/disk/by-id/ of each disk

https://pve.proxmox.com/wiki/Passthrough_Physical_Disk_to_Virtual_Machine_(VM)

qm set 100  -scsi1 /dev/disk/by-id/ata-CT500MX500SSD1_21032C980E1E

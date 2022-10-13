
MacOS as of Sur
disk0 
	disk0s1 	EFI
	disk0s2		APFS Container
		disk1s1		Mac HD
			disk1s1s1	Sealed System Volume
		
		disk1s2		Mac HD - Data
		disk1s3		PreBoot
		disk1s4		Recovery
		disk1s5		VM

Current Linux
/dev/sda1	EFI
/dev/sda2	Swap
/dev/sda3	Linux EXT4

New Linux with BRTFS

/dev/sda1 	EFI

/dev/sda2	recovery

/dev/sda3 	btrfs Container?
	sda3s1 	Swap
	
	sda3s* 	@
			@home
?			@snapshots
			@root
			@boot
			
			preboot?
			


LinuxOSContainer


Dans-Arch-Laptop



cryptsetup open /dev/sda3 cryptlvm
mount -o subvol=@ /dev/mapper/Linux-system /mnt && 
mount -o subvol=@home /dev/mapper/Linux-system /mnt/home && 
mount /dev/sda1 /mnt/boot && 
arch-chroot /mnt

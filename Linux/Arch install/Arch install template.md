dd bs=4M if=/home/dan/Downloads/archlinux-2021.04.01-x86_64.iso of=/dev/sda status=progress oflag=sync


### Boot the live environment

# ssh in
systemctl enable sshd.service --now
passwd
ip address show
ssh root@<IP-OF-THE-FIRST-PC>


### Setup environment 
# Set the keyboard layout
loadkeys atari-us

# Verify the boot mode
ls /sys/firmware/efi/efivars

# Connect to the internet
# Plus in cable
ping -c 1 archlinux.org

# Update the system clock
timedatectl set-ntp true  # Set to use NetworkTimeProticol
timedatectl set-timezone America/Denver #Set the Timezone
timedatectl status


### Prepare the Disks

# Partition the disks
	# sda1 for efi
	# sda2 for System

gdisk /dev/sda
o # new GPT
n # new EFI part. size +550M, code: EF00
n # defautls 
w # write 

nvme0n1

# encryption container
cryptsetup luksFormat /dev/sda2
cryptsetup open /dev/sda2 cryptlvm
pvcreate /dev/mapper/cryptlvm
vgcreate cryptgroup /dev/mapper/cryptlvm

# format file system

lvcreate -L 8G cryptgroup -n swap
lvcreate -L 32G cryptgroup -n root
lvcreate -l 100%FREE cryptgroup -n home

mkfs.ext4 /dev/cryptgroup/root &&
mkfs.ext4 /dev/cryptgroup/home &&
mkswap /dev/cryptgroup/swap

mount /dev/cryptgroup/root /mnt
mkdir /mnt/home
mount /dev/cryptgroup/home /mnt/home
swapon /dev/cryptgroup/swap

mkfs.fat -F32 /dev/sda1
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot

## if reboot to USB
	cryptsetup open /dev/sda2 cryptlvm
	mount  /dev/cryptgroup/root /mnt &&
	mount /dev/sda1 /mnt/boot &&
	arch-chroot /mnt

### install

reflector

pacstrap /mnt base linux linux-firmware lvm2 vim sudo

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt

ln -sf /usr/share/zoneinfo/America/Denvr /etc/localtime
hwclock --systohc

vim /etc/locale.gen
	uncomment en_US.UTF-8 UTF-8
OR
sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen

locale-gen

echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "KEYMAP=atari-us" > /etc/vconsole.conf

vim /etc/hostname
	Dans-Arch-Laptop
vim /etc/hosts
127.0.0.1	localhost
::1			localhost
127.0.1.1	Dans-Arch-Laptop.localdomain	Dans-Arch-Laptop

### Bootmanager

# init

bootctl --path=/boot install

vim /etc/mkinitcpio.conf
	HOOKS=(base systemd autodetect keyboard sd-vconsole modconf block sd-encrypt lvm2 filesystems fsck)

blkid -s UUID -o value /dev/sda2
	result will be used for <UUID-OF-ROOT-PARTITION>

134dbd4d-e353-4fd8-ac18-54e4a2259322

vim /boot/loader/entries/arch.conf
	title Arch Linux
	linux /vmlinuz-linux
	initrd /intel-ucode.img
	initrd /initramfs-linux.img
	options rd.luks.name=FS_UUID=cryptlvm root=/dev/cryptgroup/root


Failed to execute \vmlinux-linux

vim /boot/loader/loader.conf
	default  arch.conf
	timeout  5
	console-mode max
	editor   no

pacman -S amd-ucode
pacman -S intel-ucode
mkinitcpio -p linux


### user
passwd
	****
useradd -m -g users -G wheel,games,power,optical,storage,scanner,lp,audio,video dan
passwd dan
	****
	
EDITOR=vim visudo
	uncomment %wheel ALL=(ALL) ALL


	
	
### install apps and WM

vim /etc/pacman.conf
	[multilib]
	Include = /etc/pacman.d/mirrorlist

sudo pacman -Syuu

# Network
pacman -S openssh rsync samba rclone networkmanager reflector ufw  remmina remmina-plugin-rdp freerdp network-manager-applet

# Hardware tools
pacman -S hwinfo mesa alsa-utils dosfstools hwdetect lshw mtools
pacman -S pulseaudio xfce4-pulseaudio-plugin pulseaudio-alsa pavucontrol

AUR xfce4-volumed-pulse

# Window Manager
pacman -S xorg plasma sddm sddm-kcm
pacman -S xfce4 lightdm xorg-server lightdm-gtk-greeter xfce4-goodies
pacman -S breeze breeze-gtk
pacman -S xfce4-clipman-plugin

# build tools
pacman -S autoconf automake cmake fakeroot autoconf git make wget expac jq jshon packer patch gcc tree pkgconf

# apps
pacman -S firefox kate thunderbird tilix cronie thunar

# VirtualBox
pacman -S virtualbox virtualbox-host-modules-arch virtualbox-guest-dkms virtualbox-guest-utils

AUR virtualbox-ext-oracle


#AUR


git clone https://aur.archlinux.org/package_name.git
cd
makepkg -si

### services
systemctl enable NetworkManager
systemctl enable sshd
systemctl enable xrdp
systemctl enable sddm
systemctl enable lightdm

vim /etc/lightdm/lightdm.conf
	greeter-session=lightdm-gtk-greeter


### exit and reboot
exit &&
umount -R /mnt && 
reboot
tmux
# post
themes
	xfconf-query -c xfwm4 -p /general/mousewheel_rollup -s false
ssh-keys 
scripts

### SMB config

cd /etc/samba
wget https://git.samba.org/samba.git/?p=samba.git;a=blob_plain;f=examples/smb.conf.default;hb=HEAD
mv that_file smb.conf

mkdir /etc/samba/credentials &&
touch /etc/samba/credentials/share

vim /etc/samba/credentials/share
	username=
	password=

chown root:root /etc/samba/credentials &&
chmod 700 /etc/samba/credentials &&
chmod 600 /etc/samba/credentials/share

credentials=/etc/samba/credentials/share
	sudo mount.cifs //192.168.2.101/Storage /mnt/Storage -o credentials=/etc/samba/credentials/share,uid=dan

# Add to /etf/fstab
//dans-smb.lan/Storage /mnt/Storage cifs noperm,_netdev,credentials=/etc/samba/credentials/share,uid=dan 0 0

### Fixed Static IP
ip address show
ip address add *address/prefix_len* broadcast + dev *interface*
ip address del *address/prefix_len* dev *interface*
ip address flush dev *interface*

### ufw
sudo ufw status
sudo ufw allow proto tcp from 192.168.2.0/24 to any port ###
sudo ufw reload
sudo ufw enable
sudo systemctl enable ufw.service

22		ssh
3389	Microsoft Terminal Server

### ssh config
ssh-keygen -t rsa -b 4096
ssh-copy-id remote_user@remote_IP
chmod 600 .ssh/authorized_keys && chmod 700 .ssh
ssh-add

### rdp config
AUR remmina-plugin-rdp
AUR xrdp

https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system

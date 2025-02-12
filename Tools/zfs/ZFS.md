# Set up ZFS pool 

## Install

Update packages and install ZFS utils

`apt update && apt upgrade`  
`apt install zfsutils-linux zfs-auto-snapshot`

Build from source

`https://openzfs.github.io/openzfs-docs/Developer%20Resources/Building%20ZFS.html`

Wipe disks to be used

`gdisk /dev/sdX`
`p print`
`o new gpt partition table`
`w write`

## Create

Create ZFS Pool

`zpool create [Pool Name] raidzX -m /mnt/[mount point] /dev/sdX -o ashift=12`

Create ZFS File system

`zfs create [Pool Name]/[FS Name] -o compression=on -o encryption=on -o keylocation=prompt -o keyformat=passphrase`

To mount encrpted

`zfs load-key -r [pool]/[fs]`

`zfs mount -a`

## Snapshots

Ceate

`zfs snapshot [pool]/[filesystem]@[snapshot name]`

Rollback pool

`zfs rollback pool/filesystem@thursday`

Restore file

`cd [file location]`

`cd .zsh` (wont show up under ls -la)

`cd snapshot`

`cd [snapshot name]`

`ls`

## send recv

***Setup User Permissions***

1. Create Service User on Send
2. Set ZFS permissions
4. Create Service User on Recv
5. Set ZFS permissions
6. Create SSH key on Recv
7. ssh-copy-id from Recv to Send

``` bash
zfs snapshot and zfs replication is handled by sanoid
configs are in ansible IaC

ssh [remote ip] zfs send -vi Path/to/Dataset | zfs receive BackupFS/BackupLocation
/bin/ssh [remote ip] /sbin/zsh send -vi Path/to/Dataset@snapshot | /bin/zfs receive BackupFS/BackupLocation

/sbin/zfs send -vi Storage/StorageFS@zfs-auto-snap_daily-$(date -d "yesterday" '+%Y-%m-%d')-1225 Storage/StorageFS@zfs-auto-snap_daily-$(date '+%Y-%m-%d')-1225 | /sbin/zfs receive Backup/BackupFS
```

### Send full snapshots

On sending system:
`zfs snapshot -r Pool/Dataset@snapshot`

Then on receiving system:
`ssh user@ip_address /sbin/zfs send -v -R Pool/Dataset@snapshot | /sbin/zfs receive New_Pool/New_Dataset`

## Scrub

`zpool scrub [Pool Name]`

Cron Scrub

`0 1 * * 0 /usr/sbin/zpool scrub [Pool Name]`

Cron Snapshots

`0 0 * * * /usr/sbin/zfs snapshot [pool]/[FS]@snapshot-$(date '+%Y-%m-%d')`

ZFS permissions:

`zfs allow [permission],[permission] [user]`
[Docs](https://docs.oracle.com/cd/E19253-01/819-5461/gfkco/index.html)

## Links

Installing ZFS on ubuntu:

- <https://ubuntu.com/tutorials/setup-zfs-storage-pool#3-creating-a-zfs-pool>
- <https://openzfs.github.io/openzfs-docs/Getting%20Started/Ubuntu/index.html>

Importing:

- <https://docs.oracle.com/cd/E19253-01/819-5461/gazuf/index.html>

Compression:

- <https://linuxhint.com/enable-zfs-compression/>

Encryption:

- <https://arstechnica.com/gadgets/2021/06/a-quick-start-guide-to-openzfs-native-encryption/>

Snapshots:

- <https://www.thegeeksearch.com/beginners-guide-to-zfs-snapshots/>

Replication:

- [Klara - Introduction to ZFS Replication](https://klarasystems.com/articles/introduction-to-zfs-replication/)

# SMB

## Back up shares on proxmox

``` toml
[sharename]
    comment = sharename
    path = /mnt/pool/fs
    write list = @samba
    valid users = @samba
    writeable = Yes
```

``` bash
sudo adduser --no-create-home --disabled-password --disabled-login <service>
sudo usermod -aG samba <service>
sudo usermod -aG samba dan
sudo chown -R root:samba /mnt/<pool>/<fs>
sudo chmod -R 770 /mnt/pool/<fs>

sudo smbpasswd -a <service>
sudo smbpasswd -a dan
sudo systemctl restart smbd
```

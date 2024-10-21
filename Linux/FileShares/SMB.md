
Back up shares on proxmox 

``` toml
[ProxBack]
    comment = ProxBack
    path = /mnt/Vault/ProxBack
    write list = @sudo
    valid users = @sudo
    writeable = Yes
```

``` bash
sudo adduser --no-create-home --disabled-password --disabled-login proxmox
sudo usermod -aG sudo proxmox
sudo chown -R root:sudo /mnt/Vault/ProxBack
sudo chmod -R 770 /mnt/Vault/ProxBack
sudo systemctl restart smbd
```


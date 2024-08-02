## Install

https://www.zabbix.com/download?zabbix=6.0&os_distribution=ubuntu&os_version=22.04&components=server_frontend_agent&db=pgsql&ws=apache

```
sudo su root

wget https://repo.zabbix.com/zabbix/6.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.0-4+ubuntu22.04_all.deb
dpkg -i zabbix-release_6.0-4+ubuntu22.04_all.deb
apt update

apt install zabbix-server-pgsql zabbix-frontend-php php8.1-pgsql zabbix-apache-conf zabbix-sql-scripts zabbix-agent postgresql

sudo -u postgres createuser --pwprompt zabbix 
sudo -u postgres createdb -O zabbix zabbix

cat /usr/share/zabbix-sql-scripts/postgresql/server.sql.gz | sudo -u zabbix psql zabbix
```

Edit `/etc/zabbix/zabbix_server.conf`

`DBPassword=password`

vim ``/etc/locale.gen`
	uncomment `en_US.UTF-8 UTF-8`
OR
`sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen`

`systemctl restart zabbix-server zabbix-agent apache2   # systemctl enable zabbix-server zabbix-agent apache2`

[Agent Download](https://www.zabbix.com/download_agents?version=6.0+LTS&release=6.0.3&os=Linux&os_version=4.12&hardware=ppc64le&encryption=No+encryption&packaging=Archive&show_legacy=0)


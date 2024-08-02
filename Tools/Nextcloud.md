# Nextcloud

Installed via [LearnLinuxTV guide](https://www.youtube.com/watch?v=teUlz635ZoA)

<https://www.learnlinux.tv/nextcloud-full-setup-implementation-guide/>

### Server

Setup EC2 Instance

- t2. med
- SecGroups for 
    - 80 from home
    - 442 from home
    - 8080 from home
    - 8443 from home

`wget https://download.nextcloud.com/server/releases/latest.zip`

### MariaDB

`apt install mariadb-service`
`systemctl status mariadb`
`sudo mysql_secure_installation`
`sudo mariadb`
`create database nextcloud;`
`GRANT ALL PRIVILEGES ON nextcloud.* TO 'nextcloud'@'localhost' IDENTIFIED BY 'password_goes_here';`
`FLUSH PRIVILEGES`

### Apache / PHP

``` bash
sudo apt install \
    php \
    php-apcu \
    php-bcmath \
    php-cli \
    php-common \
    php-curl \
    php-gd \
    php-gmp \
    php-imagick \
    php-intl \
    php-mbstring \
    php-mysql \
    php-zip \
    php-xml \
    libmagickcore-6.q16-6-extra 
```

`systemctl status apache2`
`sudo phpenmod bcmath imagick intl`

### unzip

``` bash
unzip latest.zip
sudo chown -R www-data:www-data nextcloud/
sudo mv nextcloud nextcloud.oconnordaniel.com 
sudo mv nextcloud.oconnordaniel.com /var/www/
sudo a2dissite 000-default.conf  
```

`sudo vim /etc/apache2/sites-available/nextcloud.oconnordaniel.com.conf`

``` conf
<VirtualHost *:80>
    DocumentRoot "/var/www/nextcloud.oconnordaniel.com"
    ServerName nextcloud.oconnordaniel.com
    Redirect permanent / https://cloud.nextcloud.com/

    <Directory "/var/www/nextcloud.oconnordaniel.com/">
        Options MultiViews FollowSymlinks
        AllowOverride All
        Order allow,deny
        Allow from all
    </Directory>

    TransferLog /var/log/apache2/nextcloud.oconnordaniel.com_access.log
    ErrorLog /var/log/apache2/nextcloud.oconnordaniel.com_error.log
</VirtualHost>
```

```
sudo a2ensite nextcloud.oconnordaniel.com.conf
```

### Config PHP

``` bash
sudo vim /etc/php/7.4/apache2/php.ini
```

Adjust the following parameters:
```
memory_limit = 512M
upload_max_filesize = 200M
max_execution_time = 360
post_max_size = 200M
date.timezone = America/Detroit
opcache.enable=1
opcache.interned_strings_buffer=8
opcache.max_accelerated_files=10000
opcache.memory_consumption=128
opcache.save_comments=1
opcache.revalidate_freq=1
```
`sudo a2enmod dir env headers mime rewrite ssl`

```
sudo chmod 660 /var/www/<nextcloud_directory>/config/config.php
sudo chown root:www-data /var/www/<nextcloud_directory/config/config.php
```

`sudo systemctl restart apache2`

###  Cert

### Dashboard

sudo snap install --classic certbot
sudo ln -s /snap/bin/certbot /usr/bin/certbot
sudo certbot --apache

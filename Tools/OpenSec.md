# OpenSec

## Prerequisites

- platform:
    amd64
    arm64
    armhf
- 1 CPU core
- 100mb of free RAM
- 1GB of free disk space

Open Ports:
    6060/tcp: Prometheus metrics port
    8080/tcp: API port

## Curl to Bash

`curl -s https://install.crowdsec.net | sudo sh`

[CrowdSec Docs](https://docs.crowdsec.net/u/getting_started/installation/linux/#manual-repository-installation)

## Manual installation steps

``` bash
sudo apt update
sudo apt install -y \
    debian-archive-keyring \
    curl \
    gnupg \
    apt-transport-https

if apt -v >= 1.1

mkdir -p /etc/apt/keyrings/

curl -fsSL https://packagecloud.io/crowdsec/crowdsec/gpgkey | gpg --dearmor > /etc/apt/keyrings/crowdsec_crowdsec-archive-keyring.gpg

deb [signed-by=/etc/apt/keyrings/crowdsec_crowdsec-archive-keyring.gpg] https://packagecloud.io/crowdsec/crowdsec/any any main

deb-src [signed-by=/etc/apt/keyrings/crowdsec_crowdsec-archive-keyring.gpg] https://packagecloud.io/crowdsec/crowdsec/any any main 

sudo apt update

apt install crowdsec
```

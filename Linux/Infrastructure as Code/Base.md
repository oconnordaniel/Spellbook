# Notes on basics for infrastructure as code

## Jenkins

Install Jenkins on Ubuntu 22.04
<https://www.jenkins.io/doc/book/installing/linux/>

Pre-requisites

2 GB Ram
10 GB Disk Space

```bash
# Install Jenkins
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt update
sudo apt install jenkins

# Install Java
sudo apt install openjdk-11-jre

sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins

sudo ufw allow 8080
sudo ufw allow OpenSSH
sudo ufw enable
sudo ufw status
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

Sing in to the Jenkins dashboard at `http://<ip_address>:8080` and enter the initial admin password to set up the admin account.

## Terraform

Install Terraform on Ubuntu 22.04

<https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli>

```bash
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common

wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update && sudo apt-get install -y terraform
```

## Ansible

Install Ansible on Ubuntu 22.04

```bash
sudo apt update
sudo apt install python3 python3-pip
python3 -m pip install --user ansible
```

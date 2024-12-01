Setup Wazuh (server?) to sent /log/wazuh/alerts to graylog and have graylog send it’s logs to wazuh indexer instead of it’s own Elastic index

IP and Hostname mappings

```
wazuh       		IN      A       10.10.10.154
openvas     		IN      A       10.10.10.161
wazuh-dash  		IN      A       10.10.10.160
wazuh-index1 		IN      A       10.10.10.175
wazuh-server 		IN      A       10.10.10.162
graylog     		IN      A       10.10.10.163
opensearch          IN      A       10.10.10.168
grafana     		IN      A       10.10.10.165
hive        		IN      A       10.10.10.164
iris        		IN      A       10.10.10.164
cortex      		IN      A       10.10.10.166
misp        		IN      A       10.10.10.172
shuffle     		IN      A       10.10.10.169
prometheus          IN      A       10.10.10.167
ntfy                IN      A       10.10.10.111
```

## Spin up VMs

Indexer, Server, Dashboard, and Graylog.

Terraform to spin up vm. To spec:

- [Wazuh Hardware Recs - Indexer](https://documentation.wazuh.com/current/installation-guide/wazuh-indexer/index.html#hardware-recommendations) 4GB Ram, 2 cpus
- [Wazuh Hardware Recs - Server](https://documentation.wazuh.com/current/installation-guide/wazuh-server/index.html#hardware-requirements) 2GB Ram, 2 cpus
- [Wazuh Hardware Recs - Dahsboard](https://documentation.wazuh.com/current/installation-guide/wazuh-dashboard/index.html#hardware-requirements) 4GB Ram, 2 cpus
    - Combine Server and Dash - 8GB Ram and 4 cpu
- [Graylog - Planning](https://go2docs.graylog.org/6-0/planning_your_deployment/planning_your_deployment.html?tocpath=Planning%20Your%20Deployment%7C_____0#CapacityPlanning) 16 GB Ram, 8 cpu - Just for ingest note.
    - Recommends 24GB Ram and 8 CPU for Elastic / OpenSearch / Wazuh Index


## Sign certs

### Wazuh

[Wazuh - Cert config docs](https://documentation.wazuh.com/current/user-manual/wazuh-dashboard/certificates.html)

Create the config file.

```
nodes:
  # Wazuh indexer nodes
  indexer:
    - name: wazih-index1.oconnordaniel.lan
      ip: "10.10.10.175"

  # Wazuh server nodes
  server:
    - name: wazuh.oconnordaniel.lan
      ip: "10.10.10.154"
 

  # Wazuh dashboard nodes
  dashboard:
    - name: wazuh.oconnordaniel.lan
      ip: "10.10.10.154"
```

Use the cert tool to make all the needed certs

```
bash wazuh-certs-tool.sh -A OConnorDaniel-ca.pem  OConnorDaniel-ca-key.pem 
```

### Graylog

Sign graylog.oconnordaniel.lan with the OConnorDaniel-ca.pem key using the [Cheaty SSL script](https://github.com/oconnordaniel/Knowledge/blob/a7d51b73d1595371e0a6633eead0428c458889b2/Networking/Cheaty%20SSL%20script.md)

### Other

All other certs “should” be signed by the [Cheaty SSL script](https://github.com/oconnordaniel/Knowledge/blob/a7d51b73d1595371e0a6633eead0428c458889b2/Networking/Cheaty%20SSL%20script.md)

## Wazuh install and configure

### Indexer

[Wazuh Indexer Install guide](https://documentation.wazuh.com/current/installation-guide/wazuh-indexer/index.html)

1. Install the repos
2. Install the apt package
3. Configure the local certs

### Dashboard

[Wazuh Dashboard Install guide](https://documentation.wazuh.com/current/installation-guide/wazuh-dashboard/step-by-step.html)

1. Install the repos
2. Install the apt package
3. Configure the local certs

### Graylog

Setup Mongo DB [Mango DB Install guide](https://www.mongodb.com/docs/v7.0/tutorial/install-mongodb-on-debian/)

Install Graylog [Graylog install guide](https://go2docs.graylog.org/6-0/downloading_and_installing_graylog/debian_installation.htm?tocpath=Installing%20Graylog%7COperating%20System%20Packages%7C_____4#Graylog)

Need to learn:

- How to point graylog at the Wazuh-Index for it’s data
- Need to figure out how to get Graylog to trust the indexers with the certs.

### Server

[Wazuh Server Install guide](https://documentation.wazuh.com/current/installation-guide/wazuh-server/step-by-step.html)

1. Install the repos
2. Install the apt package
3. Configure the local certs

# Overview Doc

## Requirements

### Level 1:

Logs

### Level 2:

Metrics

Events

### Level 3:

Dashboards

Alarms - Prom ?, Grafana ?

## Tool Options

- Nagios
- Uptime Kuma
- Zabbix
- Prometheus - Metrics Based and mostly time services based. Not good at handling log files.
- Influx DB
- Graylog - Great for log files
- Grafana 

## Ideas

Setup a Graylog server
Setup a Prom or Influx server
Setup a Grafana server
Each server needs a way to send logs to Graylog
Each server should have metrics pulled by Influx
Grafana hooks into Graylog and Influx to monitor systems. 
Alarms? 
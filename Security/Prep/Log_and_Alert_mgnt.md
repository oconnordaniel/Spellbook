
# Log and Alert Management

How to start from 0

## Itentify Soucres of Logs

- Workstations
- Servers
- Network Devices
- Applications
- Cloud Services / Applications
- Identity Providers

## For each source, think about how you're going to detect "Bad" activity.

### Workstations

#### Windows

EDR tool
Sysmon

#### MacOS

#### Linux


### Servers

WinLog + SysMon
SystemD journald (depends on the server's role)

### Network Devices

Snort / Suricata

### Applications

App specific logs

### Cloud Services / Applications

### Identity Providers

Azure AD / Okta / Google Workspace

Each of these will have sign in logs, and admin activity logs

## Centralize the logs

SIEM 101... send all the logs to a single place.

## Pre-enrichment

Once all the logs are in one place, you can start to analyze them...

Step once is Enrichment:

https://schema.ocsf.io/1.6.0/objects/observable

As each log comes in, add context to it. Each type of observable should be:

- Mapped to a standard naming convention
- Mapped to a standard data type (ie string, integer, boolean, IP, timestamp, etc)
- Be giving enrichment data via lookups (

    IPs -> GeoIP, ASN, Whois
    IPs -> is Internal or External
    IPs -> Reputation
    HostNames -> IPs
    IPs -> HostNames

    Usernames -> Full Name

    Hash values -> File names
    Hash values -> Virus Total reputation

    etc, 

## Pattern Matching

Three ways to identify "Bad"

1. Enrichment data says "bad" (ie IP reputation is bad, hash reputation is bad, etc)
2. Pattern matching on the log data itself (ie Event ID 4625, multiple failed logins, etc)
3. Using an external tool that will do the pattern matching for you (ie Snort / Suricata, EDR tool, etc)

For 1, it's just a matter of enriching logs as they come in, and then alerting on the enrichment data.

2 is good for known patterns of bad activity.

3 is good for data source that you don't have the resources to analyze yourself. Unless you have a dedicated set of
teams for network traffic analysis, or host based analysis, CTI, etc. it's better to use a tool that specializes in
that.


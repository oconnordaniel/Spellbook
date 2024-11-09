# Security Overview

## NIST Forensic Process

### Collect - Media

Most volatile to least volatile

- Running Processes
- Memory
- Network
- Disk
    - NTFS file system
        - `$MFT` - Master file table
        - `$LogFIle` - Tracks MFT metadata changes
        - `$UsnJrnl` - Tracks file changes
    - Windows Registry
    - Windows Event Logs
    - Windows Prefetch
- Logs 

Maintain Chain of Custody
    - Hash of the data. Memory, Disk, etc.

### Examine - Data

### Analyze - Information

### Report - Evidence

## PICERL Playbook

### Preparation

- Knowing is half the battle - Identify assets that require protection
- Organization Stance - Contain immediately vs watch and learn.
- Lay of the Land - Knowing everything in the env.
- Log Sources
- Monitoring
- Policies and Procedures (Can they be enforced with tech or only humans)
- Notification (Who is notified; tech, management, legal/law)
- Recovery (Clean up vs nuke)
- Team - Who's the team, what are their rolls.

### Identification

How did they get in? 
Where did they go? 
What have they done? 

- Sources
  - Network Devices
  - Firewall Logs
  - IDR/IPS
  - Hosts - Win Events, SysMon, Syslog
  - Host EDS or AntiVirus
  - Users
- Verification
- Triage

### Containment

### Eradication

### Recovery

### Lessons

## From CS report

1. IMMEDIATE THREAT VISIBILITY
2. ACTIVE THREAT CONTAINMENT
3. ACCELERATED FORENSIC ANALYSIS
4. REAL-TIME RESPONSE AND RECOVERY
5. ENTERPRISE REMEDIATION
6. THREAT HUNTING AND MONITORING
7. MANAGED DETECTION AND RESPONSE


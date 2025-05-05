
Incident Response

# Security Events vs Security Incidents

# Life Cycle of an Incident

- Preparation
- Identification
- Containment
- Eradication
- Recovery
- Lessons Learned

 

# Preparation

## Incident Response Plan

## Incident Response Teams

- Incident Commander
- Security Analysts
- Forensic Analysts
- Threat Intelligence Analysts
- Management/C-Suite/Stakeholders
    - Chief Information Security Officer (CISO)
    - Chief Operations Officer (COO)
    - Chief Technology Officer (CTO)
- Human Resources
- Public Relations
- Legal

## Asset inventory

- Desktops/Laptops
- Servers (physical, virtual, and cloud)
- Applications (on-prem and SaaS)
- Printers
- Internet-of-Things Devices 
- Network Devices 
- Mobile Devices

## Risk Assessments

A risk assessment works to determine the systems that are the most critical to the business

- Transfer the risk (such as purchasing insurance)
- Accept the risk (a decision that is made to not spend any resources as the impact would be low and the cost too high)
- Mitigate the risk (apply security and other controls to protect the asset and reduce the risk)
- Avoid the risk (an asset that is at too high a risk may simply be taken offline so it can’t be exploited)

# Detection & Analysis

# Clean Up

## Containment

Containment strategies should be considered on a per asset basis. 
- What systems are affected?
- Do the attackers have execution on hosts? Or high level accounts on SaaS? Or cloud / IaaS / PaaS accounts? 
- Do those systems serve a critical function? Can they go offline?
- How can **we** connect to them them when isolating lateral movement or callback?

Short-term containment? - Quick fix to stop the bleeding and prevent additional issues.
- Host isolation
- Blocking attacker IPs
Long-term containment? - Permanent solution that pervents the issue from happening again. 
- Patching vulnerabilities
- Re-configuring access (least privilege)

### Containment Measures

**Perimeter Containment**

- Block inbound traffic and outbound traffic.
- IDS/IPS Filters to identify further malicious traffic and take automated actions, such as blocking active connections.
- Web Application Firewall policies, to detect and take action against web attacks.
- Null route DNS, to prevent DNS resolutions so internal hosts cannot find the IP address of a given domain name and establish a connection.

**Network Containment**

- Switch-based VLAN isolation, to restrict network access.
- Router-based segment isolation, to restrict network access.
- Port blocking, to prevent connections on specific ports.
- IP or MAC Address blocking, to restrict network access.
- Access Control Lists (ACLs), to provide rules that restrict what hosts on the network can and cannot do.

**Endpoint Containment**

- Disconnecting the infected system from any network connections (turning WiFi off, pulling ethernet cable).
- Powering off the infected system.
- Blocking rules in the local firewall.
- Host intrusion prevention system (HIPS) actions, such as device isolation.

### Validation 
**Validate the containment was effective before assuming and moving on!!**

### Forensics

Before moving on to eradication, consider taking forensic images of affected systems for later Lessons

## Eradication

## Recovery


# Lessons Learned & Reporting

Record the timeline for response actions, not just attack actions.

- What Went Well?
- What Could be Improved?
    - More budget for humans?
    - More buget for tools?
    - Better coms with security teams?
    - Better coms for non-security teams? 
    - Better Runbooks?

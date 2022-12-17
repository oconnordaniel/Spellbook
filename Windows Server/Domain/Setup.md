## Install 

## AD Domain Services

Do I want to setup as DHCP server? 
Do I want to setup as DNS server? 

1. Ensure your DC has a static IP address
2. Server Manager
3. Add Roles and Features
4. At "Server Roles" select "Active Directory Domain Services" 
5. Optinally "DHCP server" and "DNS Server"
6. Click next to confirm
7. Once finished, Reboot
- Promote to Domain Controller
8. Run Active Directory Domain Services Configuration Wizard
9. Select 'Add a new forest' and enter the domain name
10. Select forest function level, and DSRM password
11. Next though netbois name
12. Next though paths
13. If prereq checks pass then install and reboot

### DHCP 
1. Open DHCP
2. Server > IPv4 > Right-click > New scope
3. Define scope according to network needs

### DNS






-- Research
What's the dunction of a DSRM password
What's a Read Only Domain Controler
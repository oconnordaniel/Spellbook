## Records

### DMARC

v=DMARC1
p=
- **none**, **quarantine**, reject

ptc= 
- number between 0 and 100 as a percent of message to be applied.
- 

fo= 

Failure Reporting Options(fo) 
-   **fo=0**: Generate a DMARC failure report if all underlying authentication mechanisms (SPF and DKIM) fail to produce an aligned “pass” result. (Default)
-   **fo=1**: Generate a DMARC failure report if any underlying authentication mechanism (SPF or DKIM) produced something other than an aligned “pass” result. (Recommended)
-   **fo=d**: Generate a DKIM failure report if the message had a signature that failed evaluation, regardless of its alignment.
-   **fo=s**: Generate an SPF failure report if the message failed SPF evaluation, regardless of its alignment.


rua=mailto:
report types—aggregate
ruf= 
report types—forensic
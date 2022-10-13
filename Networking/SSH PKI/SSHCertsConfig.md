# Things to do... 

### SSH stuff
	Certs
	
	Steps:
	Setup CA server
	
	For each host
		Import CA into OS's
			rsync -v dan@192.168.2.101:/mnt/SSDStorage/Documentation/ca.crt ~/.ssh/
			sudo cp ~/.ssh/ca.crt /usr/local/share/ca-certificates/
			sudo update-ca-certificates

		ssh-keygen ¬

		/etc/ssh/sshd_config > 
# Path to the CA public key for verifying user certificates
TrustedUserCAKeys /etc/ssh/ssh_user_key.pub

# Path to this host's private key and certificate
HostKey /etc/ssh/ssh_host_ecdsa_key
HostCertificate /etc/ssh/ssh_host_ecdsa_key-cert.pub

		ssh-keygen -s ~/.ssh/id_rsa -I Zera_ID -n dan -V +52w -h /home/dan/.ssh/id_rsa.pub
			

	
	For each client
		Import CA into OS's
			rsync -v dan@192.168.2.101:/mnt/SSDStorage/Documentation/ca.crt ~/.ssh/
			sudo cp ~/.ssh/ca.crt /usr/local/share/ca-certificates/
			sudo update-ca-certificates
		
		ssh-keygen ¬
			
		ssh-keygen -s /home/dan/.ssh/id_rsa -I Zera_ID -n dan -V +52w /home/dan/.ssh/id_rsa.pub
			
	~/.ssh/known_hosts			
@cert-authority Zera_ID ssh-rsa < AAAA public key = > 
			
			
			
		
		
		
		
`$ ssh-keygen -L -f id_ecdsa-cert.pub`
Example cert:
```
id_ecdsa-cert.pub:
        Type: ecdsa-sha2-nistp256-cert-v01@openssh.com user certificate
        Public key: ECDSA-CERT SHA256:O6M6oIjDm5gPm1/aTY619BgC3KSpS4c3aHVWxYh/uGQ
        Signing CA: ECDSA SHA256:EY2EXJGoPv2LA6yEbjH+sf9JjG9Rd45FH1Wt/6H1k7Y
        Key ID: "mike@example.com"
        Serial: 4309995459650363134
        Valid: from 2019-09-11T14:50:01 to 2019-09-11T18:50:01
        Principals:
                mike
        Critical Options: (none)
        Extensions:
                permit-X11-forwarding
                permit-agent-forwarding
                permit-port-forwarding
                permit-pty
                permit-user-rc
```

On each host > 

/etc/ssh/sshd_config

```
# Path to the CA public key for verifying user certificates
TrustedUserCAKeys /etc/ssh/ssh_user_key.pub

# Path to this host's private key and certificate
HostKey /etc/ssh/ssh_host_ecdsa_key
HostCertificate /etc/ssh/ssh_host_ecdsa_key-cert.pub
```

On each client > 
```
~/.ssh/known_hosts
@cert-authority *.example.com ecdsa-sha2-nistp256 AAAAE...=
```

Via youtube guy
	https://youtu.be/Lqbtn0Gjnho

ssh-keygen -t rsa -f ca
cat ca.pub

touch /etc/ssh/ca.pub

echo ca.pub > /etc/ssh/ca.pub

echo "TrustedUserCAKeys /etc/ssh/ca.pub" > /etc/ssh/sshd_config 

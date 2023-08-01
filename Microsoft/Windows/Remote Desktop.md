### Setup RDC on a computer 
(to allow users to remote in):
1. Remote into computer
2. Go to Settings -> Remote Desktop
3. Enable Remote Desktop
4. Change settings to prevent sleep if needed, and make the PC discoverable
5. Take note of the PC name to connect 
6. If other users need access besides the main user:
	1. Control Panel -> System -> Allow remote access to your computer
	2. Select the Remote tab
	3. Click Select Users to add the user
	4. Add the AD account usernames, or add security group for all users
7. Most clients will use a VPN connection to allow connection into internal network
8. Otherwise, need to setup port forwarding 
9. If can't connect, check that Remote Desktop is allowed through Windows Firewall
	1. Control Panel -> System Security
	2. Click on Windows Firewall
	3. Scroll down to Remote Desktop, check the check boxes to enable

### To Remote into Computer
 - Need credentials: computer name and login
 - Computer name: get from settings, or use interal IP
 - Login credentials should be domain credentials
	 - For example: domain`\username
	 - Password: domain password

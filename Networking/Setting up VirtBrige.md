bring link down 

ip link set <interface> down 

ip addr del <ip> dev <interface> 

turn off systemd-networkd 
turn off NetworkManager

ip link add name br0 type bridge
ip link set eno1 master br0 

sudo ip addr add <address>/XX dev br0 brd xxx.xxx.255.255

ip link set up <interface>
ip link set up br0

route add default gw <gateway_ip>   
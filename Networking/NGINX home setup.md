# Setup NGINX Proxy Manager for home lab

1. Setup nginx proxy manger homelab with the 80, 81, and 443 ports exposed
    <https://nginxproxymanager.com/guide/#quick-setup>
2. Forward ports 80 and 443 from Firewall to nginx
3. Setup DNS to point `.\.oconnordaniel.com` to NGINX PM (via the IP address of the nginx vm)

For each service:

1. On public DNS, point `app_name.oconnordaniel.com` to the public IP of the server (this can be done with or without cloudflare proxy)
2. Sign into the nginx dashboard and request a cert for that sight.
3. Add a new proxy host for `app_name.oconnordaniel.com`
    - point it at the ip address of the server
    - add the port.
    - Check Block Common Exploits
    - Use the ssl generated for that server.
    - Check Force SSL

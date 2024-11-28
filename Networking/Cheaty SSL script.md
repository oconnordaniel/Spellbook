
Cheaty bash script to make certs. 
This assumes you've already created the root ca

``` bash
ORG=OConnorDaniel
openssl genrsa -aes256 -out $ORG-ca-key.pem 4096
openssl req -new -x509 -sha256 -days 1095 -key $ORG-ca-key.pem -out $ORG-ca.pem
```

Root CA and site are hard coded. Script will as for new new service name and service IP

``` bash
SERVICE=$1
SITE=oconnordaniel.lan
ORG=OConnorDaniel
IP=$2

if [ -z "${SERVICE}" ]; then
    echo "No variable for SERVICE set. Please time service name:"
    read SERVICE
    echo "Service set to ${SERVICE}"
else
    echo "Service set to ${SERVICE}"
fi

if [ -z "${IP}" ]; then
    echo "No variable for IP set. Please time IP name:"
    read IP
    echo "IP set to ${IP}"
else
    echo "IP set to ${IP}"
fi

mkdir -p -v ${SERVICE}

openssl genrsa -out $SERVICE/$SERVICE.$SITE-key.pem 4096

openssl req -new -sha256 -subj "/CN=$SERVICE.$SITE" -key $SERVICE/$SERVICE.$SITE-key.pem -out $SERVICE/$SERVICE.$SITE.csr
echo "subjectAltName=DNS:$SERVICE.$SITE,IP:$IP" >> $SERVICE/$SERVICE.$SITE-extfile.cnf
echo extendedKeyUsage = serverAuth >> $SERVICE/$SERVICE.$SITE-extfile.cnf

openssl x509 -req  -sha256 -days 1095  -CA $ORG-ca.pem -CAkey $ORG-ca-key.pem  -in $SERVICE/$SERVICE.$SITE.csr  -extfile $SERVICE/$SERVICE.$SITE-extfile.cnf  -CAcreateserial  -out $SERVICE/$SERVICE.$SITE-cert.pem

cat $SERVICE/$SERVICE.$SITE-cert.pem >> $SERVICE/$SERVICE.$SITE-full.pem
cat $ORG-ca.pem >> ./$SERVICE/$SERVICE.$SITE-full.pem
```

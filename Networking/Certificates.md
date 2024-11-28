# SSL Certificates

## Step 1: Create CA

Setup a CA.pem as the root cert.

`ORG=org_name` pick an org name. Useful for consistancy

```shell
openssl genrsa -aes256 -out $ORG-ca-key.pem 4096
```

This will need to be password protected.

Generate a public CA Cert signed by the root cert.

```shell
openssl req -new -x509 -sha256 -days 1095 -key $ORG-ca-key.pem -out $ORG-ca.pem
```

Reading Certs

``` shell
openssl x509 -in $ORG-ca.pem -text
openssl x509 -in $ORG-ca.pem -purpose -noout -text
```

## Step 2: Generate Cert for Service

`$SERVICE` should be something like `toaster.oconnordaniel.lan`
This is not needed, but helps naming consistency.

`SERVICE=toaster.oconnordaniel.lan` <- set the environment variable

Create an RSA key for the service.

```shell
openssl genrsa -out $SERVICE-key.pem 4096
```

Create a Certificate Signing Request (CSR) for our service.

```shell
openssl req -new -sha256 -subj "/CN=$SERVICE" -key $SERVICE-key.pem -out $SERVICE.csr
```

SFr SAN (Subject alt names).

``` shell
echo "subjectAltName=DNS:$SERVICE,IP:10.10.10.1" >> $SERVICE-extfile.cnf
```

optional

``` shell
echo extendedKeyUsage = serverAuth >> $SERVICE-extfile.cnf
```

## Step 3: Sign the CSR with the Root

``` shell
openssl x509 -req \ # Create an x509
    -sha256 -days 1095 \ # options for key lenth and days
    -CA $ORG-ca.pem -CAkey $ORG-ca-key.pem \ # our RootCA keys
    -in $SERVICE.csr \ # take in the Cert Sign Request
    -extfile $SERVICE-extfile.cnf \ # the SAN and Extra info
    -CAcreateserial \ # serial number
    -out $SERVICE-cert.pem 


    
openssl x509 -req \
    -sha256 -days 1095 \
    -CA $ORG-ca.pem -CAkey $ORG-ca-key.pem \
    -in $SERVICE-SAN.cnf \
    -extfile $SERVICE-extfile.cnf \
    -CAcreateserial \
    -out $SERVICE-cert.pem 
```

``` shell
openssl x509 -req  -sha256 -days 1095  -CA $ORG-ca.pem -CAkey $ORG-ca-key.pem  -in $SERVICE.csr  -extfile $SERVICE-extfile.cnf  -CAcreateserial  -out $SERVICE-cert.pem 
```

``` shell
cat $SERVICE-cert.pem >> $SERVICE-full.pem
cat $ORG-ca.pem >> ./$SERVICE-full.pem
```

This all makes a valid `dans-toaster-cert.pem` (the cert) and `dans-toaster.pem` (full chain) for Dans-Toaster signed by our RootCA.

## Step 4: Install the root cert on client devices

```
cat $SERVICE-full.pem
cat $SERVICE-key.pem
```

[Install cheat sheet](https://github.com/ChristianLempa/cheat-sheets/blob/main/misc/ssl-certs.md#install-the-ca-cert-as-a-trusted-root-ca)

## Step 5: Install the service cert on the service that needs it

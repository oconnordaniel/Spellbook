
## Step 1: Create CA

Setup a CA.pem as the root cert

```shell
openssl genrsa -aes256 -out dans-ca-key.pem 4096
```

This will need to be password protected

Generate a public CA Cert signed by the root cert.

```shell
openssl req -new -x509 -sha256 -days 1095 -key dans-ca-key.pem -out dans-ca.pem
```

## Step 2: Generate Cert for Service

Create an RSA key for the service 

```shell
openssl genrsa -out dans-toster-key.pem 4096
```

Create a Certificate Signing Request (CSR) for our service

```shell
openssl req -new -sha256 -subj "/CN=dans-toaster.oconnordaniel.lan" -key dans-toster-key.pem -out dans-toaster.csr
```

SFr SAN (Subject alt names)

``` shell
echo "subjectAltName=DNS:your-dns.record,IP:10.10.10.1" >> toaster-SAN.cnf
```

``` shell
# optional
echo extendedKeyUsage = serverAuth >> extfile.cnf
```

## Step 3: Sign the CSR with the Root

``` shell 
openssl x509 -req \ # Create an x509
    -sha256 -days 1095 \ # options for key lenth and days
    -CA dans-ca.pem -CAkey dans-ca-key.pem \ # our RootCA keys
    -in .csr \ # take in the Cert Sign Request
    -extfile extfile.cnf \ # the SAN and Extra info
    -CAcreateserial \ # serial number
    -out dans-toaster-cert.pem 

openssl x509 -req \ 
    -sha256 -days 1095 \ 
    -CA dans-ca.pem -CAkey dans-ca-key.pem \ 
    -in toaster-SAN.cnf \ 
    -extfile extfile.cnf \ 
    -CAcreateserial \ 
    -out dans-toaster-cert.pem 
```

``` shell 
cat dans-toaster-cert.pem >> ./dans-toaster.pem
cat dans-ca.pem >> ./dans-toaster.pem
```

This all makes a valid `dans-toaster-cert.pem` (the cert) and `dans-toaster.pem` (full chain) for Dans-Toaster signed by our RootCA.

## Step 4: Install the root cert on client devices

[Install cheat sheet](https://github.com/ChristianLempa/cheat-sheets/blob/main/misc/ssl-certs.md#install-the-ca-cert-as-a-trusted-root-ca)

## Step 5: Install the service cert on the service that needs it

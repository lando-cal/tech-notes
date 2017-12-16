SSL is the secure sockets layer, encrypted IP traffic and stuff stuff.

# Apache SSL steps

1. Generate a host key: `openssl genrsa -out foo.com.key 2048`
2. Generate a CSR from that key: `openssl req -new -key foo.com.key -out foo.com.csr`

To set up VirtualHosts, follow this template: <http://wiki.apache.org/httpd/NameBasedSSLVHosts>

# Examples

### Show info about a pem file

```
openssl x509 -noout -text -in foo.pem
```

## Show certificate options

```
openssl x509 -text -in foo.crt
```

## Validate a keys / cert pair

To validate that a particular key was used to generate a certificate, useful for testing https key/crt files, do the following and make sure the modulus sections match:

```
openssl rsa  -noout -text -in server.key | grep -i -A9 modulus
openssl x509 -noout -text -in server.crt | grep -i -A9 modulus
```

Or

```
diff <(openssl rsa -in my.key -modulus | grep Modulus) <(openssl x509 -in my.crt -modulus | grep Modulus)
```

Or as a function:

```
function cert-key-compare {
    if [[ "$1" != *key* ]] || [[ "$2" != *cert* ]] ; then
        echo "usage: cert-key-compare key certificate" ;
    else
        diff \
      <(openssl rsa  -in $1 -modulus 2>/dev/null | grep Modulus) \
      <(openssl x509 -in $2 -modulus 2>/dev/null | grep Modulus) \
      > /dev/null && echo "key and crt match." || echo "key and crt do not match"
    fi
}
```

## See some information about a server's certificate

```
openssl s_client -connect linuxforums.org:443
```

## Encrypt a file

```
openssl enc -aes-256-cbc -salt -in yourfile -out yourfile.enc
```

## Decrypt a file

```
openssl enc -aes-256-cbc -d -in encryptedfile.enc -out decryptedfile
```

## Encrypt / Decrypt bash functions

```
function encrypt_file() { openssl enc -aes-256-cbc -salt -in "${1}" -out "${1}.enc" ; }
function decrypt_file() { openssl enc -aes-256-cbc -d -in "${1}" -out "${1}.dec" ; }
```

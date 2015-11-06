Lightweight Directory Access Protocol

# Acronyms and stuff
- o=organization
- c=country
- dn=distinguished_name
- dc=domain_component
- rdn=relative_distinguished_name
- cn=common_name
- uid=user_id

# Tricks
## Show the whole ldap database
From the LDAP server

```
slapcat
```

## Show pwdFailureTime count and associated uid

```
sudo slapcat 2>/dev/null | egrep '^(pwdFailureTime|uid:)' | uniq -c -w 14 | grep -B1 pwdFailureTime
```

## Show LDAP and local user account info

```
getent passwd maxb
```

## Search an LDAP tree

```
ldapsearch -x -b "dc=example,dc=com"
```

This can be used when forwarding through `ssh -L 3389:127.0.0.1:389 remotehost`

```
ldapsearch -x -h 127.0.0.1 -p 3389 -b "dc=example,dc=com"
```

## Run a search while authenticated
This logs in as danielh and searches for a record with uid=robertc

```
ldapsearch -x -b "dc=example,dc=com" -D "uid=danielh,ou=people,dc=example,dc=com" -W "uid=danielh"
```

## Refresh LDAP user cache on CentOS 6

```
nscd -i passwd ; nscd -i group ; /etc/init.d/lldpad restart ; /etc/init.d/nslcd restart ; /etc/init.d/nscd restart ;
```

# See Also
- Apache Directory Studio graphical interface for LDAP: [https://directory.apache.org/studio/](https://directory.apache.org/studio/)
- A great series of articles on LDAP:  [http://www.ldapman.org/articles/](http://www.ldapman.org/articles/)
- Ubuntu Server LDAP integration:  [https://help.ubuntu.com/community/LDAPClientAuthentication](https://help.ubuntu.com/community/LDAPClientAuthentication)

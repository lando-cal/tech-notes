Title: systemd-resolved

"systemd-resolved - Network Name Resolution manager" - `man systemd-resolved`

systemd-resolved enhances (ie: interferes with) old school simple methods of managing DNS on a linux system. The way it reads the /etc/resolv.conf file as either a file or symlink alters the behavior of the service, which is a new mechanic that can have unexpected effects if you're not familiar with it.

# Examples

## Resolve a hostname

```
$ systemd-resolve google.com
google.com: 216.58.192.238

-- Information acquired via protocol DNS in 23.9ms.
-- Data is authenticated: no
```

## Check name resolution statistics

```
$ systemd-resolve --statistics
DNSSEC supported by current servers: no

Transactions
Current Transactions: 0
  Total Transactions: 36

Cache
  Current Cache Size: 2
          Cache Hits: 2
        Cache Misses: 103

DNSSEC Verdicts
              Secure: 0
            Insecure: 0
               Bogus: 0
       Indeterminate: 0
```

# See Also

- <http://man7.org/linux/man-pages/man1/systemd-resolve.1.html>
- <http://manpages.ubuntu.com/manpages/xenial/man8/systemd-resolved.service.8.html>
- <http://manpages.ubuntu.com/manpages/bionic/man8/systemd-resolved.service.8.html>

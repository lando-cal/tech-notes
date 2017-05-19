Dynamic Host Configuration Protocol

# isc dhcpd

<https://www.isc.org/downloads/dhcp/>

## Test configuration file

```
dhcpd3 -t
```

## Test lease file

```
dhcpd3 -T
```

# Handshake Process

```
Apr 21 15:33:00 ops1prod dhcpd: DHCPDISCOVER from 08:9e:01:8b:18:94 via eth0
Apr 21 15:33:01 ops1prod dhcpd: DHCPOFFER on 10.1.14.127 to 08:9e:01:8b:18:94 via eth0
Apr 21 15:33:01 ops1prod dhcpd: DHCPREQUEST for 10.1.225.43 from 00:1e:0b:bc:8a:c4 via eth1
Apr 21 15:33:01 ops1prod dhcpd: DHCPACK on 10.1.225.43 to 00:1e:0b:bc:8a:c4 via eth1
```

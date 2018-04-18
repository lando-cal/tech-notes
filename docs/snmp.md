Title: snmp

Simple Network Management Protocol

# Links

- Third party MIBs: <http://www.plixer.com/support/mib_resources.php>
- How-To: <http://www.linuxhomenetworking.com/wiki/index.php/Quick_HOWTO_:_Ch22_:_Monitoring_Server_Performance>
- APC has some snmp tricks specific to those devices.
- <http://support.ipmonitor.com/mibs_byname_A.aspx> - Good MIB reference

# Examples

## Install snmp utils on redhat / centos

```
yum install net-snmp-utils
```

## Show the system description of a host

```
snmpwalk -v 1 -c public 192.168.9.1 SNMPv2-MIB::sysDescr.0
```

## Walk 172.28.111.10 with community string itgwrk

```
snmpwalk -v 1 -c "public" 172.28.111.10
```

IPV6 is different...

```
snmpwalk -v 1 -c public udp6:fe80::a2e:5fff:feba:f586%en0 enterprises
```

## Show Network Info

```
snmpwalk -c public 192.168.9.1 1.3.6.1.2.1
```

## Show Airport Upload and Download bytes

```
snmpwalk -c public 192.168.9.1 IF-MIB::ifOutOctets
snmpwalk -c public 192.168.9.1 IF-MIB::ifInOctets
```

## Show configured IP addresses

IPV4 by querying IPV6: snmpwalk -v 1 -c public udp6:fe80::a2e:5fff:feba:f586%en0 ipAdEntAddr

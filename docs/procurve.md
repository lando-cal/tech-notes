Title: procurve

[Procurve](/wiki/Procurve "wikilink") switches from [HP](HP "wikilink") offer cheap layer 2 and layer 3 switching.

# Copy config files

`scp user@switch:cfg/startup-config ./`  
`scp user@switch:cfg/running-config ./`

# Firmware update

- Via ssh: `linuxclient$ scp /path/to/image user@switch-hostname:/os/primary`
- Via tftp: `switch# copy tftp flash 172.28.115.151 flashfilename.swi primary` *This doesn't always work, try scp if it fails.*

Then on the switch...

`system boot flash primary`

# Config Examples

### Set an IP# for the default VLAN

```
interface vlan 1 ip address 172.28.115.234 255.255.255.0
ip default-gateway 172.28.115.1
```

### Set up additional VLANs

```
vlan 100 untagged 2  
vlan 100 ip address 172.28.100.1  
vlan 102 untagged 3  
vlan 102 ip address 172.28.102.1
```

### Enable routing between connected networks

`ip routing`

### Set up SNTP clock

```
sntp server 172.28.111.16  
timesync sntp  
sntp 120  
sntp unicast
```

### Alter DST settings

`time daylight-time-rule User-defined begin-date 3/8 end-date 11/1`

### Enable SSH

```
crypto key generate ssh  
ip ssh  
ip ssh version 2  
ip ssh filetransfer
```

### Disable telnet

`no telnet-server`

### Set up snmp

`snmp-server community "foobar" Operator`

### Set up a VLAN 112 port group

`vlan 112 untagged 6-12`

### Set two groups of ports as a trunks (eg: to use with VMware in static LACP)

```
trunk 1-4 trk1 trunk  
trunk 5-8 trk2 trunk
```

### Set up VLAN multiplexing

```
vlan 114 tagged 24  
vlan 115 tagged 24  
vlan 114 tagged Trk1  
vlan 115 tagged Trk1
```

# See Also

- Plenty of config examples: <https://www.cs.uwaterloo.ca>

# Example Config

```
hostname "HP-CORE-0"
snmp-server location "Cup1-Closet1"
max-vlans 64
time timezone -480
time daylight-time-rule User-defined begin-date 3/8 end-date 11/1
console inactivity-timer 5
no web-management
web-management ssl
no telnet-server
interface 2
   name "Load Test Cluster"
exit
interface 5
   name "hq-vm-1"
exit
interface 6
   name "hq-vm-1"
exit
interface 8
   name "beast"
exit
interface 10
   name "Winserv"
exit
interface 12
   name "IT"
exit
interface 13
   name "Services"
exit
interface 14
   name "IT"
exit
interface 15
   name "IT"
exit
interface 16
   name "IT"
exit
interface 17
   name "beast"
exit
interface 18
   name "VPN"
exit
interface 19
   name "IT"
exit
interface 20
   name "IT"
exit
interface 21
   name "Radio Station"
exit
interface 22
   name "AT&T Network"
exit
interface 23
   name "HP-CORE trunk"
exit
interface 24
   name "Jun1-trunk"
exit
ip default-gateway 10.8.100.1
sntp server 10.8.5.220
ip routing
timesync sntp
sntp unicast
snmp-server community "public" Unrestricted
snmp-server host 10.8.5.189 "public"
vlan 1
   name "DEFAULT_VLAN"
   untagged 4,14
   no ip address
   tagged 23
   no untagged 1-3,5-13,15-22,24
   exit
vlan 101
   name "Services"
   untagged 3,8,10,15,19
   ip address 10.8.1.1 255.255.255.0
   ip helper-address 10.8.5.220
   tagged 2,5-6,23-24
   exit
vlan 102
   name "LoadTest"
   no ip address
   ip helper-address 10.8.5.220
   tagged 2,5-6,15,23-24
   exit
vlan 103
   name "QATest"
   no ip address
   ip helper-address 10.8.5.220
   tagged 15,23
   exit
vlan 104
   name "PS"
   no ip address
   ip helper-address 10.8.5.220
   tagged 15,23-24
   exit
vlan 105
   name "IT"
   untagged 1,5-6,9,12-13,16,20
   ip address 10.8.5.1 255.255.255.0
   ip helper-address 10.8.5.220
   tagged 2,15,23-24
   exit
vlan 110
   name "Wireless"
   no ip address
   ip helper-address 10.8.5.220
   tagged 15,23-24
   exit
vlan 111
   name "Eng"
   no ip address
   ip helper-address 10.8.5.220
   tagged 15,23-24
   exit
vlan 113
   name "SW2"
   no ip address
   ip helper-address 10.8.5.220
   tagged 23
   exit
vlan 112
   name "SW1"
   untagged 21
   ip address 10.8.12.1 255.255.255.0
   ip helper-address 10.8.5.220
   tagged 23
   exit
vlan 100
   name "Backbone"
   ip address 10.8.100.100 255.255.255.0
   tagged 23-24
   exit
vlan 114
   name "Upstairs"
   no ip address
   ip helper-address 10.8.5.220
   tagged 23-24
   exit
vlan 106
   name "VPN"
   untagged 18
   no ip address
   ip helper-address 10.8.5.220
   tagged 15,23-24
   exit
vlan 188
   name "OldNet"
   untagged 11,17
   no ip address
   ip helper-address 10.8.5.220
   tagged 23-24
   exit
vlan 42
   name "ATT"
   untagged 22
   tagged 23-24
   exit
vlan 107
   name "DMZ"
   untagged 7
   ip helper-address 10.8.5.220
   tagged 15,24
   exit
vlan 109
   name "Jail"
   tagged 23-24
   exit
dhcp-relay option 82 keep
ip route 0.0.0.0 0.0.0.0 10.8.100.1
ip route 10.8.11.0 255.255.255.0 10.8.100.101
ip route 10.8.3.0 255.255.255.0 10.8.100.101
ip route 10.172.188.0 255.255.255.0 10.8.100.1
ip route 10.8.13.0 255.255.255.0 10.8.100.101
ip route 10.8.2.0 255.255.255.0 10.8.100.1
ip route 10.8.10.0 255.255.255.0 10.8.100.1
ip route 10.8.7.0 255.255.255.0 10.8.100.1
ip route 10.8.4.0 255.255.255.0 10.8.100.1
ip route 10.8.14.0 255.255.255.0 10.8.100.102
ip route 10.8.9.0 255.255.255.0 10.8.100.1
stack commander "HP-CORE"
stack auto-grab
stack member 1 mac-address 0016b90b4ea0
stack member 2 mac-address 0016b968df40
spanning-tree
ip ssh
ip ssh filetransfer
no tftp client
no tftp server
password manager
password operator
```

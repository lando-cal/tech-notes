Title: IPMI

The Intelligent Platform Management Interface (IPMI) is a set of computer interface specifications for an autonomous computer subsystem that provides management and monitoring capabilities independently of the host system's CPU, firmware (BIOS or UEFI) and operating system.

# Managing servers with IPMI

## Default Users

The default users are 'Administrator' for HPs, 'root' for Dells, and 'ADMIN' for Silicon Mechanics.

## Server Setup

IPMI uses COM2 aka ttyS1 for the serial port on Dells and HPs, COM3 aka ttyS2 on Silicon Mechanics.

# Common Remote Commands

## See if a server is on

```
ipmitool -I lanplus -U $USER -P $PASSWORD -H $IPMI_IP chassis power status
```

## Turn a server on

```
ipmitool -I lanplus -U $USER -P $PASSWORD -H $IPMI_IP chassis power on
```

## Turn a server off

```
ipmitool -I lanplus -U $USER -P $PASSWORD -H $IPMI_IP chassis power off
```

## Tell a server to PXEBoot

```
ipmitool -I lanplus -U $USER -P $PASSWORD -H $IPMI_IP chassis power off
ipmitool -I lanplus -U $USER -P $PASSWORD -H $IPMI_IP chassis bootdev pxe
ipmitool -I lanplus -U $USER -P $PASSWORD -H $IPMI_IP chassis power on
```

## Connect to the serial console

```
ipmitool -I lanplus -U $USER -P $PASSWORD -H $IPMI_IP sol activate
```

## Display the system event log

```
ipmitool -I lanplus -U $USER -P $PASSWORD -H $IPMI_IP sel list
```

## Clear the system event log

```
ipmitool -I lanplus -U $USER -P $PASSWORD -H $IPMI_IP sel clear
```

## Display sensor information

```
ipmitool -I lanplus -U $USER -P $PASSWORD -H $IPMI_IP sdr list
```

## Disconnect another serial console session

```
ipmitool -I lanplus -U $USER -P $PASSWORD -H $IPMI_IP sol deactivate
```

## Show bootdev help

```
ipmitool -H 10.5.8.30 -U ADMIN -P ADMIN chassis bootdev none options=help
```

# Common Local Commands

These commands require root access in most environments.

## View all configured LAN parameters

```
ipmitool lan print
```

You can view individual "channels" which are logical interfaces by giving the number:

```
ipmitool lan print 1
```

## Configure IPMI static IP information

```
IPMI_IP_ADDR=192.168.1.250
IPMI_IP_NETMASK=255.255.255.0
IPMI_IP_GW_IP_ADDR=192.168.1.1
IPMI_IP_GW_MAC_ADDR=00:01:02:aa:bb:cc
ipmitool lan set 1 ipsrc static
ipmitool lan set 1 ipaddr "${IPMI_IP_ADDR}"
ipmitool lan set 1 netmask "${IPMI_IP_NETMASK}"
ipmitool lan set 1 defgw ipaddr "${IPMI_IP_GW_IP_ADDR}"
ipmitool lan set 1 defgw macaddr "{IPMI_IP_GW_MAC_ADDR}"
ipmitool lan set 1 arp respond on
```

## Configure IPMI admin user

```
USERNAME=admin
PASSWORD=hunter2
ipmitool user set name 2 "$USERNAME"
ipmitool user set password 2 "$PASSWORD"
```

## Reset the BMC

If a host loses it's IPMI (iLO, etc.) IP connectivity, issue this command from the host itself

```
ipmitool mc reset cold
```

## How to fix /dev/ipmi errors

For errors like `Could not open device at /dev/ipmi0 or /dev/ipmi/0 or /dev/ipmidev/0`:

```
modprobe ipmi_msghandler
modprobe ipmi_devintf
modprobe ipmi_si
```

## Reset the ADMIN password to ADMIN on a Supermicro BMC

```
sudo ipmitool -I open user set password 2 ADMIN
```

## Reset all settings to defaults

This may not work with your BMC, but has been known to work with some supermicro BMCs.

```
ipmitool raw 0x30 0x40
```

# See Also

- <http://www.intel.com/design/servers/ipmi/>

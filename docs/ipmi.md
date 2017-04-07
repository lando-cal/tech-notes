The Intelligent Platform Management Interface (IPMI) is a set of computer interface specifications for an autonomous computer subsystem that provides management and monitoring capabilities independently of the host system's CPU, firmware (BIOS or UEFI) and operating system.

# CLI Examples

`ipmitool` is the most common way to interface with ipmi.

## Reset a BMC

From the local machine

```
ipmitool mc reset cold
```

## Get information about a BMC's network

The following command is issued on the local machine to inspect channel 1. There may be multiple "channels" which are logical network interfaces that may be a unique physical interface or may be combined with one of the host's ethernet interfaces.

```
ipmitool lan print 1
```

## Attach to the serial console

This is obviously most useful when connecting remotely

```
ipmitool mc sol activate
```

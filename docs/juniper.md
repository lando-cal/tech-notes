# Juniper

"We bring simplicity to networking with products, solutions, and services that connect the world." - <https://www.juniper.net/us/en/company/>

# Examples

## Default credentials

- root:<empty>
- admin:abc123

## Load configuration from terminal

I have experienced errors when pasting into `screen /dev/tty.usbserial`, but having iTerm2 paste at 256 bytes per second appears to fix them.

```
Amnesiac (ttyu0)

login: root

--- JUNOS 13.2X51-D35.3 built 2015-04-09 20:48:22 UTC
root@:RE:0% cli
{master:0}
root> configure
Entering configuration mode
Users currently editing the configuration:
  autodconfig (pid 1291) on since 2018-01-06 17:32:28 UTC
      exclusive

{master:0}[edit]
root# load override terminal
[Type ^D at a new line to end input]
```

Then:
0. paste your config
0. press `ctrl-d`
0. run `commit`

## Some example terminal buffer

```
login: root

--- JUNOS 13.2X51-D35.3 built 2015-04-09 20:48:22 UTC
root@:RE:0% cli
{master:0}
root> set cli screen-length 75
Screen length set to 75

{master:0}
root> configure
Entering configuration mode

{master:0}[edit]
root# show ?
Possible completions:
  <[Enter]>            Execute this command
> access               Network access configuration
> access-profile       Access profile for this instance
> accounting-options   Accounting data configuration
+ apply-groups         Groups from which to inherit configuration data
> chassis              Chassis configuration
> class-of-service     Class-of-service configuration
> diameter             Diameter protocol layer
> event-options        Event processing configuration
> firewall             Define a firewall configuration
> forwarding-options   Configure options to control packet forwarding
> groups               Configuration groups
> interfaces           Interface configuration
> jsrc                 JSRC partition configuration
> jsrc-partition       JSRC partition configuration
> multi-chassis
> multicast-snooping-options  Multicast snooping option configuration
> poe                  Power-over-Ethernet options
> policy-options       Policy option configuration
> protocols            Routing protocol configuration
> routing-instances    Routing instance configuration
> routing-options      Protocol-independent routing option configuration
> security             Security configuration
> services             System services
> snmp                 Simple Network Management Protocol configuration
> switch-options       Options for default routing-instance of type virtual-switch
> system               System parameters
> unified-edge
> virtual-chassis      Virtual chassis configuration
> vlans                VLAN configuration
  |                    Pipe through a command
{master:0}[edit]
root# show chassis
auto-image-upgrade;

{master:0}[edit]
```

# Links
- <https://www.juniper.net/documentation/en_US/junos/topics/concept/junos-cli-overview.html>

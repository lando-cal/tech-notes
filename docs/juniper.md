Title: Juniper

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

## Remove virtual-chassis from an EX4300

```
request virtual-chassis vc-port delete pic-slot 1 port 0
request virtual-chassis vc-port delete pic-slot 1 port 1
request virtual-chassis vc-port delete pic-slot 1 port 2
request virtual-chassis vc-port delete pic-slot 1 port 3
```

You can validate this by looking for the following interfaces. If you do not see the `et-0/1/{0..3}` interfaces then the virtual-chassis may still exist in full or in part.

```
root> show interfaces terse | match et-
et-0/1/0                up    up
et-0/1/0.0              up    up   eth-switch
et-0/1/1                up    up
et-0/1/1.0              up    up   eth-switch
et-0/1/2                up    up
et-0/1/2.0              up    up   aenet    --> ae0.0
et-0/1/3                up    up
et-0/1/3.0              up    up   aenet    --> ae0.0
```

## EX4300 OS install

- <https://kb.juniper.net/InfoCenter/index?page=content&id=KB20551&cat=SWITCHING&actp=LIST#USB>

After copying the install image to a usb disk and inserting it into the EX4300

```
mount_msdosfs /dev/da1s1 /mnt
cp /mnt/jinstall-ex-4300-14.1X53-D45.3-domestic-signed.tgz /var/tmp/
cli
request system software add /var/tmp/jinstall-ex-4300-14.1X53-D45.3-domestic-signed.tgz
```

## Clear a DHCP client lease

```
root@junos> show dhcp server binding
IP address        Session Id  Hardware address   Expires     State      Interface
10.8.52.6         2           00:1e:7c:f8:be:34  85166       BOUND      irb.100
10.8.52.9         5           6c:c1:11:4e:52:8c  86299       BOUND      irb.100
10.8.52.5         3           d8:fa:97:b8:1a:dd  85222       BOUND      irb.100

{master:0}
root@junos> clear dhcp server binding 2

{master:0}
root@junos> show dhcp server binding
IP address        Session Id  Hardware address   Expires     State      Interface
10.8.52.9         5           6c:c1:11:4e:52:8c  86275       BOUND      irb.100
10.8.52.5         3           d8:fa:97:b8:1a:dd  85198       BOUND      irb.100

{master:0}
```

# Links

- <https://www.juniper.net/documentation/en_US/junos/topics/concept/junos-cli-overview.html>
- <https://www.juniper.net/documentation/en_US/junos/topics/task/configuration/virtual-chassis-mx-series-vc-ports-deleting.html>
- <http://junos-ansible-modules.readthedocs.io/en/1.3.1/junos_cli.html>

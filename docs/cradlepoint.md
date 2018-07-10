Title: Cradlepoint

"Founded in 2006, Cradlepoint has grown to become the industry leader in cloud-delivered 4G LTE network solutions for business, service providers, and government organizations, and we are committed to extending our leadership into the emerging 5G space." - <https://cradlepoint.com/company/about>

## Cradlepoint IBR900 CLI

The CLI is not a normal shell, but is a minimal appliance type UI.

### Get config data

This will get all config data, which can be over 25k lines of JSON.

```
get
```

To get just a subset of the data, use something like:

```
[admin@IBR900-13e: /]$ get config/vlan
[
    {
        "mode": "wan",
        "ports": [],
        "uid": "wan",
        "vid": 1
    },
    {
        "mode": "lan",
        "ports": [
            {
                "mode": "untagged",
                "port": 0
            },
            {
                "mode": "untagged",
                "port": 1
            },
            {
                "mode": "untagged",
                "port": 2
            }
        ],
        "uid": "lan",
        "vid": 2
    }
]
```

### Set and fetch variables

```
[admin@IBR900-13e: /]$ set foo/bar: "baz"
[admin@IBR900-13e: /]$ get foo
{
    "bar:": "baz"
}
```

### Getting help

```
[admin@IBR900-13e: /]$ help
Available Commands:
        SupportQA      adduser        append         arpdump        atterm         banner         bgp
        cd             clear          clients        cpconnect      date           delete         deluser
        devices        diff           edit           exit           factory_reset  find           free
        get            gre            grep           help           inspect        ips            ipset
        lan            log            ls             mkdir          nemo           netcloud       netfilter
        netstat        nhrp           ospf           passwd         ping           ping6          pwd
        qos            reboot         reset          resources      rip            ripng          route
        rtpolicy       serial         set            sleep          sms            ssh            stp
        switch         tcpdump        telnet         threads        traceroute     uptime         vlan
        vpn            vrrp           wan            wireless       workqueue      xfrm           zebra

Available Aliases:
        cat  => get
        dir  => ls
        ll   => ls -l 1
        more => get
        post => append
        put  => set
        quit => exit
        rm   => delete

To get help for a specific command run: "help CMD"
[admin@IBR900-13e: /]$ help SupportQA
Command to provide debugging data
[admin@IBR900-13e: /]$ help adduser
Add a new user account and set the password for this account.
Usage: adduser USER

[admin@IBR900-13e: /]$ help append
Append new item to an array in the config
    append PATH VALUE
[admin@IBR900-13e: /]$ help arpdump
The arpdump command shows the current ARP table.
[admin@IBR900-13e: /]$ help atterm
The atterm command can be used to get direct access to a modem's AT command channel.
If a modem interface is not given then the system will pick the highest priority modem.
To discover a modem's interface to use, use the command 'devices' and use
the value found under the 'SubIface' column.

USAGE: atterm [interface] [-c ATCMD] [-t SOCKET_TIMEOUT]

[admin@IBR900-13e: /]$ help banner
banner [set|unset]
[admin@IBR900-13e: /]$ help bgp
Usage: bgp [cmd]

Excecute and show output of "cmd". If no "cmd" is given then access to the Quagga BGP CLI is given.
Use "bgp list" to see avaliable commands or See the Quagga documentation for details.

    *** WARNING: Changes made using the Quagga CLI do not persist! ***

The configuration entered via the Cradlepoint user interface will be restored
after user interface changes and/or a router reboot. If the routing protocol
options in the user interface do not allow a necessary Quagga configuration,
please provide all configuration details to Cradlepoint support.

[admin@IBR900-13e: /]$ help cd
Change to a new config directory
Usage: cd DIR/[DIR...]
[admin@IBR900-13e: /]$ help clear
Clear the screen
[admin@IBR900-13e: /]$ help clients
The clients command can be used to show the currently connected clients,
both wireless and wired as well as hotspot.

USAGE:    clients [show | revoke | kick ] [SUBOPTIONS...]
    show [CONNECTION TYPE]: Show clients by connection type.
        If no connection type option is given, all connection types will be shown.
    Connection Types:
        all  : All Known Clients, both wired and wireless, that the router knows about.
        wlan : Wireless LAN Clients
        hotspot : Authenticated Hotspot Clients
    revoke [-t [ip | mac | hn]]: Revoke a client's Hotspot authentication.
        -t : The type of adddress to be used to find the client in the client list
            ip  : IP address of the client (default)
            mac : MAC address of the client
            hn  : Hostname of the client (cannot be used if client does not have a hostname)
    kick [-t [ip | mac | hn]]: Remove wireless access until the router is rebooted.
        -t : The type of adddress to be used to find the client in the client list
            ip  : IP address of the client (default)
            mac : MAC address of the client
            hn  : Hostname of the client (cannot be used if client does not have a hostname)
[admin@IBR900-13e: /]$ help cpconnect
Usage: cpconnect {COMMAND} [OPTIONS]
    where COMMAND := { add | remove | show }
          OPTIONS := {-n[ame] | -u[ser] | -p[asswd] | -s[server] } [VAR]

    example: cpconnect add -n test1 -u user1 -p pass1 -s vpn.accessmylan.com
             cpconnect show

[admin@IBR900-13e: /]$ help date
Show system clock.
[admin@IBR900-13e: /]$ help delete
Delete an item from the config
Usage: delete PATH
[admin@IBR900-13e: /]$ help deluser
Delete a user account.
Usage: deluser USER

[admin@IBR900-13e: /]$ help devices
Display network devices connected to the router.

USAGE:    devices [-v]                 Show all devices(s)
          devices [-v] [DEVICE_UID...] Show one or more specific devices.
            -v     Verbose output
[admin@IBR900-13e: /]$ help diff
Show differences between the current and the default configuration.
[admin@IBR900-13e: /]$ help edit
Usage: edit CONFIG_PATH
Examples:
    edit /config/system/gps
    edit .

[admin@IBR900-13e: /]$ help exit
Exit the shell
[admin@IBR900-13e: /]$ help factory_reset
Reset config to factory defaults
[admin@IBR900-13e: /]$ help find
Find or list files and combine with grep to locate specific files
Usage: find PATH [| grep file]
[admin@IBR900-13e: /]$ help free
Show amount (kilobytes) of free and used system memory.
"free" memory is presently unused, while "available" includes used memory,
typically for cache, that is readily reclaimed for something else when needed.
[admin@IBR900-13e: /]$ help get
Get value for config item(s)
Usage: get PATH [PATH...]
[admin@IBR900-13e: /]$ help gre

Start, stop, or show status of all gre tunnels.
Start, stop or restart a tunnel.
Renew or release the DHCP lease for a tunnel (if DHCP for GRE is enabled).

gre [show|start|stop]
gre [starttunnel|stoptunnel|restarttunnel|renew|release] -n <TUNNEL NAME>

[admin@IBR900-13e: /]$ help grep
Usage: grep PATTERN [FILE]...
[admin@IBR900-13e: /]$ help help
To get help for a specific command run: "help CMD"
[admin@IBR900-13e: /]$ help inspect
Inspect a directory
Usage: inspect [PATH]
[admin@IBR900-13e: /]$ help ips
Interact with the IPS engine.

Usage: ips [load|show|mode|status] [SUBOPTIONS..]
    load [-f PATH]: Load a rule file into the IPS engine
        -f [PATH]: Load rule file from PATH (Must contain the filename)
    show [-o [ids | cats | sec | app | anom]]: Show information from the signatures loaded.
        ids: Print all the signatures (default)
        cats: Print all the categories
        sec: Print only the signatures for the Security rules
        app: Print only the signatures for the Application rules
        anom: Print only the signatures for the Anomaly rules
    mode [-o [off | ips | ids]]: Change the IPS Global mode
        off: Set Default IPS  mode to 'Disabled'
             (If no other Category or Signature is 'Enabled' then the kernel
              modules will be unloaded)
        ips: Set Default IPS mode to 'Detect and Prevent'
        ids: Set Default IPS mode to 'Detect Only'
    status: Print the status of the IPS engine
    update: Request a Rule File Update

[admin@IBR900-13e: /]$ help ipset
ipset [list {name}]
specify the name of the set to list, or nothing to see the names of the sets
[admin@IBR900-13e: /]$ help lan
Show the current LAN configuration and status.
[admin@IBR900-13e: /]$ help log
Show and manipulate the log system.
Usage: log [show|clear|service|level|msg] [SUBOPTONS...]
        show [FILTER] [FILTERN] [[-bhi] -s SEARCH]:
              FILTER can be one or more space-separated names or levels.
                 eg. log show wanmgr kernel DEBUG INFO
              -b bold new entries
              -h HIGHLIGHT Same usage as searching but does not filter results.
              -i makes the search case insensitive.
              -s SEARCH can be any string to search for in the log message contents.
                 eg. log show -s Firmware
              -f [LINES_OF_HISTORY] Follow mode with optional argument for number of lines of history to show.
              -r recover crash log if one exists.
        service [level (DEBUG|INFO|WARNING|ERROR|CRITICAL)]:
             Display all service log levels.
             level change service log level.
        clear: Erase all logs from memory
        level [NEW_LEVEL]: View current level or set new log level to: critical, error, warning, info, or debug
        msg [-l LEVEL] MESSAGE: Write a message to the logging system. LEVEL defaults to: info
[admin@IBR900-13e: /]$ help ls
List files in the current config directory
[admin@IBR900-13e: /]$ help mkdir
Create an empty container
Usage: mkdir DIRNAME
[admin@IBR900-13e: /]$ help nemo
Show status and configuration of NEMO session
Usage: nemo [-v]
[admin@IBR900-13e: /]$ help netcloud
Manage connection to the Cradlepoint NetCloud.

Usage: netcloud [alert|status|register|stop|start|restart|triggers]
     status: [DEFAULT] Show current status information.
     register [--username=USER --password=PW]|[--token_id=TID --token_secret=TS]: (Re)register
       --username: The NetCloud username that should be used to authenticate.
       --password: The NetCloud password that should be used to authenticate.
       --token_id: [EXPERT] Token ID for token authentication mode.
       --token_secret: [EXPERT] Token secret for token authentication mode.
     unregister: Unregister this router from NetCloud and unregister.
     stop: Manually stop the NetCloud client.
     start: Manually start the NetCloud client.
     restart: Manually restart the NetCloud client.

[admin@IBR900-13e: /]$ help netfilter
Show info and debug from netfilter2 rule(s) and trigger(s).
Usage: netfilter [active|all|upnp|triggers|states] [input|routed|output] [ip/ip6] [-v] [-s] [-r RULE_INDEX] [-t TRIGGER_INDEX] [-s STATE_INDEX]

[admin@IBR900-13e: /]$ help netstat
Usage: netstat [-al] [-tuwx] [-enWp]

Display networking information

-a     All sockets
-l     Listening sockets
        Else: connected sockets
-t     TCP sockets
-u     UDP sockets
-w     Raw sockets
-x     Unix sockets
        Else: all socket types
-e     Other/more information
-n     Don't resolve names
-W     Wide display
-p     Show PID/program name for sockets

[admin@IBR900-13e: /]$ help nhrp

Usage:    nhrp show
          nhrp flush
          nhrp flush nbma ip

[admin@IBR900-13e: /]$ help ospf
Usage: ospf [cmd]

Excecute and show output of "cmd". If no "cmd" is given then access to the Quagga OSPF CLI is given.
Use "ospf list" to see avaliable commands or See the Quagga documentation for details.

    *** WARNING: Changes made using the Quagga CLI do not persist! ***

The configuration entered via the Cradlepoint user interface will be restored
after user interface changes and/or a router reboot. If the routing protocol
options in the user interface do not allow a necessary Quagga configuration,
please provide all configuration details to Cradlepoint support.

[admin@IBR900-13e: /]$ help passwd
Set the password for a user.
Usage: passwd [USER]

[admin@IBR900-13e: /]$ help ping
Send ICMP echo_request(s) to a networked host

Usage: ping [-w DEADLINE] [-c COUNT] [-i INTERVAL] [-I INTERFACE [-P]] [-M PMTUDISC_OPT] [-s SIZE] HOSTNAME

    -w DEADLINE
        Stop after a total of DEADLINE seconds, or (if specified) COUNT packets
        are sent, whichever comes first.

    -c COUNT
        Stop after sending COUNT packets, or (if specified) DEADLINE seconds,
        whichever comes first

    -i INTERVAL
        Wait INTERVAL seconds between packet transmissions. Default is 1.

    -I INTERFACE
        Specify the source of the ICMP requests. If INTERFACE is an IP address,
        then source the ICMP requests from that address. If INTERFACE is not
        an IP address, treat it as an interface name and source from that
        interface. When treated as a name, exact matches of interface "Ifaces"
        are chosen first, followed by exact matches of "Device UIDs", and
        finally case-insensitive matches to Network names are returned. See
        the "devices" command for a list of valid "Ifaces" and "Device UIDs".

    -P
        Requires the -I INTERFACE option. When -P is present, ping will
        source from an IP address on the specified interface, instead of the
        interface itself.

    -s SIZE
        Specifiy the ICMP data length, in bytes. The default is 56 bytes, which
        will result in an ICMP packet length of 64 bytes (56 data bytes plus 8
        ICMP header bytes)

    -M PMTU_OPT
        Select Path MTU discovery. PMTU_OPT must be one of: "do", "want" or "dont".
        If the PMTU_OPT is "do" (default), then ping will set the Don't Fragment (DF)
        flag in the ICMP requests, which will prohibit packet fragmentation. If
        PMTU_OPT is "want", then ping will fragment if the ICMP request exceeds
        the local outbound interfaces' MTU. Finally if PMTU_OPT is "dont" (do not
        set the DF flag), then fragmentation is allowed and ICMP Requests will be
        fragmented as necessary in response to ICMP Fragmentation Responses.


[admin@IBR900-13e: /]$ help ping6
Send ICMPv6 echo_request(s) to a networked host

Usage: ping6 [-w DEADLINE] [-c COUNT] [-i INTERVAL] [-I INTERFACE [-P]] [-M PMTUDISC_OPT] [-s SIZE] HOSTNAME

    -w DEADLINE
        Stop after a total of DEADLINE seconds, or (if specified) COUNT packets
        are sent, whichever comes first.

    -c COUNT
        Stop after sending COUNT packets, or (if specified) DEADLINE seconds,
        whichever comes first

    -i INTERVAL
        Wait INTERVAL seconds between packet transmissions. Default is 1.

    -I INTERFACE
        Specify the source of the ICMP requests. If INTERFACE is an IP address,
        then source the ICMP requests from that address. If INTERFACE is not
        an IP address, treat it as an interface name and source from that
        interface. When treated as a name, exact matches of interface "Ifaces"
        are chosen first, followed by exact matches of "Device UIDs", and
        finally case-insensitive matches to Network names are returned. See
        the "devices" command for a list of valid "Ifaces" and "Device UIDs".

    -P
        Requires the -I INTERFACE option. When -P is present, ping will
        source from an IP address on the specified interface, instead of the
        interface itself.

    -s SIZE
        Specifiy the ICMP data length, in bytes. The default is 56 bytes, which
        will result in an ICMP packet length of 64 bytes (56 data bytes plus 8
        ICMP header bytes)


[admin@IBR900-13e: /]$ help pwd
Print the current working directory
[admin@IBR900-13e: /]$ help qos
Show QoS statistics.
Usage: qos

[admin@IBR900-13e: /]$ help reboot
Reboot the router
[admin@IBR900-13e: /]$ help reset
Reset the tty to default settings
[admin@IBR900-13e: /]$ help resources
Report the system resource usage.
[admin@IBR900-13e: /]$ help rip
Usage: rip [cmd]

Excecute and show output of "cmd". If no "cmd" is given then access to the Quagga RIP CLI is given.
Use "rip list" to see avaliable commands or See the Quagga documentation for details.

    *** WARNING: Changes made using the Quagga CLI do not persist! ***

The configuration entered via the Cradlepoint user interface will be restored
after user interface changes and/or a router reboot. If the routing protocol
options in the user interface do not allow a necessary Quagga configuration,
please provide all configuration details to Cradlepoint support.

[admin@IBR900-13e: /]$ help ripng
Usage: ripng [cmd]

Excecute and show output of "cmd". If no "cmd" is given then access to the Quagga RIPNG CLI is given.
Use "ripng list" to see avaliable commands or See the Quagga documentation for details.

    *** WARNING: Changes made using the Quagga CLI do not persist! ***

The configuration entered via the Cradlepoint user interface will be restored
after user interface changes and/or a router reboot. If the routing protocol
options in the user interface do not allow a necessary Quagga configuration,
please provide all configuration details to Cradlepoint support.

[admin@IBR900-13e: /]$ help route
The route command can be used to show the current routing tables as
well as make changes to the user defined static routing table.

USAGE:    route [show [{TABLE}]]                        Show route(s)
          route config {bgp|ospf|rip|ripng|static}      Show routing protocol configuration
          route add IP/NM [gw IP] [dev UID] [auto]    Add new user defined static route
          route del IP/NM [gw IP] [dev UID]     Remove user defined static route(s)

EXAMPLES: route add 172.0.0.100 dev primarylan
          route add 10.0.0.0/8 gw 172.0.0.100
          route add 2000::/3 dev guestlan metric 100

NOTE: Only the user defined static routing table may be modified directly.
[admin@IBR900-13e: /]$ help rtpolicy
Show the routing policies used by the router.  These policies control which
routing table will be used based on certain packet matching criteria and can
also control certain routing decisions.

USAGE:    rtpolicy                                 Show policies(s)

[admin@IBR900-13e: /]$ help serial
The serial command can be used to access a serial adapter connected to the router.
USAGE:  serial [--force]          Connects to the first serial device using the serial configuration in config/system/serial
USAGE:  serial [--force] [number] Connects to the [number] port of a multi-port serial device using the serial configuration in config/system/serial
Only one remote user can be connected to a serial port at a time.  The --force option will force quit another user to allow this command to take over.
[admin@IBR900-13e: /]$ help set
Set a value to a config item
Usage: set PATH VALUE
[admin@IBR900-13e: /]$ help sleep
sleep SECONDS
[admin@IBR900-13e: /]$ help sms
 The sms command is used to send a msg to the given address (optionally from the modem on port)
  Usage: sms addr msg [port]
  Example: sms 2081234567 'hello world' usb1
  Note: Add a '+' before the addr for international numbers
[admin@IBR900-13e: /]$ help ssh
Create an SSH connection to an SSH server.

usage:    ssh [-v] [-C] [-1] [-2] [-l username] [-p port] [-c cipher_spec] [user@]hostname

required arguments:
  hostname    Either the hostname or a user@hostname pair

optional arguments:
  -v          Debug level. May be specified up to 3 times (-v, -vv, -vvv).
  -C          Requests compression of all data.
  -1          Force ssh to try protocol version 1 only.
  -2          Force ssh to try protocol version 2 only.
  -l          Specifies login name.
  -p          Specifies port.
  -c          Comma separated list of ciphers (e.g. aes256-ctr,aes192-ctr,aes128-ctr,).

Supported ciphers:
aes256-ctr,aes192-ctr,aes128-ctr,aes256-cbc,aes192-cbc,aes128-cbc,3des-cbc,blowfish-cbc
Note: Cradlepoint routers support only PCI-compliant ciphers by default.
To relax this behavior, set /config/firewall/ssh_admin/weak_ciphers to true.
Doing so will set the ciphers to the list of supported ciphers (above).
[admin@IBR900-13e: /]$ help stp
Show the current STP configuration and status.
[admin@IBR900-13e: /]$ help switch
Show ethernet switch status.
Usage: switch [-v] [show|set|clearstats]

      show [port PORT_NUM]: Only show the port specified

      set PORT_NUM [--link_speed=LINK_SPD]
                   [--enabled=true/false]
                   [--port_name=PORT_NAME]
      clearstats [PORT_NUM]
[admin@IBR900-13e: /]$ help tcpdump
Usage: tcpdump [-aAdDeflLnNOpqRStuvxX] [-c count] [ -E algo:secret ]
               [ -i interface ] [ -M secret ] [ -s snaplen ] [ -T type ]
               [ -y datalinktype ] [ expression ]

[admin@IBR900-13e: /]$ help telnet
The telnet command can be used to access telnet services located on the routers LAN.
USAGE: telnet [host] [port] [timeout]
[admin@IBR900-13e: /]$ help threads
Show currently active threads.
 USAGE: threads [-v]
[admin@IBR900-13e: /]$ help traceroute
Usage: traceroute [options] host [packet_len]

Available options:
  -4                  Use IPv4
  -6                  Use IPv6
  -F                  Do not fragment packets
  -f                  Start from the first_ttl hop (instead from 1)
  -g                  Route packets through the specified gateway
  -I                  Use ICMP ECHO for tracerouting
  -T                  Use TCP SYN for tracerouting (default port is 80)
  -i                  Specify a network interface to operate with
  -m                  Set the max number of hops (max TTL to be reached). Default is 30
  -n                  Do not resolve IP addresses to their domain names
  -p                  Set the destination port to use
  -t                  Set the TOS (IPv4 type of service) or TC (IPv6 traffic class) value for outgoing packets
  -l                  Use specified flow_label for IPv6 packets
  -w                  Set the number of seconds to wait for response to a probe (default is 5.0)
  -q                  Set the number of probes per each hop. Default is 3
  -r                  Bypass the normal routing and send directly to a host on an attached network
  -s                  Use source src_addr for outgoing packets
  -z                  Minimal time interval between probes (default 0)
  -e                  Show ICMP extensions (if present), including MPLS
  --sport=num         Use source port num for outgoing packets. Implies "-N 1"
  --fwmark=num        Set firewall mark for outgoing packets
  -U                  Use UDP to particular port for tracerouting
  -UL                 Use UDPLITE for tracerouting (default dest port is 53)
  -P                  Use raw packet of protocol prot for tracerouting
  --mtu               Discover MTU along the path being traced. Implies "-F -N 1"
  --back              Guess the number of hops in the backward path and print if it differs
  -V                  Print version info and exit

[admin@IBR900-13e: /]$ help uptime
Show system uptime and load avg.
[admin@IBR900-13e: /]$ help vlan
Show VLAN configuration.

[admin@IBR900-13e: /]$ help vpn

Start, stop, or show status of all vpn tunnels.
Start, stop or restart a tunnel.
Adjust logging for various ipsec subsystems.  Reset sets the default
and all subsystems to log level 1.

vpn [show|start|stop]
vpn [starttunnel|stoptunnel|restarttunnel] -n <TUNNEL NAME>
vpn config
vpn loglevel reset
vpn loglevel default [-1|0|1|2|3|4]
vpn loglevel [app|asn|cfg|chd|dmn|enc|esp|ike|imc|imv|job|knl|lib|mgr|net|pts|tls|tnc] [-1|0|1|2|3|4]

[admin@IBR900-13e: /]$ help vrrp
Show the current VRRP configuration and status.
[admin@IBR900-13e: /]$ help wan
Show all the attached wan devices and their current state.
Usage: wan [monitor] [UID] [CONFIG...]
CONFIG: Can be any number of --key=[value] pairs as defined in the /config/wan/rules2 config section.
        If the optional [value] argument is ommited then the current value (if any) will be printed.
        Get example: wan cp1 --ip_mode --static.ip_address
        Set example: wan cp1 --ip_mode="static" --static.ip_address="10.0.0.1" --static.netmask="255.0.0.0"
[admin@IBR900-13e: /]$ help wireless
Show the current wireless configuration and status.
Usage: wireless [OPTIONS...]
    -w Print information about enabled Access Point profiles
    -d Print information about enabled WiFi as WAN / WiFi Bridge profiles
    -c Print information about currently associated WiFi clients
    -v Print additional driver specific debug when available
    -t [CHANNEL] Set wireless channel
    -k [MAC ADDRESS] Kick wireless client
    -s [OPTIONAL DWELL TIME] Perform a wireless survey
    -a [OPTIONAL DWELL TIME] Do a survey and autoselect a channel
    -r [RADIO] Radio to operate on (0: first, 1: second)

[admin@IBR900-13e: /]$ help workqueue
Print current workqueue activities and schedules.
USAGE: workqueue [-v] [-t TASKID] [-a]
           -v: VERBOSE
    -t TASKID: Only show information for a single task
           -a: Show information for active tasks (ie. currently executing)

[admin@IBR900-13e: /]$ help xfrm
Usage: xfrm policy list [ SELECTOR ] [ dir DIR ]
        [ index INDEX ] [ action ACTION ]
Usage: xfrm policy flush
SELECTOR := [ src ADDR[/PLEN] ] [ dst ADDR[/PLEN] ] [ dev DEV ] [ UPSPEC ]
UPSPEC := proto { { tcp | udp | sctp | dccp } [ sport PORT ] [ dport PORT ] |
                  { icmp | ipv6-icmp | 135 } [ type NUMBER ] [ code NUMBER ] |
                  gre [ key { DOTTED-QUAD | NUMBER } ] | PROTO }
DIR := in | out | fwd
ACTION := allow | block
Usage: xfrm state list [ ID ] [ mode MODE ]
Usage: xfrm state flush
ID := [ src ADDR ] [ dst ADDR ] [ spi SPI ]
MODE := transport | tunnel
[admin@IBR900-13e: /]$ help zebra
Usage: zebra [cmd]

Excecute and show output of "cmd". If no "cmd" is given then access to the Quagga CLI is given.
Use "zebra list" to see avaliable commands or See the Quagga documentation for details.

    *** WARNING: Changes made using the Quagga CLI do not persist! ***

The configuration entered via the Cradlepoint user interface will be restored
after user interface changes and/or a router reboot. If the routing protocol
options in the user interface do not allow a necessary Quagga configuration,
please provide all configuration details to Cradlepoint support.

[admin@IBR900-13e: /]$
```

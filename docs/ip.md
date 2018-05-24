Title: ip

This is about the ip command in Linux.

# Examples
The commands here can be shortened like cisco or other network device commands.

## Get the default interface

```
ip route get 8.8.8.8
```

## Show IP neighbors

```
ip neighbor show
```

## Show all configured IP addresses
This is more reliable than ifconfig, which sometimes omits entries.

```
ip -f inet addr
```

## Show information about eth0
This shows information about eth0 and all the virtual interfaces brought up on the physical interface.

```
ip addr show eth0
```

## Monitor IP changes

```
ip mon all
```

## Show interfaces that would route to a given network address

```
ip addr show to 10.1.8.0/24
```

## Show negotiated speeds for all interfaces

```
ip -o link show | awk -F: '{print $2}' | while read -r X ; do
  sudo ethtool ${X} | egrep 'Settings|Speed' | xargs echo
done | column -t -s:
```

## Add a static route

```
ip route add 192.168.100.0/24 via 0.0.0.0 dev eth0
```

## Set MTU for a specific route

- <http://lartc.org/howto/lartc.cookbook.mtu-discovery.html>

```
ip route add default via 10.0.0.1 mtu 296
```

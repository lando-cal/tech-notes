This is about the ip command in Linux.

# Examples
The commands here can be shortened like cisco or other network device commands.

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

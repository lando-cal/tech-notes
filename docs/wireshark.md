Title: Wireshark

Wireshark) is the new name for what was Ethereal. It is a graphical packet sniffer that uses the same libraries as tcpdump.

# Filters

Display filters have their own syntax, whereas capture filters use tcpdump syntax.

## Display Filters

### Filter by packet data content

Display all packets that contain "foo" in the data section:

```
data contains foo
```

### Display hosts within a given subnet

```
ip.addr == 10.57.8.244/30
```

### Display data within a port range

To see all ceph-osd data

```
tcp.port >= 6800 and tcp.port <= 7300
```

# See also

- [tcpdump](tcpdump)

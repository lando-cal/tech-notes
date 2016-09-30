sshuttle is an SSH powered ipv4 routed VPN that doesn't require admin rights on the target host.
- [https://github.com/apenwarr/sshuttle](https://github.com/apenwarr/sshuttle)

# Usage
Tunnel DNS queries and create a route through the given host to the given subnet, and be verbose about it.

```
sshuttle --dns -vr user@host:port 192.168.1.0/24
```

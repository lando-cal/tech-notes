# Example pac file

The following pac file will
- Redirect all traffic destined to `192.168.1.0/24` to a proxy running on `localhost:47000`, but only if we do not have an ip address in that subnet
- Redirect all traffic destined to `172.16.0.0/16` to a proxy running on `localhost:33001`
- All other traffic bypasses the proxy.

```
function FindProxyForURL(url, host) {
  if ((isInNet(host, "192.168.1.0", "255.255.255.0"))
  && (! isInNet(myIpAddress(), "192.168.1.0", "255.255.255.0"))) {
    return "SOCKS5 localhost:47000" ;
  } else if (isInNet(host, "172.16.0.0", "255.255.0.0")) {
    return "SOCKS5 localhost:33001" ;
  } else {
    return "DIRECT" ;
  }
}
```

# Links

- <http://findproxyforurl.com/official-toolset>
- <https://github.com/pacparser/pacparser>

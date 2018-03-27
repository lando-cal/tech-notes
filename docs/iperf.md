"iperf3: A TCP, UDP, and SCTP network bandwidth measurement tool" - <https://github.com/esnet/iperf>

# Links

- Sample usage - <https://fasterdata.es.net/performance-testing/network-troubleshooting-tools/iperf/>

# Example usage

# Example server (receiving side)

```
iperf3 -s
```

# Example client (sending side)

```
iperf3 -c remote-hostname --interval 0.5 --omit 2 --time 30 --set-mss 1460
```

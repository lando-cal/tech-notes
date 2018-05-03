Title: ss

"ss - another utility to investigate sockets" - man ss

This tool shows all sockets, not just networking sockets.

# Examples

Options can be concatenated, so `ss -t -n -l -p` can be `ss -tnlp`

## Show all established connections, don't resolve service names

```
ss -n
```

## Show all listening sockets

```
ss -l
```

## Display all TCP sockets

```
ss -t -a
```

## Show ipv4 listening sockets sorted by port

```
ss -4 -ltn | sort -k2 -t: -n
```

## Show ssh connections

```
ss -at '( sport = :ssh or dport = :ssh )'
```

## Show ipv4 sockets in a particular state

```
ss -t4 state time-wait
```

## Show the processes for listening ipv4 sockets

```
ss -lt4p
```

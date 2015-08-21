"ss - another utility to investigate sockets" – man ss

This tool shows all sockets, not just networking sockets.

## Examples

Options can be concatenated, so `ss -t -n -l -p` can be `ss -tnlp`

### Show all established connections, don't resolve service names

    ss -n

### Show all listening sockets

    ss -l

### Display all TCP sockets

    ss -t -a

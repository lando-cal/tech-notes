lsof lists open files.  This CLI tool is available on most *nix OSes.

# Examples

## List files open by a given user
    lsof -u username

## show listening TCP sockets
Since everything in unix is a file, including network sockets, you can list open sockets and the programs that have them open.

    lsof -iTCP -sTCP:LISTEN

## Show a sorted list of processes by listening port

    lsof -iTCP -sTCP:LISTEN -P | sort -k2 -t: -n

## show what process is using port 1900 with port numbers

    # -P makes lsof not resolve service names for port numbers. -iTCP shows IP TCP sockets.
    lsof -P -iTCP:1900

## show the selinux context for sockets

    lsof -i -Z

See man page for extended syntax around Z

# See Also

- Process Explorer - LSOF type functionality for windows.

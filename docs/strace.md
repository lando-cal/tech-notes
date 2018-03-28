# strace

`strace` is a tool to trace system calls and signals in Linux.

# Examples

## Trace a running process

```
strace -p 5789
```

## Trace only exec calls of a command and all child processes

```
strace -f -eexecve cf-agent -K
```

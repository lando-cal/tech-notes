Title: ps

`ps` shows a list of processes in a *nix system.

# Examples

## show the exact command used to start all process

```
ps axwwo command
```

## show a process tree view

```
ps auxf
```

## show only all running processes

This excludes sleeping processes and threads.

```
ps auxr
```

## Show process list sorted by process start time

```
ps hax -o lstart,pid,args |
  while read -r a b c d e f g ; do
    echo "$(date -d "$a $b $c $d $e" "+%F %T%z") $f $g" ;
  done |
  sort
```

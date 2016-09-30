a command to reboot a *nix server.

# Examples
## Reboot a server in 5 minutes with a message

```
shutdown -r +5 "Please announce in #dev if you would like to cancel this reboot"
```

## Power off a server in 5 minutes

```
shutdown -P +5
```

## Cancel a scheduled shutdown

```
shutdown -c
```

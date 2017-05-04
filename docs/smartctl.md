Linux interface to SMART data for hard disks.

# Examples
## Show identifying information about a device

```
smartctl -i /dev/sda
```

## Show drive attributes

This shows a bunch of recorded information that is updated over the life of the drive.

```
smartctl -A /dev/sda
```

Show the same information with better output showing vendor flags

```
smartctl -A -f brief /dev/sda
```

## Show all data

```
smartctl -x /dev/sda
```

Title: pv

`pv` - monitor the progress of data through a pipe

This can be used in place of `dd` or `dcfldd` in some cases, such as copying disks or files. It's also useful for including with `nc` so you can see stats about the flow of that pipe.

# Examples

## Show the average growth rate of logs

```
xtail /nail/scribe/buffer/some_service_gnerated | pv -a > /dev/null
```

## Write a disk image to usb

This can be used in place of `dd if=file of=/dev/disk`

```
# As root
pv ~hoherd/Downloads/ubuntu-16.04.1-desktop-amd64.iso > /dev/rdisk4
```

# See Also
- [dcfldd](dcfldd)
- [dd](dd)
- [ddrescue](ddrescue)

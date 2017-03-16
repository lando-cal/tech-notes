`dcfldd` is an advanced version of `dd` which is more useful than `pv` in some situations.

One simple advantage `dcfldd` has over `dd` is a progress counter displayed by default, although even with `dd` you can see progress by pressing `ctrl-t`. However, if all you need is a progress display, `pv` is really your best bet.

Another useful advantage dcfldd has is the ability to specify hex and ascii patterns, as well as the output of a command as the source. You may also specify multiple outputs.

# Examples

## Wipe a hard disk

This wipes hard disk /dev/rdisk9 with binary `01010101` pattern.

```
dcfldd pattern=AAAA of=/dev/rdisk9
```

## Resume wiping a hard disk

You can use `seek` to skip past the first N blocks on the destination disk. If you have to resume multiple times, perhaps the best option is to use bash's arithmetic expansion to add up the number of blocks written.

```
$ dcfldd pattern=AAAA of=/dev/rdisk3
3328 blocks (104Mb) written.^C
3466+0 records in
3465+0 records out
$ dcfldd pattern=AAAA of=/dev/rdisk3 seek=3328
2936064 blocks (91752Mb) written.^C
2936132+0 records in
2936131+0 records out
$ dcfldd pattern=AAAA of=/dev/rdisk3 seek=$((3328+2936064))
```

## View progress with pv

`pv` is useful for seeing the transfer rate of the pipe, which can help diagnose continued success or lack thereof with failing hard disks.

```
root# dcfldd pattern=AAAA | pv | dcfldd of=/dev/rdisk3 seek=$((4192000+504000+10240000+2936064))
512 blocks (16Mb) written.22.1MiB 0:00:07 [21.7MiB/s] [   <=>
1280 blocks (40Mb) written.43.5MiB 0:00:08 [21.5MiB/s] [    <=>
2304 blocks (72Mb) written.79.4MiB 0:00:09 [35.9MiB/s] [      <=>
3584 blocks (112Mb) written. 114MiB 0:00:10 [35.2MiB/s] [       <=>
```

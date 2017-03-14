`dcfldd` is an advanced version of `dd` which is more useful than `pv` in some situations.

One simple advantage `dcfldd` has over `dd` is a progress counter displayed by default, although even with `dd` you can see progress by pressing `ctrl-t`. However, if all you need is a progress display, `pv` is really your best bet.

Another useful advantage dcfldd has is the ability to specify hex and ascii patterns, as well as the output of a command as the source. You may also specify multiple outputs.

# Examples

## Wipe a hard disk

This wipes hard disk /dev/rdisk9 with binary `01010101` pattern.

```
dcfldd pattern=AAAA of=/dev/rdisk9
```

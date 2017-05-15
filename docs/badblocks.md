badblocks is a program to test storage devices for bad blocks. - <https://wiki.archlinux.org/index.php/badblocks>

# Examples

## Destroy all data on a disk while logging bad blocks

```
# -v verbose output writes error info to stderr
# -s show scan progress, including percent complete, time elapsed, and error count
# -w destructive write test, vs -n (nondestructive read/write test)
# -b 4096 byte blocks
# -t random test pattern
# -o output file containing list of bad blocks, which can be passed back to badblocks, fsck or mke2fs
adblocks -v -s -w -b 4096 -t random -o ~/sdc.txt /dev/sdc
```

# See also

- dcfldd
- dd
- ddrescue
- pv

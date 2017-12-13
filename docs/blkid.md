"The blkid program is the command-line interface to working with the libblkid(3) library. It can determine the type of content (e.g. filesystem or swap) that a block device holds, and also attributes (tokens, NAME=value pairs) from the content metadata (e.g. LABEL or UUID fields). blkid has two main forms of operation: either searching for a device with a specific NAME=value pair, or displaying NAME=value pairs for one or more specified devices." - `man blkid`

# Examples

## Simple usage

Here is the output of `blkid` on an [Ubuntu](ubuntu) 16.04 [Vagrant](vagrant) box:

```
$ blkid
/dev/sda1: LABEL="cloudimg-rootfs" UUID="743b1402-d445-494c-af0b-749040bb33e4" TYPE="ext4" PARTUUID="95a4c157-01"
/dev/sdb: UUID="2017-12-12-14-38-00-00" LABEL="cidata" TYPE="iso9660"
```

# See Also

- [findmnt](findmnt)
- [lsblk](lsblk)

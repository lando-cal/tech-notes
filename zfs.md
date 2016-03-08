ZFS is the Zetabyte File System.

# Links

- Example zpool errors - Zpool errors
- OpenZFS - <http://open-zfs.org>
- Tuning Guide - <http://www.solarisinternals.com/wiki/index.php/ZFS_Evil_Tuning_Guide>
- Hardware recommendations - <http://blog.zorinaq.com/?e=10>
- Mac ZFS - <http://code.google.com/p/maczfs/>
- Shadow migration feature - <http://docs.oracle.com/cd/E23824_01/html/821-1448/gkkud.html>
- Speed tuning - <http://icesquare.com/wordpress/how-to-improve-zfs-performance/>
- ZFS RAID levels - <http://www.zfsbuild.com/2010/05/26/zfs-raid-levels/>
- <http://en.wikipedia.org/wiki/ZFS>
- <http://wiki.freebsd.org/ZFSQuickStartGuide>
- <http://www.solarisinternals.com/wiki/index.php/ZFS_Best_Practices_Guide>
- <http://zfsguru.com>
- <http://zfsonlinux.org/faq.html>
- <http://www.oracle.com/technetwork/articles/servers-storage-admin/o11-113-size-zfs-dedup-1354231.html>
- <http://wiki.freebsd.org/ZFSTuningGuide#Deduplication>

# Tips

## Memory

- For normal operation, 1gb of memory per tb of disk space is suitable.
- For dedupe operation, 5gb of memory per tb of usable disk space is suitable.

## Log devices

- Use a log device if you have lots of writes.
- Mirror it, because if you lose it you lose the whole volume.
- Speed and latency are most important, not size.  Log flushes every 5 seconds.
- Get SLC if possible, otherwise MLC

## Cache devices

- Use if you have lots of reads
- Size does matter, with big devices more data can be cached for faster reads of more data.
- Speed and latency matter
- Mirror does not matter because if it fails, reads come from the spinning disks

Good explanation: <https://blogs.oracle.com/brendan/entry/test>

# zdb

## Show the potential savings of turning on dedupe on zpool bigdisk

<http://hub.opensolaris.org/bin/view/Community+Group+zfs/dedup>

```
zdb -S bigdisk
```

# zpool

## Create a zpool and its base filesystem

```
zpool create -f -o cachefile=/tmp/zpool.cache zpoolname /dev/ada1 #create a zpool
```

## Add a cache device to a pool

```
zpool add bigdisk cache ada0p3 # add ada0p3 as a cache device to the bigdisk zpool
```

## Show all configured zpool options for a given zpool

```
zpool get all z4 # get all configured zpool options
```

## Show history of all operations on a given pool

```
zpool history # show history of operations on the pool, eg: snapshots, attribute changes
```

## Show real time statistics on a given zpool

```
zpool iostat -v 1 # show per-device statistics every 1 second
```

## Show basic information about all imported zpools

```
zpool list # show zpool space info, deduplication ratio and health
```

## Show deduplication tables

```
zpool status -D z2 # show deduplication table entries. Take entries * size / 1024 / 1024 to calculate DDT consumption
```

## Replace a disk in a zpool

```
zpool replace -f z3 /dev/disk/by-id/ata-ST3000DM001-9YN166_W1F09CW9 /dev/disk/by-id/ata-ST3000DM001-9YN166_Z1F0N9S7 # Replace the first disk with the second in the z3 pool
```

# zfs

## show differences between filesystem and snapshot

```
zfs diff z3 z3@snap # show the filesystem differences between the dataset and the snapshot
```

## Show configured properties for a filesystem

```
zfs get all # show configured zfs properties
```

## Show custom filesystem attributes

```
zfs get all -s local z3 # show custom attributes that override inherited attributes
```

## Show an overview of all mounted zfs filesystems

```
zfs list # show disk space including free physical disk space and mount info
```

## Show specified fields of each filesystem

```
zfs list -t all -o name,referenced,used,written,creation,userused@root # show the listed fields of all filesystems
```

## Show only snapshots

```
zfs list -t snapshot # list snapshots
```

## Show space consumed by file owner

```
zfs userspace bigdisk # show space consumed by each user
```

## Disable atime updates for a filesystem

```
zfs set atime=off bigdisk # disable atime updates
```

## Set compression to lz4 for a filesystem

```
zfs set compression=lz4 z3 # enable compression
```

## Set deduplication to enabled for a filesystem

```
zfs set dedup=on exports # enable deduplication
```

## Set a filesystem to readonly

```
zfs set readonly=on zpoolname/dataset # set read-only attribute
```

## Set a filesystem to allow NFS sharing

```
zfs set sharenfs=on zpoolname # enable NFS sharing of a zpool
```

## Create a dataset

```
zfs create z5/sole # create a dataset 'sole' on zpool 'z5'
```

## Destroy multiple snapshots

```
zfs destroy z3@20130413-weekly,20130420-weekly,20130428-weekly,20130505-weekly
```

## zfs send / receive

Replicate a zpool (use the latest snapshot name as the source) to a blank zpool:

```
zfs send -v -D -R bigdisk@20120907-oldest | zfs receive -F -v z2
```

- -D enables a deduplicated stream.
- -R enables a recursive send of all snapshots and filesystems up to that point.
- -F enables deletion of any snapshots on the target that don't exist on the sender
- -v enables verbose mode

## recursively zfs send a filesystem to a remote host and recieve it as a new dataset

```
zfs send -v -D -R z1@20120907-oldest | ssh otherhost zfs receive -v z2/z1
```

## Show summary of what would be sent

This shows an entire dataset up to the given snapshot

```
zfs send -n -v -D -R z3@20140531-monthly
```

## Show the space differences between two snapshots

```
zfs send -n -v -D -i z3@20140531-monthly z3@20141031-monthly
```

## Show the amount of new space consumed by each monthly

```
zfs list -o name | grep 'z3@.*monthly' | while read -r X ; do [[ ! $a =~ .*monthly ]] && a=$X || zfs send -n -v -D -i $a $X && a=$X ; done 2>&1 | grep send
```

# Complex examples

## Create a raidz called z3

Create a raidz pool from 4 disks and set some properties:

```
pool=z3
zpool create -f "${pool}" raidz /dev/disk/by-id/scsi-SATA_HGST_HDN724040A_PK2338P4H*-part1 -o ashift=12
zfs set dedup=on "${pool}"
zpool set listsnapshots=on "${pool}"
zfs set atime=off "${pool}"
zfs set compression=lz4 "${pool}"
```

## Create a case insensitive raidz3 out of 50 files

```
pool=tank
for X in {1..50} ; do mkfile -n 2g ${pool}.$X ; done ;
sudo zpool create -O casesensitivity=insensitive ${pool} raidz3 /Users/danielh/Desktop/Stuff/${pool}/${pool}.{1..50}
```

# Troubleshooting

## Mount a pool that is giving you Trouble

```
zpool import -o failmode=continue -o readonly=on zpool_name
```

This helped me get read access to a pool that was kernel panicking with the following error when I tried to import it normally:

```
Dec  7 14:48:40 localhost kernel: PANIC: blkptr at ffff8803fddb4200 DVA 0 has invalid OFFSET 294940902907904
```

# ZFS on Mac OS X

- <http://openzfsonosx.org>

## Create a ZFS partition on /dev/disk3

```
# Must eject device in Disk Utility first
diskutil partitiondisk /dev/disk3 GPTFormat ZFS %noformat% 100% # strange syntax, but works
zpool create backups1 /dev/disk3s2 # create the zpool
mdutil -i off /Volumes/backups1 # required on MacZFS since spotlight does not function
```

# ZFS on Linux

- If you get module errors: `modprobe zfs ; ldconfig`
- If you get permission denied, check selinux settings

## CentOS 6 Repository

```
sudo yum install -y epel-release # assumes later CentOS 6 where epel is provided upstream
sudo yum localinstall --nogpgcheck http://archive.zfsonlinux.org/epel/zfs-release.el6.noarch.rpm
sudo yum install zfs -y
```

### Reinstalling when things fail

```
#!/bin/bash -x
yum install -y kernel-devel-$(uname -r)
zfs_version=0.6.5.4
dkms remove  -m zfs -v "${zfs_version}" --all
dkms remove  -m spl -v "${zfs_version}" --all
dkms add     -m spl -v "${zfs_version}" --force
dkms add     -m zfs -v "${zfs_version}" --force
dkms install -m spl -v "${zfs_version}" --force
dkms install -m zfs -v "${zfs_version}" --force
```

### Inspect the rpm for what scripts it runs

This is useful for debugging failures after kernel upgrade.

```
rpm -q --scripts zfs-dkms
```

## Building on CentOS 6

```
yum groupinstall "Development tools" && yum install -y libuuid-devel zlib-devel bc lsscsi mdadm parted kernel-debug
# For spl, then again for zfs:
./configure && make && make rpm && rpm -i *64.rpm
```

"sgdisk - Command-line GUID partition table (GPT) manipulator for Linux and Unix" - man sgdisk

# Examples
## Randomize GUIDs to ensure uniqueness after cloning

```
sgdisk --randomize-guids /dev/sdz
```

## Print info about partitions on a disk

```
sgdisk -p /dev/sdz
```

## Print last block number of the largest available section of the disk

```
sgdisk -E /dev/sdz
```

## Create a new partition
The syntax is partitionNumber:firstBlock:lastBlock

```
sgdisk -n 1:2048:732566636 /dev/sdz
```

## Print extended info about the first partition on /dev/sda

```
sgdisk -i 1 /dev/sdz
```

## Backup a GUID partition table

```
sgdisk -b ~/sdz_partition_backup /dev/sdz
```

## Restore a GUID partition table

```
sgdisk -l ~/sdz_partition_backup /dev/sdz
```

## Create a new partition
This creates a 4th partition that is 50G using the default starting point (0 is default)

```
sgdisk /dev/sdz --new=4:0:+50G
```

## Delete the 4th partition

```
sgdisk /dev/sdz -d 4
```

## Create a new partition number 4 that fills the biggest available section of the disk

```
sgdisk /dev/sdz -N 4
```

## Grab the name of a partition

```
# sloppy, doesn't handle spaces or single quotes
sgdisk /dev/sdk -i 1 | grep '^Partition name' | awk '{print $NF}' | sed "s/'//g"
```

Title: lsblk

"lsblk  lists information about all available or the specified block devices.  The lsblk command reads the sysfs filesystem and udev db to gather information." - `man lsblkq`

# Examples

## Simple usage

Here is the output of `lsblk` on an [Ubuntu](ubuntu) 16.04 [Vagrant](vagrant) box:

```
$ lsblk
NAME   MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
sda      8:0    0  10G  0 disk
└─sda1   8:1    0  10G  0 part /
sdb      8:16   0  10M  0 disk
```

## Show filesystem information

```
$ lsblk -f
NAME   FSTYPE  LABEL           UUID                                 MOUNTPOINT
sda
└─sda1 ext4    cloudimg-rootfs 73ea38ed-7fcd-4871-8afa-17d36f4e4bfc /
sdb    iso9660 cidata          2017-08-15-16-47-34-00
```

## Show some chosen fields

To see a list of available columns, run `lsblk -o`.

```
$ lsblk -do NAME,SIZE,TYPE,VENDOR,MODEL,SERIAL
NAME   SIZE TYPE VENDOR   MODEL            SERIAL
sdd    1.8T disk ATA      Micron_5100_MTFD 18211C914753
sdb    1.8T disk ATA      Micron_5100_MTFD 18211C914736
sde    1.8T disk ATA      Micron_5100_MTFD 171216897B54
sdc    1.8T disk ATA      Micron_5100_MTFD 171216897B63
sda  223.6G disk ATA      INTEL SSDSC2KB24 BTYS815301VG245AGN
```

## Show all available information

The output here is really wide, but reformatting it through JSON makes it easier to read. Thankfully `lsblk` has a JSON output option, unlike many unix CLI tools.

```
$ lsblk -O -J | jq .
{
  "blockdevices": [
    {
      "name": "sda",
      "kname": "sda",
      "maj:min": "8:0",
      "fstype": null,
      "mountpoint": null,
      "label": null,
      "uuid": null,
      "parttype": null,
      "partlabel": null,
      "partuuid": null,
      "partflags": null,
      "ra": "128",
      "ro": "0",
      "rm": "0",
      "hotplug": "0",
      "model": "HARDDISK        ",
      "serial": null,
      "size": "10G",
      "state": "running",
      "owner": "root",
      "group": "disk",
      "mode": "brw-rw----",
      "alignment": "0",
      "min-io": "512",
      "opt-io": "0",
      "phy-sec": "512",
      "log-sec": "512",
      "rota": "1",
      "sched": "deadline",
      "rq-size": "128",
      "type": "disk",
      "disc-aln": "0",
      "disc-gran": "0B",
      "disc-max": "0B",
      "disc-zero": "0",
      "wsame": "0B",
      "wwn": null,
      "rand": "1",
      "pkname": null,
      "hctl": "2:0:0:0",
      "tran": "spi",
      "subsystems": "block:scsi:pci",
      "rev": "1.0 ",
      "vendor": "VBOX    ",
      "children": [
        {
          "name": "sda1",
          "kname": "sda1",
          "maj:min": "8:1",
          "fstype": "ext4",
          "mountpoint": "/",
          "label": "cloudimg-rootfs",
          "uuid": "73ea38ed-7fcd-4871-8afa-17d36f4e4bfc",
          "parttype": "0x83",
          "partlabel": null,
          "partuuid": "8d714561-01",
          "partflags": "0x80",
          "ra": "128",
          "ro": "0",
          "rm": "0",
          "hotplug": "0",
          "model": null,
          "serial": null,
          "size": "10G",
          "state": null,
          "owner": "root",
          "group": "disk",
          "mode": "brw-rw----",
          "alignment": "0",
          "min-io": "512",
          "opt-io": "0",
          "phy-sec": "512",
          "log-sec": "512",
          "rota": "1",
          "sched": "deadline",
          "rq-size": "128",
          "type": "part",
          "disc-aln": "0",
          "disc-gran": "0B",
          "disc-max": "0B",
          "disc-zero": "0",
          "wsame": "0B",
          "wwn": null,
          "rand": "1",
          "pkname": "sda",
          "hctl": null,
          "tran": null,
          "subsystems": "block:scsi:pci",
          "rev": null,
          "vendor": null
        }
      ]
    },
    {
      "name": "sdb",
      "kname": "sdb",
      "maj:min": "8:16",
      "fstype": "iso9660",
      "mountpoint": null,
      "label": "cidata",
      "uuid": "2017-08-15-16-47-34-00",
      "parttype": null,
      "partlabel": null,
      "partuuid": null,
      "partflags": null,
      "ra": "128",
      "ro": "0",
      "rm": "0",
      "hotplug": "0",
      "model": "HARDDISK        ",
      "serial": null,
      "size": "10M",
      "state": "running",
      "owner": "root",
      "group": "disk",
      "mode": "brw-rw----",
      "alignment": "0",
      "min-io": "512",
      "opt-io": "0",
      "phy-sec": "512",
      "log-sec": "512",
      "rota": "1",
      "sched": "deadline",
      "rq-size": "128",
      "type": "disk",
      "disc-aln": "0",
      "disc-gran": "0B",
      "disc-max": "0B",
      "disc-zero": "0",
      "wsame": "32M",
      "wwn": null,
      "rand": "1",
      "pkname": null,
      "hctl": "2:0:1:0",
      "tran": "spi",
      "subsystems": "block:scsi:pci",
      "rev": "1.0 ",
      "vendor": "VBOX    "
    }
  ]
}
```

# See also

- [findmnt](findmnt)

Title: findmnt

"findmnt will list all mounted filesytems or search for a filesystem. The findmnt command is able to search in /etc/fstab, /etc/fstab.d, /etc/mtab or /proc/self/mountinfo. If device or mountpoint is not given, all filesystems are shown." - `man findmnt`

# Examples

## Simple usage

Here is the output of `findmnt` on an [Ubuntu](ubuntu) 16.04 [Vagrant](vagrant) box:

```
TARGET                                SOURCE     FSTYPE     OPTIONS
/                                     /dev/sda1  ext4       rw,relatime,data=ordered
├─/sys                                sysfs      sysfs      rw,nosuid,nodev,noexec,relatime
│ ├─/sys/kernel/security              securityfs securityfs rw,nosuid,nodev,noexec,relatime
│ ├─/sys/fs/cgroup                    tmpfs      tmpfs      ro,nosuid,nodev,noexec,mode=755
│ │ ├─/sys/fs/cgroup/systemd          cgroup     cgroup     rw,nosuid,nodev,noexec,relatime,xattr,release_agent=/lib/systemd/systemd-cgroups-agent,name=systemd
│ │ ├─/sys/fs/cgroup/cpu,cpuacct      cgroup     cgroup     rw,nosuid,nodev,noexec,relatime,cpu,cpuacct
│ │ ├─/sys/fs/cgroup/perf_event       cgroup     cgroup     rw,nosuid,nodev,noexec,relatime,perf_event
│ │ ├─/sys/fs/cgroup/hugetlb          cgroup     cgroup     rw,nosuid,nodev,noexec,relatime,hugetlb
│ │ ├─/sys/fs/cgroup/blkio            cgroup     cgroup     rw,nosuid,nodev,noexec,relatime,blkio
│ │ ├─/sys/fs/cgroup/devices          cgroup     cgroup     rw,nosuid,nodev,noexec,relatime,devices
│ │ ├─/sys/fs/cgroup/cpuset           cgroup     cgroup     rw,nosuid,nodev,noexec,relatime,cpuset
│ │ ├─/sys/fs/cgroup/memory           cgroup     cgroup     rw,nosuid,nodev,noexec,relatime,memory
│ │ ├─/sys/fs/cgroup/net_cls,net_prio cgroup     cgroup     rw,nosuid,nodev,noexec,relatime,net_cls,net_prio
│ │ ├─/sys/fs/cgroup/freezer          cgroup     cgroup     rw,nosuid,nodev,noexec,relatime,freezer
│ │ └─/sys/fs/cgroup/pids             cgroup     cgroup     rw,nosuid,nodev,noexec,relatime,pids
│ ├─/sys/fs/pstore                    pstore     pstore     rw,nosuid,nodev,noexec,relatime
│ ├─/sys/kernel/debug                 debugfs    debugfs    rw,relatime
│ └─/sys/fs/fuse/connections          fusectl    fusectl    rw,relatime
├─/proc                               proc       proc       rw,nosuid,nodev,noexec,relatime
│ └─/proc/sys/fs/binfmt_misc          systemd-1  autofs     rw,relatime,fd=33,pgrp=1,timeout=0,minproto=5,maxproto=5,direct
├─/dev                                udev       devtmpfs   rw,nosuid,relatime,size=500888k,nr_inodes=125222,mode=755
│ ├─/dev/pts                          devpts     devpts     rw,nosuid,noexec,relatime,gid=5,mode=620,ptmxmode=000
│ ├─/dev/shm                          tmpfs      tmpfs      rw,nosuid,nodev
│ ├─/dev/hugepages                    hugetlbfs  hugetlbfs  rw,relatime
│ └─/dev/mqueue                       mqueue     mqueue     rw,relatime
├─/run                                tmpfs      tmpfs      rw,nosuid,noexec,relatime,size=101596k,mode=755
│ ├─/run/lock                         tmpfs      tmpfs      rw,nosuid,nodev,noexec,relatime,size=5120k
│ └─/run/user/1000                    tmpfs      tmpfs      rw,nosuid,nodev,relatime,size=101596k,mode=700,uid=1000,gid=1000
├─/var/lib/lxcfs                      lxcfs      fuse.lxcfs rw,nosuid,nodev,relatime,user_id=0,group_id=0,allow_other
└─/vagrant                            vagrant    vboxsf     rw,nodev,relatime
```

## Output as key/value pairs per device

```
$ findmnt -P
TARGET="/sys" SOURCE="sysfs" FSTYPE="sysfs" OPTIONS="rw,nosuid,nodev,noexec,relatime"
TARGET="/proc" SOURCE="proc" FSTYPE="proc" OPTIONS="rw,nosuid,nodev,noexec,relatime"
TARGET="/dev" SOURCE="udev" FSTYPE="devtmpfs" OPTIONS="rw,nosuid,relatime,size=500888k,nr_inodes=125222,mode=755"
TARGET="/dev/pts" SOURCE="devpts" FSTYPE="devpts" OPTIONS="rw,nosuid,noexec,relatime,gid=5,mode=620,ptmxmode=000"
TARGET="/run" SOURCE="tmpfs" FSTYPE="tmpfs" OPTIONS="rw,nosuid,noexec,relatime,size=101596k,mode=755"
TARGET="/" SOURCE="/dev/sda1" FSTYPE="ext4" OPTIONS="rw,relatime,data=ordered"
TARGET="/sys/kernel/security" SOURCE="securityfs" FSTYPE="securityfs" OPTIONS="rw,nosuid,nodev,noexec,relatime"
TARGET="/dev/shm" SOURCE="tmpfs" FSTYPE="tmpfs" OPTIONS="rw,nosuid,nodev"
TARGET="/run/lock" SOURCE="tmpfs" FSTYPE="tmpfs" OPTIONS="rw,nosuid,nodev,noexec,relatime,size=5120k"
TARGET="/sys/fs/cgroup" SOURCE="tmpfs" FSTYPE="tmpfs" OPTIONS="ro,nosuid,nodev,noexec,mode=755"
TARGET="/sys/fs/cgroup/systemd" SOURCE="cgroup" FSTYPE="cgroup" OPTIONS="rw,nosuid,nodev,noexec,relatime,xattr,release_agent=/lib/systemd/systemd-cgroups-agent,name=systemd"
TARGET="/sys/fs/pstore" SOURCE="pstore" FSTYPE="pstore" OPTIONS="rw,nosuid,nodev,noexec,relatime"
TARGET="/sys/fs/cgroup/net_cls,net_prio" SOURCE="cgroup" FSTYPE="cgroup" OPTIONS="rw,nosuid,nodev,noexec,relatime,net_cls,net_prio"
TARGET="/sys/fs/cgroup/perf_event" SOURCE="cgroup" FSTYPE="cgroup" OPTIONS="rw,nosuid,nodev,noexec,relatime,perf_event"
TARGET="/sys/fs/cgroup/cpu,cpuacct" SOURCE="cgroup" FSTYPE="cgroup" OPTIONS="rw,nosuid,nodev,noexec,relatime,cpu,cpuacct"
TARGET="/sys/fs/cgroup/hugetlb" SOURCE="cgroup" FSTYPE="cgroup" OPTIONS="rw,nosuid,nodev,noexec,relatime,hugetlb"
TARGET="/sys/fs/cgroup/memory" SOURCE="cgroup" FSTYPE="cgroup" OPTIONS="rw,nosuid,nodev,noexec,relatime,memory"
TARGET="/sys/fs/cgroup/devices" SOURCE="cgroup" FSTYPE="cgroup" OPTIONS="rw,nosuid,nodev,noexec,relatime,devices"
TARGET="/sys/fs/cgroup/freezer" SOURCE="cgroup" FSTYPE="cgroup" OPTIONS="rw,nosuid,nodev,noexec,relatime,freezer"
TARGET="/sys/fs/cgroup/cpuset" SOURCE="cgroup" FSTYPE="cgroup" OPTIONS="rw,nosuid,nodev,noexec,relatime,cpuset"
TARGET="/sys/fs/cgroup/blkio" SOURCE="cgroup" FSTYPE="cgroup" OPTIONS="rw,nosuid,nodev,noexec,relatime,blkio"
TARGET="/sys/fs/cgroup/pids" SOURCE="cgroup" FSTYPE="cgroup" OPTIONS="rw,nosuid,nodev,noexec,relatime,pids"
TARGET="/proc/sys/fs/binfmt_misc" SOURCE="systemd-1" FSTYPE="autofs" OPTIONS="rw,relatime,fd=26,pgrp=1,timeout=0,minproto=5,maxproto=5,direct"
TARGET="/sys/kernel/debug" SOURCE="debugfs" FSTYPE="debugfs" OPTIONS="rw,relatime"
TARGET="/dev/hugepages" SOURCE="hugetlbfs" FSTYPE="hugetlbfs" OPTIONS="rw,relatime"
TARGET="/dev/mqueue" SOURCE="mqueue" FSTYPE="mqueue" OPTIONS="rw,relatime"
TARGET="/sys/fs/fuse/connections" SOURCE="fusectl" FSTYPE="fusectl" OPTIONS="rw,relatime"
TARGET="/var/lib/lxcfs" SOURCE="lxcfs" FSTYPE="fuse.lxcfs" OPTIONS="rw,nosuid,nodev,relatime,user_id=0,group_id=0,allow_other"
TARGET="/vagrant" SOURCE="vagrant" FSTYPE="vboxsf" OPTIONS="rw,nodev,relatime"
TARGET="/run/user/1000" SOURCE="tmpfs" FSTYPE="tmpfs" OPTIONS="rw,nosuid,nodev,relatime,size=101596k,mode=700,uid=1000,gid=1000"
```

## Output as JSON

```
$ findmnt -J
{
   "filesystems": [
      {"target": "/", "source": "/dev/sda1", "fstype": "ext4", "options": "rw,relatime,data=ordered",
         "children": [
            {"target": "/sys", "source": "sysfs", "fstype": "sysfs", "options": "rw,nosuid,nodev,noexec,relatime",
               "children": [
                  {"target": "/sys/kernel/security", "source": "securityfs", "fstype": "securityfs", "options": "rw,nosuid,nodev,noexec,relatime"},
                  {"target": "/sys/fs/cgroup", "source": "tmpfs", "fstype": "tmpfs", "options": "ro,nosuid,nodev,noexec,mode=755",
                     "children": [
                        {"target": "/sys/fs/cgroup/systemd", "source": "cgroup", "fstype": "cgroup", "options": "rw,nosuid,nodev,noexec,relatime,xattr,release_agent=/lib/systemd/systemd-cgroups-agent,name=systemd"},
                        {"target": "/sys/fs/cgroup/net_cls,net_prio", "source": "cgroup", "fstype": "cgroup", "options": "rw,nosuid,nodev,noexec,relatime,net_cls,net_prio"},
                        {"target": "/sys/fs/cgroup/perf_event", "source": "cgroup", "fstype": "cgroup", "options": "rw,nosuid,nodev,noexec,relatime,perf_event"},
                        {"target": "/sys/fs/cgroup/cpu,cpuacct", "source": "cgroup", "fstype": "cgroup", "options": "rw,nosuid,nodev,noexec,relatime,cpu,cpuacct"},
                        {"target": "/sys/fs/cgroup/hugetlb", "source": "cgroup", "fstype": "cgroup", "options": "rw,nosuid,nodev,noexec,relatime,hugetlb"},
                        {"target": "/sys/fs/cgroup/memory", "source": "cgroup", "fstype": "cgroup", "options": "rw,nosuid,nodev,noexec,relatime,memory"},
                        {"target": "/sys/fs/cgroup/devices", "source": "cgroup", "fstype": "cgroup", "options": "rw,nosuid,nodev,noexec,relatime,devices"},
                        {"target": "/sys/fs/cgroup/freezer", "source": "cgroup", "fstype": "cgroup", "options": "rw,nosuid,nodev,noexec,relatime,freezer"},
                        {"target": "/sys/fs/cgroup/cpuset", "source": "cgroup", "fstype": "cgroup", "options": "rw,nosuid,nodev,noexec,relatime,cpuset"},
                        {"target": "/sys/fs/cgroup/blkio", "source": "cgroup", "fstype": "cgroup", "options": "rw,nosuid,nodev,noexec,relatime,blkio"},
                        {"target": "/sys/fs/cgroup/pids", "source": "cgroup", "fstype": "cgroup", "options": "rw,nosuid,nodev,noexec,relatime,pids"}
                     ]
                  },
                  {"target": "/sys/fs/pstore", "source": "pstore", "fstype": "pstore", "options": "rw,nosuid,nodev,noexec,relatime"},
                  {"target": "/sys/kernel/debug", "source": "debugfs", "fstype": "debugfs", "options": "rw,relatime"},
                  {"target": "/sys/fs/fuse/connections", "source": "fusectl", "fstype": "fusectl", "options": "rw,relatime"}
               ]
            },
            {"target": "/proc", "source": "proc", "fstype": "proc", "options": "rw,nosuid,nodev,noexec,relatime",
               "children": [
                  {"target": "/proc/sys/fs/binfmt_misc", "source": "systemd-1", "fstype": "autofs", "options": "rw,relatime,fd=26,pgrp=1,timeout=0,minproto=5,maxproto=5,direct"}
               ]
            },
            {"target": "/dev", "source": "udev", "fstype": "devtmpfs", "options": "rw,nosuid,relatime,size=500888k,nr_inodes=125222,mode=755",
               "children": [
                  {"target": "/dev/pts", "source": "devpts", "fstype": "devpts", "options": "rw,nosuid,noexec,relatime,gid=5,mode=620,ptmxmode=000"},
                  {"target": "/dev/shm", "source": "tmpfs", "fstype": "tmpfs", "options": "rw,nosuid,nodev"},
                  {"target": "/dev/hugepages", "source": "hugetlbfs", "fstype": "hugetlbfs", "options": "rw,relatime"},
                  {"target": "/dev/mqueue", "source": "mqueue", "fstype": "mqueue", "options": "rw,relatime"}
               ]
            },
            {"target": "/run", "source": "tmpfs", "fstype": "tmpfs", "options": "rw,nosuid,noexec,relatime,size=101596k,mode=755",
               "children": [
                  {"target": "/run/lock", "source": "tmpfs", "fstype": "tmpfs", "options": "rw,nosuid,nodev,noexec,relatime,size=5120k"},
                  {"target": "/run/user/1000", "source": "tmpfs", "fstype": "tmpfs", "options": "rw,nosuid,nodev,relatime,size=101596k,mode=700,uid=1000,gid=1000"}
               ]
            },
            {"target": "/var/lib/lxcfs", "source": "lxcfs", "fstype": "fuse.lxcfs", "options": "rw,nosuid,nodev,relatime,user_id=0,group_id=0,allow_other"},
            {"target": "/vagrant", "source": "vagrant", "fstype": "vboxsf", "options": "rw,nodev,relatime"},
         ]
      }
   ]
}
```

# See also

- [lsblk](lsblk)

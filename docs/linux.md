"Linux is a family of free and open-source software operating systems built around the Linux kernel." - <https://en.wikipedia.org/wiki/Linux>

Most linux distros are built on GNU tools, and this article is relevant in distinguishing the importance GNU plays in the linux ecosystem: <https://www.gnu.org/gnu/why-gnu-linux.en.html>

# Performance monitoring

- [Linux Load Averages: Solving the Mystery](http://www.brendangregg.com/blog/2017-08-08/linux-load-averages.html)
- [Brendan Gregg's Linux Performance page](http://www.brendangregg.com/linuxperf.html)
- [Notes from the Linux Performance Monitoring talk at Velocity 2015](linux-performance-monitoring)

# Tricks

## Configure a system to reboot on kernel panic

These lines should be added to `sysctl.conf`

```
# Reboot after 10 seconds if kernel panics
kernel.panic = 10  
# Treat all oopses as panics  
kernel.panic_on_oops = 1
```

## Force reboot on corrupt system

For times that commands like [reboot](reboot "wikilink") and [shutdown](shutdown "wikilink") are not available.

```
echo 1 > /proc/sys/kernel/sysrq
echo b > /proc/sysrq-trigger
```

# See also

- [lxc](lxc)

## Distros

- [rhel](rhel)
- [ubuntu](ubuntu)

## Init systems

- [systemd](systemd)
- [upstart](upstart)

## Filesystems

- Filesystem Heirarchy Standards: <http://www.pathname.com/fhs/pub/fhs-2.3.html>
- [LVM](lvm)
- [ZFS](zfs)

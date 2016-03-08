"systemd is a system and service manager for Linux, compatible with SysV and LSB init scripts. systemd provides aggressive parallelization capabilities, uses socket and D-Bus activation for starting services, offers on-demand starting of daemons, keeps track of processes using Linux control groups, supports snapshotting and restoring of the system state, maintains mount and automount points and implements an elaborate transactional dependency-based service control logic. It can work as a drop-in replacement for sysvinit." - <http://www.freedesktop.org/wiki/Software/systemd/>

- Tips and tricks - <http://www.freedesktop.org/wiki/Software/systemd/TipsAndTricks/>
- Man page for control groups - <http://man7.org/linux/man-pages/man5/systemd.cgroup.5.html>
- FAQ - <http://www.freedesktop.org/wiki/Software/systemd/FrequentlyAskedQuestions/>
- sysvinit to chkconfig - <https://fedoraproject.org/wiki/SysVinit_to_Systemd_Cheatsheet>
- systemd for upstart users - <https://wiki.ubuntu.com/SystemdForUpstartUsers>

# Tips

## Init file locations

```
/usr/lib/systemd/system
/etc/systemd/system # has precedence
```

## Show the full systemd journal

The systemd journal is syslog and more.

```
journalctl --full
```

## Show units

Units are things that are handled by systemd, including services.     systemctl list-units

## Show dependencies

This works on any .target or .service

```
systemctl list-dependencies network.service
```

## Enable a service

This behavior replaces chkconfig

```
systemctl enable docker.service
```

## Check the status of a service and show 20 lines

```
systemctl -n 20 status nodejs
```

## Per-user services

<https://wiki.archlinux.org/index.php/Systemd/User>

```
/usr/lib/systemd/user/ - where services provided by installed packages go.
/etc/systemd/user/ - where system-wide user services are placed by the system administrator.
~/.config/systemd/user/ - where the user puts its own services.
```

## Alter power / sleep / hibernate button behaviors

```
/etc/systemd/logind.conf
```

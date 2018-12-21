Title: chkconfig

chkconfig is a tool to interact with sys-v init scripts on centos/rhel hosts, and probably others.

# Examples

## List services and their runlevels

```
chkconfig --list
```

## Turn on mysql at runlevels 3 and 5

```
chkconfig --level 35 mysql on
```

# See Also

- update-rc.d - similar feature for ubuntu sysvinit

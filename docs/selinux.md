Title: selinux

[Security Enhanced Linux](http://en.wikipedia.org/wiki/Security-Enhanced_Linux)

# Notes

- Tutorial Video: <https://www.youtube.com/watch?v=MxjenQ31b70>
- CentOS HowTo: <http://wiki.centos.org/HowTos/SELinux>
- Labels are in user:role:type:level(optional)
- Logs go in /var/log/audit/audit.log and /var/log/messages
- Additional tools:

  - semanage and more are included in CentOS package `policycoreutils`
  - `setroubleshoot` has a bunch of tools included. Lots of prerequisites
  - `setroubleshoot-server` has a bunch of tools included. Lots of prerequisites

# Examples

## Show status of selinux

```
sestatus
getenforce
```

## Disable without rebooting

```
echo 0 >/selinux/enforce
```

or...

```
setenforce 0
```

## List selinux contexts for processes

```
ps auxZ
```

## List selinux contexts for processes that have open sockets

```
lsof -i -Z # See `man lsof` for more specific selinux syntaxes
```

## List selinux contexts for the current user

```
id -Z
```

## List selinux contexts for files

```
ls -lZ
```

## Recursively set a context type

```
chcon -R -t httpd_sys_content_t sole
```

## Copy the selinux context from another file or directory

```
chcon --reference /file/or/dir/to/reference /target/file
```

## Restore default contexts

This command restores the contexts as referenced in /etc/selinux/targeted/contexts/files/file_contexts

```
restorecon /path/to/broken/file
restorecon -vR /path/to/broken/dir
```

## Restore defaults context automatically at system reboot

This should take roughly the same amount of time as a fsck would.

```
touch /.autorelabel
```

## Define a default context for a directory

```
semanage fcontext -a /z5/sole
```

## Define a default context for a directory, using a reference from the original policy

```
semanage fcontext -a -e /var/www /z5/sole
cat /etc/selinux/targeted/contexts/files/file_contexts.subs # view the result
```

## List policies

```
semanage port -l
semanage user -l
```

## Show selinux booleans

```
getsebool -a
```

## Permanetnly set an selinux boolean

```
setsebool -P booleanname 1
```

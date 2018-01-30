"follow a pathname until a terminal point is found" - `man namei`

# Examples

## Simple usage

```
# namei /etc/systemd/system/multi-user.target.wants/ssh.service
f: /etc/systemd/system/multi-user.target.wants/ssh.service
 d /
 d etc
 d systemd
 d system
 d multi-user.target.wants
 l ssh.service -> /lib/systemd/system/ssh.service
   d /
   d lib
   d systemd
   d system
   - ssh.service
```

## Show permissions of all entries

```
# namei -l /etc/systemd/system/multi-user.target.wants/ssh.service
f: /etc/systemd/system/multi-user.target.wants/ssh.service
drwxr-xr-x root root /
drwxr-xr-x root root etc
drwxr-xr-x root root systemd
drwxr-xr-x root root system
drwxr-xr-x root root multi-user.target.wants
lrwxrwxrwx root root ssh.service -> /lib/systemd/system/ssh.service
drwxr-xr-x root root   /
drwxr-xr-x root root   lib
drwxr-xr-x root root   systemd
drwxr-xr-x root root   system
-rw-r--r-- root root   ssh.service
```

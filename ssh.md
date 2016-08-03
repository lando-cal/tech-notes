ssh is the secure shell, an encrypted version of telnet and a whole lot more

# ssh

The secure shell itself, very useful for administering remote systems, tunneling arbitrary ports, tunneling X sessions, and a whole lot more.

# scp

scp is like cp, but it happens securely and allows host-to-host transfers. Very handy when used with #ssh config|ssh config and #key-based authentication|key-based authentication.

# sftp

A secure FTP client built into ssh. The native client sucks, try lftp or rsync if it's available.

# sshd

## Output effective server configuration variables

`sshd -T # requires root`

# ssh

## Output effective client configuration variables

`ssh -G user@host`

# ssh config

The user ssh config file, `~/.ssh/config`, lets you override default options. This makes it handy for command line stuff where the syntax is funky such as using non-standard ports.

Notably, global vriables need to come at the _end_ of the file, not the beginning!

## Simple host aliasing

The following example will let you simply `ssh sugarbeast` to log in on the non-standard port on the proper IP# with the specified user.

```
Host sugarbeast
  HostName 66.134.66.42
  User daniel
  Port 888
```

## Multiplexed connections

After running `mkdir -p -m 700 ~/.ssh/sockets` add this to your ~/.ssh/config

```
Host *
  ControlPersist yes
  ControlMaster auto
  ControlPath ~/.ssh/sockets/%r@%h:%p
```

To kill a multiplexed connection, run `ssh -O exit user@host`

## ProxyCommand

This command lets you execute an arbitrary series of commands to connect with.

SSH proxy through ssh host for openSSH v4 and earlier (Ubuntu 8):

```
ProxyCommand ssh -q bastion nc -q 0 %h %p
```

SSH proxy through ssh host for openSSH v5 and later:

```
ProxyCommand ssh -W %h:%p bastion
```

HTTP proxy (from `man ssh_config`):

```
ProxyCommand nc -X connect -x 192.0.2.0:8080 %h %p
```

# key-based authentication

Key-based authentication lets you log in without specifying a password. This is useful for `rsync`, `scp` and just plain old `ssh` shell. Adding comments to the public key makes it easy to sort through the keys that authorized_keys file. The `.ssh/authorized_keys` file is the list of public keys which are allowed password-less login.

## Key-based auth Permissions

Permissions on this file need to be set like this:

```
#!/bin/sh
# This will repair permissions for the current user's ssh key-pair authentication.
mkdir ~/.ssh/
touch ~/.ssh/authorized_keys
chmod go-w ~          && \
chmod 700 ~/.ssh      && \
chmod 600 ~/.ssh/*    && \
echo "Successfully fixed ssh authentication files permissions."
```

## Generate Keys

```
ssh-keygen -b 4096 -t rsa -c "Daniel Hoherd <danielhoherd@sugarcrm.com>"
```

It's worth noting that key comments are not discussed for RSA2 keys (rsa keys for ssh2 protocol) anywhere in the man pages. The comment is considered anything after the whitespace following the key and does not need a # symbol.

# Limit root login to key based auth

```
In /etc/ssh/sshd_config: PermitRootLogin without-password
```

# Useful Syntax

## specify an alternate user to login with

```
ssh user@host
```

## tunnel local port to the destination through the SSH connection

This will only listen on localhost, not ethernet interfaces. Use -g to listen on all interfaces

```
ssh -L localport:destination:destinationport
```

## Tunnel from remote port through the local machine to destination

```
ssh -R remoteport:destination:destinationport
```

## Create a socks 5 proxy on a local port

```
ssh -D [PORT] user@host
```

## Loop through some ssh hosts and execute a command

-n is required in order to proceed past the first host.

```
cat hostnames.txt | while read -r X ; do ssh -o ConnectTimeout=10 -o PasswordAuthentication=no -n ${X} somecommand ; done ;
```

# See Also

- sshuttle - IP network router over ssh
- sslh - lets one accept both HTTPS and SSH connections on the same port. It makes it possible to connect to an SSH server on port 443 (e.g. from inside a corporate firewall)
- Corkscrew - a tool for tunneling SSH through HTTP proxies
- Putty - An SSH client for windows.
- [<http://www.hackinglinuxexposed.com/articles/20021226.html> Passwordless SSH logins]
- SSH server for Windows - <http://www.freesshd.com>

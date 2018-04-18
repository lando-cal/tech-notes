Title: saltstack

"Software to automate the management and configuration of any infrastructure or application at scale." - <http://github.com/saltstack/salt>

- <https://github.com/saltstack/salt>
- <https://docs.saltstack.com/en/latest/topics/tutorials>
- <https://docs.saltstack.com/en/latest/topics/development/index.html>

# Design characteristics

- Glossary: <https://docs.saltstack.com/en/latest/glossary.html>

## Common commands

All `salt*` commands require root access, so use sudo or log in as root.

- `salt`: Salt allows for commands to be executed across a swath of remote systems in parallel. This means that remote systems can be both controlled and queried with ease.
- `salt-call`: The salt-call  command is used to run module functions locally on a minion instead of executing them from the master. Salt-call is used to run a Standalone Minion, and was originally created for troubleshooting.
- `salt-cloud`: Salt Cloud is the system used to provision virtual machines on various public clouds via a cleanly controlled profile and mapping system.
- `salt-cp`: Salt copy copies a local file out to all of the Salt minions matched by the given target.
- `salt-key`: Salt-key executes simple management of Salt server public keys used for authentication.
- `salt-minion`: The Salt minion daemon, receives commands from a remote Salt master.
- `salt-run`: salt-run is the frontend command for executing Salt Runners.  Salt runners are simple modules used to execute convenience functions on the master.
- `salt-ssh`: Salt SSH allows for salt routines to be executed using only SSH for transport.

## State files

These are *desired* state files, not the view of the current state. These are where you describe how you want the system to be

## Grains

Facts about a system. Similar to facter in puppet land.

## Pillar

Hierarchical data to be interpolated into variables in state files. Similar to hiera in puppet land.

# Examples

## Configure output options

Unfortunately this only applies to the `salt` command, not `salt-run`, `salt-key`, etc..

```
$ cat ~/.saltrc
output: yaml
```

## View salt versions

For simple salt version:

```
salt --version
```

For more specific versions:

```
salt --versions
```

## Show all minions

### Show all responding minions

```
salt-run manage.up
```

### Show all minions, listed by hostst that are up and hosts that are down

```
salt-run manage.status
```

Example output:

```
down:
    - hadoop4.chn1.example
up:
    - appserver1.chn1.example
    - backups1.chn1.example
```

## Show any host that has had salt applied at some point

This shows only accepted keys. Without the `jq` part, rejected and denied keys would also show up in this list.

```
salt-key --out json | jq '.minions[]'
```

## Accept a key that has not yet been accepted

After finding the hostname in the Unaccepted list returned by `salt-key`:

```
salt-key -a hostname.example.com
```

## Show the version of an installed package on all hosts

```
salt '*' pkg.version bash
```

## Targeting hosts

- <https://docs.saltstack.com/en/latest/topics/targeting/#advanced-targeting-methods>

### Target using globs

```
salt '*dev*' pkg.install pre-commit
```

### Target using regular expressions

```
salt -b1 -E 'miner..-aws' cmd.run 'service miner restart'
```

### Target an IP subnet

```
salt -t 15 -S '172.21.5.0/24' cmd.run 'dpkg -l linux-image'
```

## Target a specific OS

<https://docs.saltstack.com/en/latest/topics/targeting/compound.html>

```
salt -C 'G@lsb_distrib_codename:trusty' pkg.install cmatrix
```

## Run a command on a subset of hosts

Check ntp stats on hadoop hosts.

```
salt "*hadoop*" cmd.run "ntpq -p"
```

Many more complicated examples of remote command execution: <https://docs.saltstack.com/en/latest/topics/execution/remote_execution.html>

## Show IP addresses

<https://docs.saltstack.com/en/latest/ref/modules/all/salt.modules.network.html>

```
salt '*itni*' network.ip_addrs
```

## Show available grains

This just lists the grain keys, not the values

```
salt '*minecraft*' grains.ls
```

## Show grain data for a subset of hosts

This lists the keys and values

```
salt '*dorks*' grains.items
```

## Show one grain for a subset of hosts

```
salt '*elk*' grains.fetch lsb_distrib_release
```

or...

```
salt '*elk*' grains.item os
```

## Look up grain data while logged into a minion

While logged into a minion, you can view what pillar data would be applied:

```
salt-call pillar.get users
```

## Append a username to the accounts grain and apply the users saltstate

```
salt '*searchstring*' grains.append accounts user-to-add
salt '*searchstring*' state.sls users
salt '*searchstring*' user.list_users --out yaml > list_users.yaml
```

Or as a function to run locally

```
add_user_via_salt_grains() {
  new_user=$1
  id "${new_user}" && return 0
  salt-call grains.append accounts "$new_user" && \
  salt-call state.sls users
  id "$new_user"
}
```

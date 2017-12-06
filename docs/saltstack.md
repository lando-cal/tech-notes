"Software to automate the management and configuration of any infrastructure or application at scale." - <http://github.com/saltstack/salt>

- <https://github.com/saltstack/salt>
- <https://docs.saltstack.com/en/latest/topics/tutorials>
- <https://docs.saltstack.com/en/latest/topics/development/index.html>

# Design characteristics

- Glossary: <https://docs.saltstack.com/en/latest/glossary.html>

## State files

These are *desired* state files, not the view of the current state. These are where you describe how you want the system to be

## Grains

Facts about a system. Similar to facter in puppet land.

## Pillar

Hierarchical data to be interpolated into variables in state files. Similar to hiera in puppet land.

# Examples

## View salt versions

For simple salt version:

```
salt --version
```

For more specific versions:

```
salt --versions
```

## Run a command on a subset of hosts

Check ntp stats on hadoop hosts.

```
salt "*hadoop*" cmd.run "ntpq -p"
```

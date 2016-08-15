# Puppet

- [Overview of Puppet's architecture](https://docs.puppet.com/puppet/4.4/reference/architecture.html)

## Examples

## Standalone mode

- `puppet apply /path/to/manifests` works, or you can specify a .pp file

### Show variables about the host that puppet knows (facts)

```
facter
```

### Show how puppet interacts with a resource

```
puppet describe cron
```

### Show available puppet types

```
puppet resource --types
```

### Show the puppet code that will create a resource

```
$ puppet resource file /etc/hosts
file { '/etc/hosts':
  ensure  => 'file',
  content => '{md5}9ffbd726fd5b15de760cc0150d607628',
  ctime   => 'Wed Apr 01 17:05:59 -0700 2015',
  group   => '0',
  mode    => '644',
  mtime   => 'Wed Apr 01 17:05:59 -0700 2015',
  owner   => '0',
  type    => 'file',
}
```

# Marionette Collective

"The Marionette Collective, also known as MCollective, is a framework for building server orchestration or parallel job-execution systems. Most users programmatically execute administrative tasks on clusters of servers." - <http://docs.puppetlabs.com/mcollective/>

- Cheatsheet: <https://coderwall.com/p/ig9mxa/mcollective-mco-cheat-sheet>
- Vagrant demo: <https://github.com/ripienaar/mcollective-vagrant>
- [Overview of MCollective Components and Configuration](https://docs.puppet.com/mcollective/overview_components.html)

## mco

### Find a random node in the cluster

```
mco find -1
```

### Ping all nodes in the puppet cluster

```
mco ping
```

### Show if a file exists on each host in the cluster

```
mco filemgr -f /srv/nginx status
```

### Use fstat and md5 to detect files needing repair

```
mco find -S "fstat('/srv/somedir/somefile').md5=/af6db18c6dfa81c294895003e13a2eef/" > files_needing_attention.txt
pssh -h files_needing_attention.txt) 'do_something_to_the_file'
```

### Show stats about which OSes you have

```
mco facts lsbdistdescription
```

### Show a list of configured IP addresses in a certain range

```
mco facts all_ipaddresses -F 'all_ipaddresses=~10.56'
```

### Show a report about uptimes over a year

```
mco facts uptime -F 'uptime_days>365' \
| awk '$2 == "days" {print}' \
| sort -n -k1 \
| column -t
```

### Find machines that have a certain fact

```
mco find --with-fact lsbdistcodename=lucid
```

### Show a fact on machines that have a specific fact

```
mco facts role --with-fact lsbdistcodename=lucid -v
```

### Show detailed info about a node

```
mco inventory fqdn.example.com
```

### Find nodes with certain facts

```
mco find --with-fact lsbdistdescription="Ubuntu 10.04.1 LTS"
```

### Find nodes that match a config management class

```
mco find -C role::awsadmin
```

### Show the classes for a given host

```
sort /var/lib/puppet/state/classes.txt
```

### Show the status and puppet policy about a package on all hosts

```
mco rpc package status package=openssh-client --discovery-timeout 60 --json
```

### Upgrade an installed package on 10 random web hosts

This upgrades, but does not install if the package is not already present.

```
mco package upgrade 'nginx' -I '/web/' --limit=10
```

### Show breakdown of hosts by OS version by role

```
mco facts -v --wc role::mon lsbdistdescription
```

## Use mco to find packages of a certain version on a certain OS

```
mco rpc package status package=apt -j -F lsbdistcodename=trusty > cache.json
jq -c '.[] | select(.data.ensure == "1.0.1ubuntu2") | { version: .data.ensure, hostname: .sender }' cache.json
```

# Hiera

"Hiera is a key/value lookup tool for configuration data, built to make Puppet better and let you set node-specific data without repeating yourself." - <http://docs.puppetlabs.com/hiera/latest/>

- <https://github.com/puppetlabs/hiera>
- <http://www.craigdunn.org/2011/10/puppet-configuration-variables-and-hiera/>

# Tests

- <http://rspec-puppet.com/matchers/>

# Videos and links

- [Puppet Documentation Index](https://docs.puppetlabs.com/puppet/)
- [Introduction to Puppet](https://docs.puppetlabs.com/guides/introduction.html)
- [Function Reference](https://docs.puppetlabs.com/references/latest/function.html)
- [stdlib](https://forge.puppet.com/puppetlabs/stdlib) is another good function reference.
- [Language: Basics](https://docs.puppetlabs.com/puppet/latest/reference/lang_summary.html)
- [Style Guide](https://docs.puppetlabs.com/guides/style_guide.html)
- [Vagrant Docs - Puppet Apply Provisioner](https://docs.vagrantup.com/v2/provisioning/puppet_apply.html)
- [Downloads](https://puppetlabs.com/misc/download-options-get)
- [PuppetConf 2015](https://www.youtube.com/playlist?list=PLV86BgbREluUDlJW_jAqnWPj0THx7eXBA)
- [Designing Puppet: Roles/Profiles Pattern](https://www.youtube.com/watch?v=ZpHtOnlSGNY) - based on the blog post [Designing Puppet – Roles and Profiles](http://www.craigdunn.org/2012/05/239/)
- [Building a Functional Puppet Workflow Part 2: Roles and Profiles](http://garylarizza.com/blog/2014/02/17/puppet-workflow-part-2/)
- [Configuration Management as Legos](http://sysadvent.blogspot.com/2012/12/day-13-configuration-management-as-legos.html)

# Puppet

"Puppet is an open-source configuration management tool. It runs on many Unix-like systems as well as on Microsoft Windows, and includes its own declarative language to describe system configuration." - <https://en.wikipedia.org/wiki/Puppet_(software)>

## Videos and links

- [Overview of Puppet's architecture](https://docs.puppet.com/puppet/4.4/reference/architecture.html)
- [Puppet Documentation Index](https://docs.puppetlabs.com/puppet/)
- [Introduction to Puppet](https://docs.puppetlabs.com/guides/introduction.html)
- [Function Reference](https://docs.puppetlabs.com/references/latest/function.html)
- [stdlib](https://forge.puppet.com/puppetlabs/stdlib) is another good function reference.
- [Language: Basics](https://docs.puppetlabs.com/puppet/latest/reference/lang_summary.html)
- [Include-like vs. resource-like class instantiation](https://docs.puppet.com/puppet/4.6/reference/lang_classes.html#include-like-vs-resource-like)
- [Style Guide](https://docs.puppetlabs.com/guides/style_guide.html)
- [Vagrant Docs - Puppet Apply Provisioner](https://docs.vagrantup.com/v2/provisioning/puppet_apply.html)
- [Downloads](https://puppetlabs.com/misc/download-options-get)
- [PuppetConf 2015](https://www.youtube.com/playlist?list=PLV86BgbREluUDlJW_jAqnWPj0THx7eXBA)
- [Designing Puppet: Roles/Profiles Pattern](https://www.youtube.com/watch?v=ZpHtOnlSGNY) - based on the blog post [Designing Puppet – Roles and Profiles](http://www.craigdunn.org/2012/05/239/)
- [Building a Functional Puppet Workflow Part 2: Roles and Profiles](http://garylarizza.com/blog/2014/02/17/puppet-workflow-part-2/)
- [Configuration Management as Legos](http://sysadvent.blogspot.com/2012/12/day-13-configuration-management-as-legos.html)

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

## Tests

- <http://rspec-puppet.com/matchers/>

# Marionette Collective

"The Marionette Collective, also known as MCollective, is a framework for building server orchestration or parallel job-execution systems. Most users programmatically execute administrative tasks on clusters of servers." - <http://docs.puppetlabs.com/mcollective/>

- [Overview of MCollective Components and Configuration](https://docs.puppet.com/mcollective/overview_components.html)
- [Invoking MCollective actions](https://docs.puppet.com/pe/latest/mco_invoke_cli.html)
- Cheatsheet: <https://coderwall.com/p/ig9mxa/mcollective-mco-cheat-sheet>
- Vagrant demo: <https://github.com/ripienaar/mcollective-vagrant>

## mco

### Show some puppet cluster stats

```
mco puppet summary
mco puppet count
mco puppet status
```

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

### Use fstat to find hosts where a directory has not been modified recently

```
mco find -S "fstat('/srv').mtime_seconds<$(date +%s -d '-8 hours')"
```

### Show stats about which OSes you have

```
mco facts lsbdistdescription
```

### Show all ip addreses on all hosts where a configured IP address matches a regex

```
mco facts all_ipaddresses -F 'all_ipaddresses=~10\.(56|29)\.'
```

### Show a report about uptimes over a year

```
mco facts uptime -F 'uptime_days>365' |
awk '$2 == "days" {print}' |
sort -n -k1 |
column -t
```

### Find ec2 hosts with low uptime

```
mco find -W 'is_ec2=true uptime_seconds<7200'
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

### Kick off a puppet run on all hosts of a certain class

The following two syntaxes are essentially the same, using the same `puppet` agent of `mco`. The only differences are the use of `runall` vs `runonce`, and the method that performs parallel execution. I'm not sure what difference there is in the code path.

```
mco rpc    -C "class_boolean" -F "fact_name=fact_value" --batch 10 --agent puppet --action runonce
mco puppet -C "class_boolean" -F "fact_name=fact_value" runall 10
```

### Show the status and puppet policy about a package on all hosts

```
mco rpc package status package=openssh-client --discovery-timeout 60 --json
```

### Upgrade an installed package on 10 random web hosts

This upgrades, but does not install if the package is not already present.

```
mco package update 'nginx' -I '/web/' --limit=10
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

# r10k

The suggested workflow for puppet is to use r10k on a control repo to manage the modules on your puppetmaster and the environments it provides. The general idea is that each module is represented by a puppetforge module name or a git repo listed inside of the ambiguously named `Puppetfile`. When `r10k puppetfile install -v` is run, all modules listed in this file are installed according to their definitions, and all modules that are not in this file are purged. Also, r10k will set up environments based on the git branches of the control repo. This workflow is described in detail at [Managing and deploying Puppet code](https://docs.puppet.com/pe/latest/cmgmt_managing_code.html). It assumes you are not using a `puppet apply` type setup, which makes this difficult to follow for people who are playing with this at home in a non-puppetmaster scenario, such as in vagrant or on raspberry pi's.

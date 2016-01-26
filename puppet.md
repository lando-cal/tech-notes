- [Puppet Documentation Index](https://docs.puppetlabs.com/puppet/)
- [Introduction to Puppet](https://docs.puppetlabs.com/guides/introduction.html)
- [Function Reference](https://docs.puppetlabs.com/references/latest/function.html)
- [Language: Basics](https://docs.puppetlabs.com/puppet/latest/reference/lang_summary.html)
- [Vagrant Docs - Puppet Apply Provisioner](https://docs.vagrantup.com/v2/provisioning/puppet_apply.html)
- [Downloads](https://puppetlabs.com/misc/download-options-get)

# Puppet
## Examples
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
"The Marionette Collective, also known as MCollective, is a framework for building server orchestration or parallel job-execution systems. Most users programmatically execute administrative tasks on clusters of servers."
- [http://docs.puppetlabs.com/mcollective/](http://docs.puppetlabs.com/mcollective/)

## mco
### Find a random node in the cluster

```
mco find -1
```

### Ping all nodes in the puppet cluster

```
mco ping
```

### Show stats about which OSes you have

```
mco facts lsbdistdescription
```

### Find all machines that have a fact

```
mco facts role --with-fact lsbdistcodename=lucid
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

# Hiera
"Hiera is a key/value lookup tool for configuration data, built to make Puppet better and let you set node-specific data without repeating yourself."
- [http://docs.puppetlabs.com/hiera/latest/](http://docs.puppetlabs.com/hiera/latest/)

# Tests
- [http://rspec-puppet.com/matchers/](http://rspec-puppet.com/matchers/)

# Videos and links
- [PuppetConf 2015](https://www.youtube.com/playlist?list=PLV86BgbREluUDlJW_jAqnWPj0THx7eXBA)
- [Designing Puppet: Roles/Profiles Pattern](https://www.youtube.com/watch?v=ZpHtOnlSGNY) - based on the blog post [Designing Puppet – Roles and Profiles](http://www.craigdunn.org/2012/05/239/)

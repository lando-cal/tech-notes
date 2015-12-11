- [Puppet Documentation Index](https://docs.puppetlabs.com/puppet/)
- [Introduction to Puppet](https://docs.puppetlabs.com/guides/introduction.html)
- [Function Reference](https://docs.puppetlabs.com/references/latest/function.html)
- [Language: Basics](https://docs.puppetlabs.com/puppet/latest/reference/lang_summary.html)
- [Vagrant Docs - Puppet Apply Provisioner](https://docs.vagrantup.com/v2/provisioning/puppet_apply.html)

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

### Show detailed info about a node

```
mco inventory fqdn.example.com
```

# Hiera
"Hiera is a key/value lookup tool for configuration data, built to make Puppet better and let you set node-specific data without repeating yourself."
- [http://docs.puppetlabs.com/hiera/latest/](http://docs.puppetlabs.com/hiera/latest/)

# Videos
- [PuppetConf 2015](https://www.youtube.com/playlist?list=PLV86BgbREluUDlJW_jAqnWPj0THx7eXBA)
- [Designing Puppet: Roles/Profiles Pattern](https://www.youtube.com/watch?v=ZpHtOnlSGNY) - based on the blog post [Designing Puppet – Roles and Profiles](http://www.craigdunn.org/2012/05/239/)

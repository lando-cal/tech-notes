# vagrant

"Vagrant is a tool for building and managing virtual machine environments in a single workflow." - <https://www.vagrantup.com/intro/index.html>

# Links

- <https://www.vagrantup.com>
- [https://docs.vagrantup.com/v2](http://docs.vagrantup.com/v2)
- <https://atlas.hashicorp.com>
- Examples: <https://github.com/patrickdlee/vagrant-examples>

# OS X Shell tweaks

```
brew tap homebrew/completions
brew install vagrant-completion
```

Then in .bash_profile:

```
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
```

# Plugins

```
vagrant plugin install vagrant-vbguest
vagrant plugin install vagrant-hosts
```

# Usage Examples

## List which boxes you have stored locally

```
vagrant box List
```

## Remove an old version of a vagrant box

```
vagrant box remove ubuntu/trusty64 --box-version 20151201.0.0
```

## Script box updates

This may fail in some circumstances, I haven't tested it exhaustively.

```
vagrant box outdated --machine-readable --global |
  awk -F, '$4 == "warn" {print $5; exit 1}' |
  awk -F"'" '{print $2}' |
  xargs -n1 vagrant box update --box
```

## Show status of all running Vagrant boxes, not just the one in the CWD

```
vagrant global-status
```

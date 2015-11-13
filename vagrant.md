- Vagrantfile syntax is ruby
- [https://www.vagrantup.com](https://www.vagrantup.com)
- [https://docs.vagrantup.com/v2](http://docs.vagrantup.com/v2)
- [https://atlas.hashicorp.com](https://atlas.hashicorp.com)
- Examples: [https://github.com/patrickdlee/vagrant-examples](https://github.com/patrickdlee/vagrant-examples)

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

- https://www.vagrantup.com
- http://docs.vagrantup.com/v2
- Vagrantfile syntax is ruby
- https://atlas.hashicorp.com

# Shell tweaks

    brew tap homebrew/completions
    brew install vagrant-completion

Then in .bash_profile:

    if [ -f $(brew --prefix)/etc/bash_completion ]; then
      . $(brew --prefix)/etc/bash_completion
    fi

# Plugins
    vagrant plugin install vagrant-vbguest
    vagrant plugin install vagrant-hosts

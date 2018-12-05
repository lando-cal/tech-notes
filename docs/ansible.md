Title: Ansible

- <https://docs.ansible.com/intro_inventory.html>
- <https://docs.ansible.com/playbooks_best_practices.html>
- <https://galaxy.ansible.com>
- <http://www.azavea.com/blogs/labs/2014/10/creating-ansible-roles-from-scratch-part-1>
- <http://ryandlane.com/blog/2014/08/04/moving-away-from-puppet-saltstack-or-ansible/>
- <http://docs.ansible.com/ansible/latest/user_guide/intro_patterns.html> - Targeting hosts
- <http://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html#variable-precedence-where-should-i-put-a-variable>

# Modules

- <http://docs.ansible.com/ansible/latest/list_of_all_modules.html>
- <http://docs.ansible.com/ansible/latest/modules/apt_module.html>
- <http://docs.ansible.com/ansible/latest/modules/apt_repository_module.html>
- <http://docs.ansible.com/ansible/latest/modules/sysctl_module.html>
- <http://docs.ansible.com/ansible/latest/modules/user_module.html>

# Examples

## Show a list of installed modules

```
ansible-doc --list
```

## Run a playbook and prompt for sudo password

```
ansible-playbook --ask-become-pass -i inventory/hosts.yaml create_users.yaml
```

## Run an ad-hoc command

You can run one-off [ad-hoc commands](https://docs.ansible.com/ansible/2.6/user_guide/intro_adhoc.html) by passing a module and args to the module.

```
ansible localhost \
  -m get_url \
  -a "mode=755
    url=https://github.com/bcicen/ctop/releases/download/v0.7.1/ctop-0.7.1-linux-amd64
    dest=/usr/local/bin/ctop
    checksum=sha256:38cfd92618ba2d92e0e1262c0c43d7690074b4b8dc77844b654f8e565166b577
    owner=root
    group=root"
```

## Validate and inspect your inventory file

This command parses your inventory and group_vars and outputs a json data structure if no syntax faults are found.

```
ansible-inventory -i inventory/hosts.yml --list
```

## Use arbitrary groups in static inventory file

```
$ nl -w 2 -s ' ' -ba inventory/example.yml
 1 all:
 2   hosts:
 3     client:
 4       ansible_host: 192.168.1.2
 5     server:
 6       ansible_host: 192.168.2.3
 7
 8 linux:
 9   hosts:
10     server:
11
12 windows:
13   hosts:
14     client:
15
16 california:
17   hosts:
18     client:
19     server:
$ ansible-inventory -i inventory/example.yml --graph
@all:
  |--@california:
  |  |--client
  |  |--server
  |--@linux:
  |  |--server
  |--@windows:
  |  |--client
```

## Show all resolved variables for a given inventory host

This will show all host vars, including variables resolved from [all the different variable locations](http://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html#variable-precedence-where-should-i-put-a-variable).

```
ansible -i inventory target_hostname -m debug -a "var=hostvars[inventory_hostname]"
```

## Generate an idempotent random number

This is similar to the Puppet `fqdn_rand()` function, which is really useful in cron jobs

```
---
# defaults/main.yml

demo_cron_minute: "{{ 59 | random(seed=inventory_hostname) }}"
demo_cron_hour: "{{ 23 | random(seed=inventory_hostname) }}"
```

See also: <https://docs.ansible.com/ansible/latest/user_guide/playbooks_filters.html#random-number-filter>

## Simple ansible playbook

This may be useful for testing syntax and experimenting with ansible modules.

```
---
# playbook.yml

- name: A local play
  hosts: localhost
  connection: local
  gather_facts: no
  tasks:
    - name: Run date
      shell: /bin/date
      register: date_out

    - debug:
        var: date_out.stdout
```

`ansible-playbook -i localhost playbook.yml`

# Links

- Ansible Tests with Molecule - <https://molecule.readthedocs.io/en/latest/> / <https://www.digitalocean.com/community/tutorials/how-to-test-ansible-roles-with-molecule>

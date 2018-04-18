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

## Validate and inspect your inventory file

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

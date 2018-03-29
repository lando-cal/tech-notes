# Ansible

- <https://docs.ansible.com/playbooks_best_practices.html>
- <https://docs.ansible.com/intro_inventory.html>
- <http://docs.ansible.com/ansible/latest/list_of_all_modules.html>
- <https://galaxy.ansible.com>
- <http://www.azavea.com/blogs/labs/2014/10/creating-ansible-roles-from-scratch-part-1>
- <http://ryandlane.com/blog/2014/08/04/moving-away-from-puppet-saltstack-or-ansible/>
- <http://docs.ansible.com/ansible/latest/user_guide/intro_patterns.html> - Targeting hosts

# Examples

## Run a playbook and prompt for sudo password

```
ansible-playbook --ask-become-pass -i inventory/hosts.yaml create_users.yaml
```

## Validate and inspect your inventory file

```
ansible-inventory -i inventory/hosts.yml --list
```

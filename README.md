# ansible-poc-scripts
Code repository for Ansible scripts during POC phase


### General Commands

```
ansible-playbook -i inventory web.yml --check
ansible-playbook -i inventory web.yml
ansible-playbook -i inventory web.yml --diff
ansible ansible01 -m setup -a filter=*ipv4*
ansible ansible01 -m setup -a filter=*hostname*
curl -iL 172.31.36.29
ansible ansible01 -m setup
ansible -i inventory -b -m yum -a "name=httpd state=absent"
```
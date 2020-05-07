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

### Docker controlnode, ansible user configuration & running ad-hoc commands
```
docker run --rm -it --volume "$(pwd)":/ansible --workdir /ansible --name controlnode centos:ansible
cp keypair-ansible.pem /home/ansible/
su - ansible
exec ssh-agent bash
ssh-add keypair
ansible ansible01 -m ping -u ec-user
ansible ansible01 -m setup -u ec2-user
ansible ansible01 -b -m yum -a "name=httpd state=present" -u ec2-user
ansible ansible01 -b -m yum -a "name=httpd state=absent" -u ec2-user
```
### Docker container with AWS credentials
```
docker run --rm -it --name ansiblecontrol --env "AWS_ACCESS_KEY_ID=aws_access_key" --env "AWS_SECRET_ACCESS_KEY=aws_secret_access_key" centos:ansible
```
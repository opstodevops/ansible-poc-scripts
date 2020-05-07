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

### Encrypting a file in Ansible
```
[root@d386e7ddd96f /]# cat keys.yml 
AWS_ACCESS_KEY_ID: AWS_ACCESS_KEY
AWS_SECRET_ACCESS_KEY: aws_secret_access_key
AWS_REGION us-east-1
[root@d386e7ddd96f /]# ansible-vault encrypt keys.yml 
New Vault password: 
Confirm New Vault password: 
Encryption successful
[root@d386e7ddd96f /]# cat keys.yml 
$ANSIBLE_VAULT;1.1;AES256
64656439633835346261633566623562636362383435653662666361666235633363363764376638
3936383239376434306461636430323465306661336664650a313666656266343038613135653665
63333561613432623265326138636533396230306532636531333736613538613438616338666435
6138663662303937630a383634333334316364353565363730366338663236636535333636656534
34646532313532663938663863333939316562356232613465333236366162386533346366353162
62616666393763353938333764366566633230303262366265396134663135666434396234343034
33383062613532653638376631636565336666343863393961396634346334306462646434336533
37343365333763646432393839363739383066346433663633316262316136396262656434666634
36666264343064393833363630613761636662663834346265353232313838343131303939356462
6236333631656665383130613137323163663165383864313232
[root@d386e7ddd96f /]# ansible-playbook --ask-vault-pass <playbook.yml>
```
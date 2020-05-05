FROM centos:centos7.7.1908

RUN yum check-update; \
    yum install -y gcc libffi-devel python-devel openssl-devel epel-release; \
    yum install -y python-pip python-wheel; \
    yum install -y openssh-server openssh-clients; \
    yum install -y sshpass; \
    yum install -y ansible; \
    yum install -y python-boto python-boto3; \
    yum install -y awscli

RUN eval useradd ansible; \
    echo "passwordforansibleuser" | passwd --stdin ansible; \
    usermod -aG wheel ansible
    
    
    

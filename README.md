
# MediaWikiDeployment_TW
This repository contains the Media Wiki setup with Asible as the Config Manager and the MediaWiki deployed on Minikube.
CI and CD automation is done via Jenkins

> Below is the design via which the code is deployed on Minikube

![MediaWiki Deployment Design](https://github.com/venkymullapudi/MediaWikiDeployment_TW/blob/master/Media_Wiki_Deployment.jpg?raw=true "Media Wiki Deployment")

### The shortest path

 1. Create five "CentOS 7" VMs 
 2. Edit the MediaWiki_CM_CI_CD.var to update the hostnames of the 5 VMs
 3. Run the script MediaWiki_CM_CI_CD.sh

### The Long Journey
**Initial Setup of Ansible**

**Prerequisites** 
- I have used VirtualBox with CentOS 7 VMs for Ansible, Kubernetes, Jenkins, DockerRegistry and Nginx Plus

**Setup** 
- Setup the Ansible host using the below commands

> sudo yum install -y epel-release ansible 
> ansible --version 
> sudo vi /etc/ansible/hosts 
> ssh-keygen 
> ssh-copy-id venky@<HOSTNAME> 
> ansible -m ping all

```
$ ssh venky@ansible.venky.corp
venky@ansible.venky.corp's password:
Last login: Tue Aug 13 07:45:52 2019 from 192.168.56.1
[venky@ansible ~]$

[venky@ansible ~]$ sudo yum install -y epel-release

[venky@ansible ~]$ sudo yum install -y ansible

[venky@ansible ~]$ ansible --version
ansible 2.8.2
  config file = /etc/ansible/ansible.cfg
  configured module search path = [u'/home/venky/.ansible/plugins/modules', u'/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python2.7/site-packages/ansible
  executable location = /usr/bin/ansible
  python version = 2.7.5 (default, Oct 30 2018, 23:45:53) [GCC 4.8.5 20150623 (Red Hat 4.8.5-36)]
  

[venky@ansible ~]$ sudo vi /etc/ansible/hosts
jenkins.venky.corp
dockerregistry.venky.corp
consul.venky.corp
nginxplus.venky.corp
kubernetes.venky.corp

[venky@ansible ~]$ ssh-keygen

[venky@ansible ~]$ ssh-copy-id venky@<HOSTNAME>
```

- Finally test it using the below command
```
[venky@ansible ~]$ ansible -m ping all
ansible.venky.corp | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": false,
    "ping": "pong"
}
nginxplus.venky.corp | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": false,
    "ping": "pong"
}
jenkins.venky.corp | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": false,
    "ping": "pong"
}
dockerregistry.venky.corp | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": false,
    "ping": "pong"
}
consul.venky.corp | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": false,
    "ping": "pong"
}
kubernetes.venky.corp | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": false,
    "ping": "pong"
}
```
You are now ready to Provision the VMs with the respective tools using Ansible as the configuration Management tool. 

The playbooks are added to CM directory in this repository.

> *Next step... Go to CM folder and go to each folder, and follow the instructions*


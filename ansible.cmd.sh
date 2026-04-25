# check ansible connnexion to multiple host ( - i is used for the inventory, -m is used for module)
ansible -i,ubuntu1,ubuntu2,ubuntu3,ubuntu3,centos1,centos2,centos3 all -m ping
ansible all -m ping -o

ANSIBLE_HOST_KEY_CHECKING=False ansible all -m ping # ping and disable ssh key checking

ansible group_name --list-hosts # list all host of a group
ansible all -m command -a 'id' -o # list host remote user

ansible '*' -m ping -o # ping all hosts
ansible all --list-hosts # list all host
ansible linux -m ping -e 'ansible_port=22' -o # -e use to set a config in commandline


:'
Ansible configuration - Configuration Options and Precedence
Ansible inventories - Host & Group varibales, Group Ranges Privileged Connectivity
Ansible module - Common modules, Interactivity with the CLI
'

ansible centos1 -m setup | more # give you information about ansible module given inventory
ansible all -m file -a 'path=/tmp/test state=touch' # create file to hosts
ansible all -m copy -a 'src=/tmp/x dest=/tmp/x' # copy file to hosts
ansible all -m copy -a 'remote_src=yes src=/tmp/x dest=/tmp/y' # copy file to remote hosts
ansible all -a 'hostname' -o # command module to get host of inventories

ansible-doc module_name # to get documentation of an ansible module in local

ansible centos1 -m setup -a 'filter=ansible_me*' # filter information to get from a host

:'
ansible facts are data related to your remote systems, including operatiing systems, IP adresses \
attached filesystems and mores.
Ansible idiom (ansible_facts): any module returning a dictionnary of "ansible_facts" is added to the root of the facts namespace
Its is possible to create custom ansible fact

example of facts file content in file.fact
#!/bin/bash
echo {\""date\"" : \""`date`\""}
'

# after creating fact file do this to be considerate
sudo mkdir -p /etc/ansible/facts.d
sudo cp file.fact /etc/ansible/facts.d/

# that's all, now you can filter while getting info like this
ansible ubuntu-c -m setup -a 'filter=ansible_local'

ansible-playbook facts_playbook.yaml -l ubuntu-c # run playbook and get only output concern a limited host, here ubuntu-c. 

:'
 facts_playbook.yaml content is:
# YAML documents begin with the document separator ---

# The minus in YAML this indicates a list item.  The playbook contains a list
# of plays, with each play being a dictionary
-

  # Hosts: where our play will run and options it will run with
  hosts: all

  # Tasks: the list of tasks that will be executed within the play, this section
  # can also be used for pre and post tasks
  tasks:
    - name: Show IP Address
      debug:
        msg: "{{ ansible_default_ipv4.address }}"

    - name: Show Custom Fact 1
      debug:
        msg: "{{ ansible_local.getdate1.date }}"

    - name: Show Custom Fact 2
      debug:
        msg: "{{ ansible_local.getdate2.date.date }}"

# Three dots indicate the end of a YAML document
...
'

ansible linux -m file -a "path=/etc/ansible/facts/getdate1.fact state=absent" # remove a file from linux group hosts

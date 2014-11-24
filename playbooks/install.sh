#!/bin/bash
for i in $(cat inventory); do ssh -t root@$i rm ~/.ssh/authorized_keys; ssh-keygen -t rsa; cat ~/.ssh/id_rsa.pub >> ssh -t root@$i ~/.ssh/authorized_keys; done
ansible servers -m copy src=~/.ssh/authorized_keys dest=~/.ssh/authorized_keys;
ansible-playbook ansible-openmpi.yml;

#!/usr/bin/env bash

# install ansible (http://docs.ansible.com/intro_installation.html)
apt-get -y install software-properties-common
apt-add-repository -y ppa:ansible/ansible
apt-get update
apt-get -y install ansible


rm /etc/ansible/ansible.cfg
ln -s /vagrant/ansible/ansible.cfg /etc/ansible/ansible.cfg

ssh-keyscan bl www1 www2 >> .ssh/known_hosts



ssh-keygen -t rsa -b 2048 -N "" -f /home/vagrant/.ssh/id_rsa

ansible-playbook /vagrant/ansible/ssh-addkey.yml 

ansible-playbook /vagrant/ansible/web.yml 

ansible-playbook /vagrant/ansible/push.yml 

# copy examples into /home/vagrant (from inside the mgmt node)
#cp -a /vagrant/examples/* /home/vagrant
#chown -R vagrant:vagrant /home/vagrant



cat >> /etc/hosts <<EOL

# vagrant environment nodes
192.168.2.6  mgr
192.168.2.5  bl
192.168.2.3  www1
192.168.2.4  www2

ansible_connection=ssh 
ansible_ssh_user=vagrant 
ansible_ssh_pass=vagrant

EOL
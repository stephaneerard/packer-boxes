#!/bin/bash -eux

# Add vagrant user to sudoers.
echo "vagrant        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers
sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers

echo "Instaling Vagrant insecure private key start"

mkdir ~/.ssh
chmod 700 ~/.ssh
cd ~/.ssh
wget --no-check-certificate 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -O authorized_keys
chmod 600 ~/.ssh/authorized_keys
chown -R vagrant ~/.ssh

echo "Instaling apt-proxy apt-cacher-ng"
echo "Acquire::http::Proxy \"http://192.168.54.4:3142\";" | sudo tee /etc/apt/apt.conf.d/01proxy
echo "Acquire::https::Proxy \"none\";" | sudo tee -a /etc/apt/apt.conf.d/01proxy

#echo "Installing linux headers & vb guest utils"
sudo apt-get install -y virtualbox-guest-utils linux-headers-$(uname -r)
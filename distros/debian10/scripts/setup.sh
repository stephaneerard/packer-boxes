#!/bin/bash -eux

# Add vagrant user to sudoers.
echo "vagrant        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers
sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers

mkdir -p /home/vagrant/.ssh
wget --no-check-certificate https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub -O /home/vagrant/.ssh/authorized_keys
chmod 0700 /home/vagrant/.ssh
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh

sudo apt-get remove --purge cryptsetup-initramfs
sudo apt-get -y install linux-headers-$(uname -r) build-essential dkms nfs-common
sudo mkdir -p /mnt/cdrom
sudo mount -o loop /home/vagrant/VBoxGuestAdditions.iso /mnt/cdrom

(sudo /mnt/cdrom/VBoxLinuxAdditions.run) || true
#!/bin/bash -eux

# Uninstall Ansible and remove PPA.
sudo apt-get -y autoremove
rm -f /home/vagrant/*.sh
(dd if=/dev/zero of=/EMPTY bs=10M) || true
rm -f /EMPTY
sync

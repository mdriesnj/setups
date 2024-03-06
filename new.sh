#!/bin/sh
apt update
apt upgrade -y
apt install curl sudo -y
adduser mdries
usermod -aG sudo mdries
mkdir /home/mdries/.ssh/
cp /root/.ssh/authorized_keys /home/mdries/.ssh/
chown -R mdries:mdries /home/mdries/.ssh
cd /var/lib/dpkg/info/ && apt install --reinstall $(grep -l 'setcap' * | sed -e 's/\.[^.]*$//g' | sort --unique)
systemctl mask systemd-logind
pam-auth-update
reboot now

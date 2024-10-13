#!/bin/bash
set -o xtrace

#
# Add User onebuck
#
adduser homesrv
usermod -aG sudo homesrv

#
# Install Fail2Ban, Net-Tools & iSCSI
#
apt update -y

apt install -y fail2ban
cp /etc/fail2ban/jail.{conf,local}
sed -i 's/backend = auto/backend = systemd/' /etc/fail2ban/jail.local
systemctl enable fail2ban.service --now
systemctl restart fail2ban.service
systemctl status fail2ban.service
sleep 2
fail2ban-client status sshd

apt install -y net-tools
apt install -y iftop
apt install -y open-iscsi
apt install -y apache2-utils
apt install -y curl

systemctl enable --now iscsid

sleep 2
reboot

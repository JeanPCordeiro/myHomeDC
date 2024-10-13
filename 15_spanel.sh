#!/bin/bash
set -o xtrace

apt install -y nodejs npm lm-sensors
git clone https://github.com/tjaworski/AceMagic-S1-LED-TFT-Linux.git acemagic
cd acemagic/s1panel
./install
cp /root/myHomeDC/config.json .
mkdir themes/pve_panel
cp /root/myHomeDC/pve_panel.json themes/pve_panel/.
sleep 2
systemctl enable --now s1panel
systemctl status s1panel
git rm -f --cached acemagic

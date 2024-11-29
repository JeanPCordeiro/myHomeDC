#!/bin/bash
set -o xtrace

#
# to add a node
#

export MASTER_IP=10.0.0.1
export K3S_TOKEN=HomeDCK3sToken

NODE_EXTERNAL_IP=192.168.1.202
NODE_INTERNAL_IP=10.0.0.2
INTERNAL_INTERFACE=enp3s0

#

curl -sfL https://get.k3s.io | INSTALL_K3S_CHANNEL=latest K3S_TOKEN="${K3S_TOKEN}" sh -s server \
--server https://${MASTER_IP}:6443 \
--node-external-ip=${NODE_EXTERNAL_IP}  \
--node-ip=${NODE_INTERNAL_IP} \
--advertise-address=${NODE_INTERNAL_IP} \
--flannel-iface=${INTERNAL_INTERFACE}

sleep 5
kubectl get nodes -o wide


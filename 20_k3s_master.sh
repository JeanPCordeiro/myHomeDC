#!/bin/bash
set -o xtrace

export INTERNAL_INTERFACE=enp4s0
export NODE_EXTERNAL_IP=192.168.68.201
export NODE_INTERNAL_IP=10.0.0.1

#
# Install K3S
#

curl -sfL https://get.k3s.io | INSTALL_K3S_VERSION=v1.31.1+k3s1 K3S_TOKEN=HomeDCK3sToken sh -s server \
--cluster-init \
--node-external-ip=${NODE_EXTERNAL_IP}  \
--node-ip=${NODE_INTERNAL_IP} \
--advertise-address=${NODE_INTERNAL_IP} \
--flannel-iface=${INTERNAL_INTERFACE}

sleep 5
kubectl get nodes -o wide
kubectl get pods -A

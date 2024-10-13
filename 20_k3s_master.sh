#!/bin/bash
set -o xtrace

export INTERNAL_INTERFACE=enp4s0
export NODE_EXTERNAL_IP=192.168.68.201
export NODE_INTERNAL_IP=10.0.0.1

curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | tee /usr/share/keyrings/helm.gpg > /dev/null
apt-get install apt-transport-https --yes
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | tee /etc/apt/sources.list.d/helm-stable-debian.list
apt-get update
apt-get install helm


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

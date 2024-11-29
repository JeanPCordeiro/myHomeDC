#!/bin/bash
set -o xtrace

#export KUBECONFIG=/etc/k3s.yaml

#
# Install Longhorn
#
kubectl apply -f https://raw.githubusercontent.com/longhorn/longhorn/v1.7.2/deploy/longhorn.yaml
watch kubectl get pods -n longhorn-system
sleep 5
kubectl create -f https://raw.githubusercontent.com/longhorn/longhorn/v1.7.1/examples/storageclass.yaml
kubectl patch storageclass local-path -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"false"}}}'
kubectl patch storageclass longhorn -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'

kubectl get sc

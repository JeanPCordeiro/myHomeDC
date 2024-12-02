#!/bin/bash
set -o xtrace

export KUBECONFIG=/etc/rancher/k3s/k3s.yaml

export NAMESITE=leansys

export EMAIL=jeanpierre.cordeiro@gmail.com
export DOMAIN=lean-sys.com

#
# Install Wordpress
#
kubectl create ns ${NAMESITE}

cat wordpress.yaml | envsubst | kubectl apply -f - -n ${NAMESITE}
watch kubectl get pods -A


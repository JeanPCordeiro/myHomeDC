#!/bin/bash
set -o xtrace

export KUBECONFIG=/etc/rancher/k3s/k3s.yaml

export EMAIL=jeanpierre.cordeiro@gmail.com
export DOMAIN=lean-sys.com

#
# Install Portainer
#
kubectl apply -f portainer.yaml
cat portainer-ingress.yaml | envsubst | kubectl apply -f -
#cat portainer-ingress.yaml | envsubst | kubectl delete -f -

watch kubectl get pods -A

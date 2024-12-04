#!/bin/bash
set -o xtrace

export KUBECONFIG=/etc/rancher/k3s/k3s.yaml

export EMAIL=jeanpierre.cordeiro@gmail.com
export DOMAIN=lean-sys.com

#
# Install Portainer
#
cat longhorn-ui-ingress.yaml | envsubst | kubectl apply -f -
#cat longhorn-ui-ingress.yaml | envsubst | kubectl delete -f -


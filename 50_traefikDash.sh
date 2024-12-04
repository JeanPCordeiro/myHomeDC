#!/bin/bash
set -o xtrace

#export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
export DOMAIN=lean-sys.com
export EMAIL=jeanpierre.cordeiro@gmail.com

cat basic-auth-secret.yaml | envsubst | kubectl apply -f -
cat basic-auth-middleware.yaml | envsubst | kubectl apply -f -

cat traefik-dashboard-service.yaml | envsubst | kubectl apply -f -
cat traefik-dashboard-ingress.yaml | envsubst | kubectl apply -f -
#cat traefik-dashboard-ingress.yaml | envsubst | kubectl delete -f -

watch kubectl get pods -A

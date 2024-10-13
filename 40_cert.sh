#!/bin/bash
set -o xtrace

#export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
export DOMAIN=les-cordeiro.fr
export EMAIL=jeanpierre.cordeiro@gmail.com

kubectl create ns cert-manager
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.13.1/cert-manager.yaml
watch kubectl get pods --namespace cert-manager

cat certs.yaml | envsubst | kubectl apply -f -

cat traefik-https-redirect-middleware.yaml | envsubst | kubectl apply -f -
kubectl apply -f whoami-deployment.yaml 
kubectl apply -f whoami-service.yaml
cat whoami-ingress-tls.yaml | envsubst | kubectl apply -f -

watch kubectl get pods -A 

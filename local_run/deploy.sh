#!/bin/bash

echo "***Creating deployment***"

kubectl create namespace ingress
kubectl create namespace http-echo

helm install --namespace ingress ingress charts/nginx-ingress-controller-9.5.1.tgz --values charts/values-ingress.yml

for resource in k8s/*
do
    kubectl apply -f $resource -n http-echo
done

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.13.7/config/manifests/metallb-native.yaml

kubectl wait --namespace metallb-system \
                --for=condition=ready pod \
                --selector=app=metallb \
                --timeout=90s

kubectl apply -f LB/metalLB.yml
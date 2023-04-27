#!/bin/bash

echo "***Creating deployment***"

kubectl create namespace ingress

helm install ingress chart/nginx-ingress-controller-9.5.1.tgz --values chart/values-ingress.yml --namespace ingress

for resource in k8s/*
do
    kubectl apply -f $resource
done

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.13.7/config/manifests/metallb-native.yaml

kubectl wait --namespace metallb-system \
                --for=condition=ready pod \
                --selector=app=metallb \
                --timeout=90s

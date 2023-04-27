#!/bin/bash

kubectl create namespace ingress

helm install --namespace ingress ingress charts/nginx-ingress-controller-9.5.1.tgz --values charts/values-ingress.yml
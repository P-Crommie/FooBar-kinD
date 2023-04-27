#!/bin/bash

echo "***Deleting deployment***"

for resource in deployment/*
do
    kubectl delete -f $resource
done

helm uninstall ingress
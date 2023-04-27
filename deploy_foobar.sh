#!/bin/sh

kubectl create namespace http-echo

for resource in k8s/*
do
    kubectl apply -f $resource -n http-echo
done


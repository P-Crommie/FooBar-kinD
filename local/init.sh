#!/bin/bash

echo "***create cluster***"
./createCluster.sh


echo "***deploy echo-http***"
./deploy.sh
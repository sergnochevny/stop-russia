#!/bin/bash

apt -y update
apt -y install docker.io

fallocate -l 1G /swapfile && chmod 600 /swapfile && mkswap /swapfile && swapon /swapfile 

NUMPROC=5

for proc in $(seq 1 $NUMPROC); do
  docker run ghcr.io/arriven/db1000n:latest
done

#!/bin/sh -x

for i in "global" "customer" "subfw" "mainfw" "support1"
do
sudo docker exec hardening_${i}_1 /root/routing.sh
done

#!/bin/sh
route add -net 192.168.0.0 gw 10.2.2.251 metric 1 netmask 255.255.255.0
route add -net 192.168.129.0 gw 10.2.2.252 metric 1 netmask 255.255.255.0

iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -A FORWARD -i eth0 -o eth1 -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT


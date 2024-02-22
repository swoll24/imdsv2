#!/bin/sh

# Assign an IP address to local loopback 
ip addr add 127.0.0.1/24 dev lo

ip link set dev lo up

# Add a hosts record, pointing target site calls to local loopback
#echo "127.0.0.1   ip-ranges.amazonaws.com" >> /etc/hosts

echo "About to start a socat bridge from 8080 to vsock 8080 for IMDSv2 creds"
socat -d TCP-LISTEN:8080,fork,reuseaddr VSOCK-CONNECT:3:8080 &
#socat -d TCP-LISTEN:8081,fork,reuseaddr TCP-CONNECT:172.17.0.2:8080 &
#socat -d VSOCK-LISTEN:8080,reuseaddr,fork TCP-CONNECT:169.254.169.254:80 &
python3 /app/server.py

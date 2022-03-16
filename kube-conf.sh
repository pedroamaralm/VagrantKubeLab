#!/bin/bash
cat >>/etc/sysctl.d/kubernetes.conf<<EOF 
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF 
sysctl --system
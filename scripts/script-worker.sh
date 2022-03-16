#!/bin/bash  

curl -fsSL https://get.docker.com -o get-docker.sh && \
sudo sh get-docker.sh && \
sudo usermod -aG docker $USER && \
sudo su && \
ufw disable && \
swapoff -a; sed -i '/swap/d' /etc/fstab && \
cat >>/etc/sysctl.d/kubernetes.conf<<EOF 
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sysctl --system && \
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list && \
apt update && apt install -y kubeadm=1.20.0-00 kubelet=1.20.0-00 kubectl=1.20.0-00 && \
chmod u+x /vagrant/join_cluster && \
cd /vagrant/ && \
bash join_cluster && \
echo "Provisionamento do worker feito com sucesso."
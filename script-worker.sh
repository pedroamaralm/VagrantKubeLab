#!/bin/bash  

curl -fsSL https://get.docker.com -o get-docker.sh
echo "Step 1" 
sudo sh get-docker.sh 
echo "Step 2" 
sudo usermod -aG docker $USER 
echo "Step 3" 
sudo su 
echo "Step 4" 
ufw disable 
echo "Step 5" 
swapoff -a; sed -i '/swap/d' /etc/fstab 
cat >>/etc/sysctl.d/kubernetes.conf<<EOF 
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
echo "Step 6" 
sysctl --system
echo "Step 7" 
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - 
echo "Step 8" 
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list 
echo "Step 9" 
apt update && apt install -y kubeadm=1.20.0-00 kubelet=1.20.0-00 kubectl=1.20.0-00 
echo "Step 10" 
ipDoServidor=`hostname -I | awk '{print $2}'` 
echo "Step 11" 
chmod u+x /vagrant/join_cluster 
echo "Step 12" 
cd /vagrant/ 
echo "Step 13" 
bash join_cluster 
echo "Provisionamento do worker feito com sucesso." 
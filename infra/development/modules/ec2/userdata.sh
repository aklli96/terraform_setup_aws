#!/bin/bash
sudo dnf -y localinstall https://dev.mysql.com/get/mysql80-community-release-el9-4.noarch.rpm
sudo dnf -y install mysql mysql-community-client
sudo yum update
sudo yum -y install gcc openssl-devel bzip2-devel libffi-devel zlib-devel make
cd /tmp
wget https://www.python.org/ftp/python/3.9.6/Python-3.9.6.tgz
tar -xvf Python-3.9.6.tgz
cd Python-3.9.6
./configure --enable-optimizations
sudo make altinstall
rm -f /tmp/Python-3.9.6.tgz
python3.9 -V 
python3.9 -m venv env
echo "Configuration deployment completed"

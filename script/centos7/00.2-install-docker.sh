# Copyright © 2017 Feature.su. All rights reserved. 
# Licensed under the Apache License, Version 2.0 

if [ "`systemctl is-active docker`" != "active" ]
then
yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum -y install docker-ce
systemctl start docker
systemctl enable docker
reboot
else
echo "Warning: docker already install"
fi

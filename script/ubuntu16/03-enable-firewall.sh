# Copyright © 2018 Feature.su. All rights reserved. 
# Licensed under the Apache License, Version 2.0  

if [ "`systemctl is-active firewalld`" != "active" ] 
then 
apt-get -y install firewalld 
systemctl start firewalld 
firewall-cmd --zone=public --change-interface=`basename -a /sys/class/net/* | grep -v lo | tail -n 1` 
firewall-cmd --reload 
systemctl enable firewalld 
else 
echo "Warning: firewalld already install" 
fi 

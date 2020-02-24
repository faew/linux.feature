# Copyright © 2020 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

if [ "`systemctl is-active firewalld`" != "active" ]
then
yum -y install firewalld
systemctl start firewalld
firewall-cmd --zone=public --change-interface=`route -n | grep -e "^0.0.0.0" | tail -n 1 | awk '{print $NF}'`
firewall-cmd --reload
systemctl enable firewalld
else
echo "Warning: firewalld already install"
fi

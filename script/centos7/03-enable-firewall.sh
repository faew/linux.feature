# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

yum -y install firewalld
systemctl start firewalld
firewall-cmd --zone=public --change-interface=`basename -a /sys/class/net/* | grep -v lo | tail -n 1`
firewall-cmd --reload
systemctl enable firewalld

# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

yum -y update
yum -y install selinux-policy-targeted

yum -y install audit audit-libs
systemctl enable auditd
systemctl start auditd

sed -i "s/SELINUX=disabled/SELINUX=enforcing/g" /etc/selinux/config
touch /.autorelabel
reboot

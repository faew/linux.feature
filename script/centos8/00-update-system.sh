# Copyright © 2020 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

yum -y update
yum -y install selinux-policy-targeted

yum -y install audit audit-libs
systemctl enable auditd
systemctl start auditd

if [ "`getenforce`" != "Enforcing" ]; then
sed -i "s/SELINUX=disabled/SELINUX=enforcing/g" /etc/selinux/config
sed -i "s/SELINUX=permissive/SELINUX=enforcing/g" /etc/selinux/config
touch /.autorelabel
reboot
fi

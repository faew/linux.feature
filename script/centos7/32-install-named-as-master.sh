# Copyright © 2018 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

if [ "`systemctl is-active named-chroot`" != "active" ]
then
yum -y install bind bind-utils bind-chroot
/usr/libexec/setup-named-chroot.sh /var/named/chroot on
systemctl stop named-chroot

sed -i "s/127\.0\.0\.1/any/g" /etc/named.conf
sed -i "s/::1/none/g" /etc/named.conf
sed -i "s/allow-query/allow-recursion/g" /etc/named.conf

systemctl enable named-chroot
systemctl start named-chroot
systemctl restart named-chroot

firewall-cmd --permanent --zone=public --add-service=dns
firewall-cmd --reload

else 
echo "Warning: named-chroot already install" 
fi

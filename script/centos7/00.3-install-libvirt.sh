# Copyright © 2018 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

if [ "`systemctl is-active libvirtd`" != "active" ]
then
yum -y install libvirt virt-top spice-server spice-protocol virt-install
systemctl enable libvirtd
systemctl start libvirtd
firewall-cmd --add-port=5901/tcp --permanent
firewall-cmd --reload
reboot
else
echo "Warning: libvirtd already install"
fi

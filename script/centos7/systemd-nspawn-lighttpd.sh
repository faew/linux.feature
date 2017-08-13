# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

mkdir /var/lib/machines/lighttpd
yum -y --nogpg --releasever=7 --installroot=/var/lib/machines/lighttpd install systemd systemd-networkd passwd yum vim-enhanced bash less psmisc epel-release wget cronie logrotate
yum -y --nogpg --releasever=7 --installroot=/var/lib/machines/lighttpd install lighttpd
sed -i "s/server.use-ipv6 = \"enable\"/#server.use-ipv6 = \"enable\"/g" /var/lib/machines/lighttpd/etc/lighttpd/lighttpd.conf
echo "include \"conf.d/proxy.conf\"" >> /var/lib/machines/lighttpd/etc/lighttpd/lighttpd.conf
chroot /var/lib/machines/lighttpd systemctl enable lighttpd
systemctl enable systemd-nspawn-online@lighttpd
systemctl start systemd-nspawn-online@lighttpd
firewall-cmd --zone=public --permanent --add-service=http
firewall-cmd --reload

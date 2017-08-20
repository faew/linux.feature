# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

mkdir /var/lib/machines/mysqld

yum -y --nogpg --releasever=7 --installroot=/var/lib/machines/mysqld install systemd systemd-networkd passwd yum vim-enhanced bash less psmisc epel-release wget cronie logrotate

chroot /var/lib/machines/mysqld mkdir /etc/linux.feature
chroot /var/lib/machines/mysqld chmod 600 /etc/linux.feature
chroot /var/lib/machines/mysqld chcon -t admin_home_t /etc/linux.feature

cp /root/linux.feature/script/centos7/08-install-mysql.sh /var/lib/machines/mysqld/tmp/08-install-mysql.sh
systemctl enable systemd-nspawn-online@mysqld
systemctl start systemd-nspawn-online@mysqld
chroot /var/lib/machines/mysqld sh /tmp/08-install-mysql.sh

chroot /var/lib/machines/mysqld systemctl enable mysqld
systemctl stop systemd-nspawn-online@mysqld
systemctl start systemd-nspawn-online@mysqld

cp /root/linux.feature/script/centos7/08.2-set-pass-mysql.sh /var/lib/machines/mysqld/tmp/08.2-set-pass-mysql.sh
chroot /var/lib/machines/mysqld sh /tmp/08.2-set-pass-mysql.sh `pwgen -y 12 1`

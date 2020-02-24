# Copyright © 2020 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

yum -y install epel-release
yum -y install psmisc
yum -y install mc telnet nano traceroute
yum -y install wget net-tools
yum -y install bind-utils
yum -y install rsync sshpass
yum -y install pwgen
yum -y install supervisor
yum -y install unzip p7zip
yum -y install yum-utils
yum -y install aspell-en
yum -y install certbot
yum -y install smartmontools dmidecode lm_sensors
yum -y install sysstat htop
yum -y install linux-firmware microcode_ctl
yum -y install pngquant optipng
yum -y install chromium
yum -y install dstat python3-pip
yum -y install setools
dnf -y --enablerepo=PowerTools install fuse-sshfs

systemctl enable sysstat
systemctl start sysstat

mkdir /etc/linux.feature
chmod 700 /etc/linux.feature
chcon -t admin_home_t /etc/linux.feature

mkdir /var/backup
chmod 700 /var/backup
chcon -t admin_home_t /var/backup

mkdir /iso/

yum -y groupinstall "Development Tools"
yum -y install zlib-devel openssl-devel sqlite-devel bzip2-devel perl-devel

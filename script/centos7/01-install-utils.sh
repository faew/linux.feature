# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

yum -y install epel-release
yum -y install psmisc
yum -y install mc telnet nano traceroute
yum -y install wget net-tools
yum -y install bind-utils
yum -y install rdiff-backup rsync sshpass sshfs
yum -y install policycoreutils-python setools
yum -y install pwgen
yum -y install supervisor
yum -y install unzip
yum -y install yum-utils
yum -y install aspell-en
yum -y install certbot
yum -y install smartmontools dmidecode lm_sensors

mkdir /etc/linux.feature
chmod 700 /etc/linux.feature
chcon -t admin_home_t /etc/linux.feature

mkdir /var/backup
chmod 700 /var/backup
chcon -t admin_home_t /var/backup

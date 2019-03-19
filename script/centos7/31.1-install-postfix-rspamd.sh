# Copyright © 2019 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

if [ "`systemctl is-active rspamd`" != "active" ]
then
wget -O /etc/yum.repos.d/rspamd.repo https://rspamd.com/rpm-stable/centos-7/rspamd.repo
yum -y install rspamd

wget -O /etc/rspamd/override.d/worker-controller.inc https://raw.githubusercontent.com/faew/linux.feature/master/conf/centos7/rspamd/override.d/worker-controller.inc
wget -O /etc/rspamd/override.d/worker-normal.inc https://raw.githubusercontent.com/faew/linux.feature/master/conf/centos7/rspamd/override.d/worker-normal.inc
wget -O /etc/rspamd/override.d/worker-proxy.inc https://raw.githubusercontent.com/faew/linux.feature/master/conf/centos7/rspamd/override.d/worker-proxy.inc

systemctl enable rspamd
systemctl start rspamd

chown _rspamd:postfix /var/run/rspamd
chmod 750 /var/run/rspamd

echo "" >> /etc/postfix/main.cf 
echo "smtpd_milters = unix:/var/run/rspamd/rspamd-proxy.sock" >> /etc/postfix/main.cf
echo "milter_default_action = accept" >> /etc/postfix/main.cf

systemctl reload postfix
else
echo "Warning: rspamd already install"
fi

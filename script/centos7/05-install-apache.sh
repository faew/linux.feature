# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

if [ "`systemctl is-active httpd`" != "active" ]
then
yum -y install httpd httpd-itk php
firewall-cmd --zone=public --permanent --add-service=http
firewall-cmd --reload
sed -i "s/Listen 80/Listen 0.0.0.0:80/g" /etc/httpd/conf/httpd.conf
sed -i "s/#LoadModule/LoadModule/g" /etc/httpd/conf.modules.d/00-mpm-itk.conf
wget -O /etc/httpd/conf.modules.d/10-vhost.conf https://raw.githubusercontent.com/faew/linux.feature/master/conf/centos7/apache24/10-vhost.conf

echo "<Directory \"/var/www\">" > /etc/httpd/conf.d/allowoverride.conf
echo "AllowOverride All" >> /etc/httpd/conf.d/allowoverride.conf
echo "</Directory>" >> /etc/httpd/conf.d/allowoverride.conf

systemctl enable httpd
systemctl start httpd

setsebool -P httpd_can_sendmail on
setsebool -P httpd_can_network_connect on

sh add-www-user.sh empty.local

cd /tmp
wget https://raw.githubusercontent.com/faew/linux.feature/master/patch/httpd_dac.te
checkmodule -M -m -o httpd_dac.mod httpd_dac.te
semodule_package -o httpd_dac.pp -m httpd_dac.mod
semodule -i httpd_dac.pp

else
echo "Warning: httpd already install"
fi

# Copyright © 2020 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

if [ "`systemctl is-active httpd`" != "active" ]
then
yum -y install httpd php
firewall-cmd --zone=public --permanent --add-service=http
firewall-cmd --reload
sed -i "s/Listen 80/Listen 0.0.0.0:80/g" /etc/httpd/conf/httpd.conf
echo "TraceEnable off" >> /etc/httpd/conf/httpd.conf
sed -i "s/#LoadModule mpm_prefork_module/LoadModule mpm_prefork_module/g" /etc/httpd/conf.modules.d/00-mpm.conf
sed -i "s/LoadModule mpm_event_module/#LoadModule mpm_event_module/g" /etc/httpd/conf.modules.d/00-mpm.conf
wget -O /etc/httpd/conf.modules.d/10-vhost.conf https://raw.githubusercontent.com/faew/linux.feature/master/conf/centos7/apache24/10-vhost.conf

echo "<Directory \"/var/www\">" > /etc/httpd/conf.d/allowoverride.conf
echo "AllowOverride All" >> /etc/httpd/conf.d/allowoverride.conf
echo "</Directory>" >> /etc/httpd/conf.d/allowoverride.conf

echo "RemoteIPHeader X-Forwarded-For" > /etc/httpd/conf.d/remouteip.conf
echo "RemoteIPInternalProxy 127.0.0.1" >> /etc/httpd/conf.d/remouteip.conf
echo 'LogFormat "%a %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\"" combined' >> /etc/httpd/conf.d/remouteip.conf

cd /tmp
yum -y install httpd  httpd-devel
wget http://mpm-itk.sesse.net/mpm-itk-2.4.7-04.tar.gz
tar -xvzf mpm-itk-2.4.7-04.tar.gz
cd mpm-itk-2.4.7-04
./configure
make
make install

echo "LoadModule mpm_itk_module modules/mpm_itk.so" > /etc/httpd/conf.modules.d/00-mpm-itk.conf

cd /tmp
wget https://raw.githubusercontent.com/faew/linux.feature/master/patch/httpd_dac.te
checkmodule -M -m -o httpd_dac.mod httpd_dac.te
semodule_package -o httpd_dac.pp -m httpd_dac.mod
semodule -i httpd_dac.pp

systemctl enable httpd
systemctl start httpd

setsebool -P httpd_can_sendmail on
setsebool -P httpd_can_network_connect on
setsebool -P httpd_sys_script_anon_write on
setsebool -P domain_can_mmap_files on

cd ~/linux.feature/script/centos8
sh add-www-user.sh empty.local

yum -y install postfix
systemctl enable postfix
systemctl start postfix

else
echo "Warning: httpd already install"
fi

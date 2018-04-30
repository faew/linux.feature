# Copyright © 2018 Feature.su. All rights reserved. 
# Licensed under the Apache License, Version 2.0  

if [ "`systemctl is-active apache2`" != "active" ]
then
apt-get -y install apache2 libapache2-mpm-itk php libapache2-mod-php
a2enmod mpm_prefork
a2enmod mpm_itk
a2enmod php7.0
a2enmod macro

firewall-cmd --zone=public --permanent --add-service=http
firewall-cmd --reload

sed -i "s/Listen 80/Listen 0.0.0.0:80/g" /etc/apache2/ports.conf
sed -i "s/Listen 443/Listen 0.0.0.0:443/g" /etc/apache2/ports.conf

echo "<Directory \"/var/www\">" > /etc/apache2/conf-available/allowoverride.conf 
echo "Options -Indexes" >> /etc/apache2/conf-available/allowoverride.conf 
echo "AllowOverride All" >> /etc/apache2/conf-available/allowoverride.conf 
echo "</Directory>" >> /etc/apache2/conf-available/allowoverride.conf 
a2enconf allowoverride

wget -O /etc/apache2/conf-available/vhost.conf https://raw.githubusercontent.com/faew/linux.feature/master/conf/centos7/apache24/10-vhost.conf 
sed -i "s/httpd/apache2/g" /etc/apache2/conf-available/vhost.conf
sed -i "s/LoadModule/# LoadModule/g" /etc/apache2/conf-available/vhost.conf
a2enconf vhost

a2enmod remoteip
echo "RemoteIPHeader X-Forwarded-For" > /etc/apache2/conf-available/remoteip.conf 
echo "RemoteIPInternalProxy 127.0.0.1" >> /etc/apache2/conf-available/remoteip.conf
echo 'LogFormat "%a %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\"" combined' >> /etc/apache2/conf-available/remoteip.conf
a2enconf remoteip

a2dissite 000-default
sh add-www-user.sh 000-empty.local

systemctl enable apache2
systemctl start apache2

else 
echo "Warning: httpd already install" 
fi 

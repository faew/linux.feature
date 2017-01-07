# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

yum install httpd httpd-itk
firewall-cmd --zone=public --permanent --add-service=http
firewall-cmd --reload
sed -i "s/Listen 80/Listen 0.0.0.0:80/g" /etc/httpd/conf/httpd.conf
sed -i "s/#LoadModule/LoadModule/g" /etc/httpd/conf.modules.d/00-mpm-itk.conf
wget -O /etc/httpd/conf.modules.d/10-vhost.conf https://raw.githubusercontent.com/faew/linux.feature/master/conf/centos7/apache24/10-vhost.conf
systemctl enable httpd
systemctl start httpd

setsebool -P httpd_can_sendmail on

# Copyright © 2019 Feature.su. All rights reserved. 
# Licensed under the Apache License, Version 2.0 

# Warning: this delete php 5.4 from default

cd /tmp

wget http://rpms.remirepo.net/enterprise/remi-release-7.rpm
rpm -Uvh remi-release-7.rpm

yum-config-manager --enable remi-php71

yum -y update php

yum -y install php php-pdo php-mysql php-pear php-devel php-soap php-xml php-gd php-mcrypt php-dba php-mbstring php-pgsql php-posix php-intl php-pecl-memcache php-pecl-imagick

sed -i "s/short_open_tag = Off/short_open_tag = On/g" /etc/php.ini
sed -i "s/expose_php = On/expose_php = Off/g" /etc/php.ini
sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 20M/g" /etc/php.ini
sed -i "s/post_max_size = 8M/post_max_size = 20M/g" /etc/php.ini
sed -i "s/;date.timezone =/date.timezone = UTC/g" /etc/php.ini

systemctl restart httpd

setsebool -P httpd_execmem on

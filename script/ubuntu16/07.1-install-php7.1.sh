# Copyright © 2018 Feature.su. All rights reserved. 
# Licensed under the Apache License, Version 2.0  

apt-get -y install python-software-properties
add-apt-repository ppa:ondrej/php
apt-get update

apt-get -y install php7.1 php7.1-zip php7.1-curl php7.1-mysql php7.1-dev php7.1-soap php7.1-xml php7.1-gd php7.1-mcrypt php7.1-dba php7.1-mbstring php7.1-pgsql php7.1-sqlite3 php7.1-memcached php7.1-imagick php7.1-intl

a2dismod php7.0
a2enmod php7.1

sed -i "s/short_open_tag = Off/short_open_tag = On/g" /etc/php/7.1/apache2/php.ini 
sed -i "s/expose_php = On/expose_php = Off/g" /etc/php/7.1/apache2/php.ini 
sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 20M/g" /etc/php/7.1/apache2/php.ini  
sed -i "s/post_max_size = 8M/post_max_size = 20M/g" /etc/php/7.1/apache2/php.ini 
sed -i "s/;date.timezone =/date.timezone = UTC/g" /etc/php/7.1/apache2/php.ini 

sed -i "s/short_open_tag = Off/short_open_tag = On/g" /etc/php/7.1/cli/php.ini 
sed -i "s/expose_php = On/expose_php = Off/g" /etc/php/7.1/cli/php.ini 
sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 20M/g" /etc/php/7.1/cli/php.ini  
sed -i "s/post_max_size = 8M/post_max_size = 20M/g" /etc/php/7.1/cli/php.ini 
sed -i "s/;date.timezone =/date.timezone = UTC/g" /etc/php/7.1/cli/php.ini 

service apache2 restart

# Copyright © 2018 Feature.su. All rights reserved. 
# Licensed under the Apache License, Version 2.0  

apt-get -y install php php-pdo php-mysql php-pear php-dev php-soap php-xml php-gd php-mcrypt php-dba php-mbstring php-pgsql php-posix php-sqlite3

sed -i "s/short_open_tag = Off/short_open_tag = On/g" /etc/php/7.0/apache2/php.ini
sed -i "s/expose_php = On/expose_php = Off/g" /etc/php/7.0/apache2/php.ini
sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 20M/g" /etc/php/7.0/apache2/php.ini 
sed -i "s/post_max_size = 8M/post_max_size = 20M/g" /etc/php/7.0/apache2/php.ini
sed -i "s/;date.timezone =/date.timezone = UTC/g" /etc/php/7.0/apache2/php.ini

sed -i "s/short_open_tag = Off/short_open_tag = On/g" /etc/php/7.0/cli/php.ini
sed -i "s/expose_php = On/expose_php = Off/g" /etc/php/7.0/cli/php.ini
sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 20M/g" /etc/php/7.0/cli/php.ini 
sed -i "s/post_max_size = 8M/post_max_size = 20M/g" /etc/php/7.0/cli/php.ini
sed -i "s/;date.timezone =/date.timezone = UTC/g" /etc/php/7.0/cli/php.ini

systemctl restart apache2

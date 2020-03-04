# Copyright © 2020 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

yum -y install php php-zip php-pdo php-mysqlnd php-pear php-devel php-soap php-xml php-gd php-dba php-mbstring php-pgsql php-posix php-bcmath php-intl php-json php-opcache

sed -i "s/short_open_tag = Off/short_open_tag = On/g" /etc/php.ini
sed -i "s/expose_php = On/expose_php = Off/g" /etc/php.ini
sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 20M/g" /etc/php.ini
sed -i "s/post_max_size = 8M/post_max_size = 20M/g" /etc/php.ini
sed -i "s/;date.timezone =/date.timezone = UTC/g" /etc/php.ini

dnf -y --enablerepo=PowerTools install ImageMagick-devel

cd /tmp
wget https://pecl.php.net/get/imagick-3.4.4.tgz
tar -xvzf ./imagick-3.4.4.tgz
cd imagick-3.4.4
phpize
./configure
make
make install
echo "extension=imagick" > /etc/php.d/90-imagick.ini

setsebool -P httpd_execmem on

systemctl restart httpd

# Copyright © 2020 Feature.su. All rights reserved. 
# Licensed under the Apache License, Version 2.0  

# Warning: Install the databases and <= openssl 1.0.2 before you compile 
# there use path from 48-install-openssl-gost2012.sh

yum -y groupinstall "Development Tools"
yum -y install httpd-devel
yum -y install zlib-devel openssl-devel sqlite-devel bzip2-devel
yum -y install openldap-devel gmp-devel libXpm-devel libcurl-devel libicu-devel libmcrypt-devel libpng-devel libxml2-devel mysql-devel libxslt-devel mhash-devel ImageMagick-devel
yum -y install mysql-devel libxslt-devel mhash-devel libmcrypt-devel libpng-devel libxml2-devel
yum -y install libwebp-devel libjpeg-turbo-devel freetype-devel
yum -y --enablerepo=powertools install ImageMagick-devel

cd /tmp
wget https://museum.php.net/php5/php-5.4.45.tar.gz
tar -xvzf ./php-5.4.45.tar.gz
cd php-5.4.45
cd ext
wget https://pecl.php.net/get/imagick-3.4.4.tgz
tar -xvzf ./imagick-3.4.4.tgz
mv imagick-3.4.4 imagick
cd ..
rm -f configure
./buildconf --force
./configure --prefix=/usr/local/php54 --with-ldap --with-libdir=lib64 --with-config-file-path=/usr/local/php54/etc --with-config-file-scan-dir=/usr/local/php54/etc/conf.d --with-apxs2 --enable-bcmath --with-bz2 --with-curl --enable-cgi --enable-filter --enable-pcntl --with-gd --with-mhash --enable-gd-native-ttf --with-freetype-dir --with-jpeg-dir --with-png-dir --enable-mbstring --with-mcrypt --enable-json --enable-mysqlnd --with-mysql-sock=/var/lib/mysql/mysql.sock --with-mysqli=mysqlnd --with-pdo-mysql=mysqlnd --with-pdo-sqlite --with-openssl-dir=/usr/local/gost/bin --enable-simplexml --with-xsl --with-sqlite3 --enable-xmlreader --enable-xmlwriter --enable-zip --enable-soap --with-zlib --with-imagick --enable-intl
make
make install
mkdir /usr/local/php54/etc/conf.d
cp ./php.ini-production /usr/local/php54/etc/php.ini
/usr/local/php54/bin/php -v

sed -i "s/short_open_tag = Off/short_open_tag = On/g" /usr/local/php54/etc/php.ini
sed -i "s/expose_php = On/expose_php = Off/g" /usr/local/php54/etc/php.ini 
sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 20M/g" /usr/local/php54/etc/php.ini 
sed -i "s/post_max_size = 8M/post_max_size = 20M/g" /usr/local/php54/etc/php.ini 
sed -i "s/;date.timezone =/date.timezone = UTC/g" /usr/local/php54/etc/php.ini 

sed -i "/php5_module/ d" /etc/httpd/conf/httpd.conf
systemctl restart httpd

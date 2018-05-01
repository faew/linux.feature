# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

# Warning: Install the databases before you compile

yum -y groupinstall "Development Tools"
yum -y install zlib-devel openssl-devel sqlite-devel bzip2-devel
yum -y install libxslt-devel postgresql-devel mysql-devel  mhash-devel freetype-devel libpng-devel libmcrypt-devel
yum -y install libcurl-devel xorg-x11-proto-devel libX11-devel cyrus-sasl-devel libjpeg-devel openldap-devel
yum -y install db4-devel expat-devel libidn-devel libXpm-devel httpd-devel

cd /tmp
wget http://museum.php.net/php5/php-5.2.17.tar.gz
tar -xvzf ./php-5.2.17.tar.gz
mv php-5.2.17 php-5.2.16
wget --no-check-certificate https://download.suhosin.org/suhosin-patch-5.2.16-0.9.7.patch.gz
gunzip suhosin-patch-5.2.16-0.9.7.patch.gz
patch -p0 < ./suhosin-patch-5.2.16-0.9.7.patch
mv php-5.2.16 php-5.2.17
wget https://raw.githubusercontent.com/faew/linux.feature/master/patch/php5-libxml2.patch
cd php-5.2.17
patch -p0 < ../php5-libxml2.patch
./configure '--with-layout=GNU' '--with-libxml-dir=/usr/local' '--enable-reflection' '--enable-spl' '--program-prefix=' '--enable-fastcgi' '--with-zend-vm=CALL' '--prefix=/usr/local/php52' '--with-mysql' '--with-mhash' '--enable-cgi' '--with-xmlrpc' '--with-mcrypt' '--with-gettext' '--with-xsl' '--with-pdo-mysql' '--with-zlib' '--with-bz2' '--with-curl' '--enable-mbstring' '--with-pgsql' '--enable-zip' '--with-gd' '--enable-ftp' '--with-freetype-dir=/usr' '--enable-gd-native-ttf' '--with-libdir=lib64' '--with-jpeg-dir=/usr' '--with-png-dir=/usr' '--with-zlib-dir=/usr' '--with-xpm-dir=/usr' '--with-openssl' '--enable-soap'
make
make install
cp ./php.ini-dist /usr/local/php52/etc/php.ini
/usr/local/php52/bin/php -v

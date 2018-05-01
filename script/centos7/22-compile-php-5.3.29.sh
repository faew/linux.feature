# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

# Warning: Install the databases before you compile

yum -y groupinstall "Development Tools"
yum -y install zlib-devel openssl-devel sqlite-devel bzip2-devel
yum -y install libxslt-devel postgresql-devel mysql-devel  mhash-devel freetype-devel libpng-devel libmcrypt-devel
yum -y install libcurl-devel xorg-x11-proto-devel libX11-devel cyrus-sasl-devel libjpeg-devel openldap-devel
yum -y install db4-devel expat-devel libidn-devel libXpm-devel httpd-devel gmp-devel ncurses-devel libtool-ltdl-devel

cd /tmp
wget -O php-5.3.29.tar.gz http://php.net/get/php-5.3.29.tar.gz/from/this/mirror
tar -xvzf ./php-5.3.29.tar.gz
wget --no-check-certificate https://download.suhosin.org/suhosin-patch-5.3.9-0.9.10.patch.gz
gunzip suhosin-patch-5.3.9-0.9.10.patch.gz
sed -i "s/1997-2004/1997-2014/g" suhosin-patch-5.3.9-0.9.10.patch
sed -i "s/1997-2011/1997-2014/g" suhosin-patch-5.3.9-0.9.10.patch
sed -i "s/1997-2012/1997-2014/g" suhosin-patch-5.3.9-0.9.10.patch
mv php-5.3.29 php-5.3.9
patch -p0 < ./suhosin-patch-5.3.9-0.9.10.patch
mv php-5.3.9 php-5.3.29
cd php-5.3.29
'./configure' '--with-layout=GNU' '--with-libxml-dir=/usr/' '--program-prefix=' '--with-zend-vm=CALL' '--prefix=/usr/local/php53' '--with-mysql' '--with-mhash' '--enable-cgi' '--with-xmlrpc' '--with-mcrypt' '--with-gettext' '--with-xsl' '--with-pdo-mysql' '--with-zlib' '--with-bz2' '--with-curl' '--enable-mbstring' '--with-pgsql' '--enable-zip' '--with-gd' '--enable-ftp' '--with-freetype-dir=/usr' '--enable-gd-native-ttf' '--with-jpeg-dir=/usr' '--with-png-dir=/usr' '--with-zlib-dir=/usr' '--with-xpm-dir=/usr' '--with-openssl' '--enable-soap'  '--with-libdir=lib64' '--enable-zend-multibyte' '--with-pgsql'
make
make install
cp ./php.ini-production /usr/local/php53/etc/php.ini
/usr/local/php53/bin/php -v

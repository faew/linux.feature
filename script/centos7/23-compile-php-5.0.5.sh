# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

# Warning: Install the databases before you compile
# Warning: delete /tmp/php-5.1.6 if exist

yum -y groupinstall "Development Tools"
yum -y install zlib-devel openssl-devel sqlite-devel bzip2-devel
yum -y install libxslt-devel postgresql-devel mysql-devel  mhash-devel freetype-devel libpng-devel libmcrypt-devel
yum -y install libcurl-devel xorg-x11-proto-devel libX11-devel cyrus-sasl-devel libjpeg-devel openldap-devel
yum -y install db4-devel expat-devel libidn-devel libXpm-devel httpd-devel gmp-devel ncurses-devel

yum install autoconf213
export PHP_AUTOCONF=/usr/bin/autoconf-2.13

cd /tmp
wget http://museum.php.net/php5/php-5.0.5.tar.gz
tar -xvzf ./php-5.0.5.tar.gz
wget https://download.suhosin.org/suhosin-patch-5.0.5-0.9.6.patch.gz
wget https://raw.githubusercontent.com/faew/linux.feature/master/patch/php51-openssl1.patch
wget https://raw.githubusercontent.com/faew/linux.feature/master/patch/php51-curl7.patch
wget https://raw.githubusercontent.com/faew/linux.feature/master/patch/php51-libxml2.patch
wget https://raw.githubusercontent.com/faew/linux.feature/master/patch/php5-gmp.patch
gunzip suhosin-patch-5.0.5-0.9.6.patch.gz
patch -p0 < ./suhosin-patch-5.0.5-0.9.6.patch
mv php-5.0.5 php-5.1.6
patch -p0 < ./php51-curl7.patch
patch -p0 < ./php51-libxml2.patch
patch -p0 < ./php51-openssl1.patch
mv php-5.1.6 php-5.0.5
cd php-5.0.5
cd ext
wget https://pecl.php.net/get/json-1.2.1.tgz
tar -xvzf ./json-1.2.1.tgz
mv json-1.2.1 json
cd ..
patch -p0 < ../php5-gmp.patch
./buildconf --force
sed -i "s/\$i\/lib\/lib/\$i\/lib64\/lib/g" configure
'./configure' '--prefix=/usr/local/php50' '--disable-debug' '--with-pic' '--disable-rpath' '--with-bz2' '--with-curl' '--enable-gd-native-ttf' '--without-gdbm' '--with-gettext' '--with-gmp' '--with-iconv' '--with-png' '--with-zlib' '--enable-exif' '--enable-ftp' '--enable-magic-quotes' '--enable-sockets' '--enable-sysvsem' '--enable-sysvshm' '--enable-sysvmsg' '--enable-track-vars' '--enable-trans-sid' '--enable-yp' '-enable-wddx' '--with-kerberos' '--enable-ucd-snmp-hack' '--enable-memory-limit' '--enable-shmop' '--enable-calendar' '--enable-dbx' '--enable-dio' '--with-xml' '--with-system-tzdata' '--enable-pcntl' '--enable-mbstring' '--enable-mbstr-enc-trans' '--enable-mbregex' '--with-ncurses' '--with-gd' '--enable-bcmath' '--enable-dba' '--with-xmlrpc' '--with-mysql' '--enable-dom' '--with-dom-xslt' '--with-dom-exslt' '--enable-soap' '--with-xsl' '--enable-xmlreader' '--enable-xmlwriter' '--enable-fastcgi' '--enable-pdo' '--with-pdo-mysql' '--with-pdo-sqlite' '--enable-dbase' '--with-mcrypt' '--with-json' '--with-pgsql' '--with-openssl'
make
make install
cp ./php.ini-dist /usr/local/php50/lib/php.ini
/usr/local/php50/bin/php -v

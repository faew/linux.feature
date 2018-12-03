# Copyright © 2018 Feature.su. All rights reserved. 
# Licensed under the Apache License, Version 2.0 

# Warning: 44-install-firebird.sh install first

cd /tmp/php-7.1.*/ext/interbase
/usr/local/php71/bin/phpize
./configure --with-php-config=/usr/local/php71/bin/php-config
make
make install
echo 'extension=interbase.so' > /usr/local/php71/etc/conf.d/interbase.ini

cd /tmp/php-7.1.*/ext/pdo_firebird
/usr/local/php71/bin/phpize
./configure --with-php-config=/usr/local/php71/bin/php-config
make
make install
echo 'extension=pdo_firebird.so' > /usr/local/php71/etc/conf.d/pdo_firebird.ini

/usr/local/php71/bin/php -m | grep interbase
systemctl reload httpd

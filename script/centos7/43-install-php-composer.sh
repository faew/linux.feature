# Copyright © 2018 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

cd /usr/local/bin
wget https://getcomposer.org/download/1.7.3/composer.phar
chmod 755 composer.phar
cd /tmp
echo "Exec: /usr/local/php71/bin/php /usr/local/bin/composer.phar"

# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

pecl install zendopcache-7.0.4
echo 'zend_extension=/usr/lib64/php/modules/opcache.so' > /etc/php.d/opcache.ini

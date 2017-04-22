# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

yum -y install memcached
yum -y install php-pecl-memcache
systemctl start memcached
systemctl enable memcached

setsebool -P httpd_can_network_memcache 1
echo "Configuration: /etc/sysconfig/memcached"


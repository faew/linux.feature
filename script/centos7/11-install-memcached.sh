# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

yum install memcached
yum install php-pecl-memcache
systemctl start memcached
systemctl enable memcached
echo "Configuration: /etc/sysconfig/memcached"


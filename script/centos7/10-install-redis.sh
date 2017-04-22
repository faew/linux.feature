# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

yum -y install redis
systemctl start redis
systemctl enable redis
echo "Configuration: /etc/redis.conf"

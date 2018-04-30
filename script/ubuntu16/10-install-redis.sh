# Copyright © 2018 Feature.su. All rights reserved. 
# Licensed under the Apache License, Version 2.0  

apt-get -y install redis-server
systemctl start redis-server 
systemctl enable redis-server 
echo "Configuration: /etc/redis/redis.conf" 

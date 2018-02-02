# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

yum -y install redis

sed -i "s/# unixsocket \/tmp\/redis.sock/unixsocket \/var\/run\/redis\/redis.sock/g" /etc/redis.conf
sed -i "s/# unixsocketperm 700/unixsocketperm 777/g" /etc/redis.conf

cd /tmp
wget https://raw.githubusercontent.com/faew/linux.feature/master/patch/redis_socket.te
checkmodule -M -m -o redis_socket.mod redis_socket.te
semodule_package -o redis_socket.pp -m redis_socket.mod
semodule -i redis_socket.pp

systemctl start redis
systemctl enable redis
echo "Configuration: /etc/redis.conf"

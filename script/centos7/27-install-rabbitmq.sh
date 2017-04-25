# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0


if [ "`systemctl is-active rabbitmq-server`" != "active" ]
then
yum -y install erlang  socat
rpm -i https://github.com/rabbitmq/rabbitmq-server/releases/download/rabbitmq_v3_6_9/rabbitmq-server-3.6.9-1.el7.noarch.rpm
systemctl start rabbitmq-server
systemctl enable rabbitmq-server

rabbitmq-plugins enable rabbitmq_management
firewall-cmd --zone=public --permanent --add-port=15672/tcp
firewall-cmd --reload

RPASS=`pwgen 12 1`
echo -n $RPASS > /root/rabbitmq-pwd

rabbitmqctl change_password guest $RPASS
echo "Admin Url http://host:15672"
echo "user: guest"
echo "pass: $RPASS"


echo "[{rabbit, [{loopback_users, []}]}]." > /etc/rabbitmq/rabbitmq.config
systemctl restart rabbitmq-server

else
echo "Warning: rabbitmq-server already install"
fi

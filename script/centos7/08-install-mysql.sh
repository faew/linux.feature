# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

if [ "`systemctl is-active mysqld`" != "active" ]
then
rpm -i http://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm
yum -y install mysql-server
systemctl enable mysqld

# make full utf8 and set sql_mode
echo "init_connect=\"SET NAMES 'utf8mb4';SET collation_connection = 'utf8mb4_unicode_ci';SET sql_mode='NO_ZERO_IN_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';\"" >> /etc/my.cnf
echo "max_allowed_packet = 50M" >> /etc/my.cnf
echo "innodb_buffer_pool_size = 128M" >> /etc/my.cnf
echo "max_connections = 100" >> /etc/my.cnf

systemctl start mysqld

MYSQL=`pwgen -y 12 1`

echo -n $MYSQL > /etc/linux.feature/mysql-pwd

mysql --connect-expired-password -u root -p`cat /var/log/mysqld.log | grep "password is generated" | tail -n 1 | awk {'print $NF'}` <<_EOF_
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$MYSQL';
FLUSH PRIVILEGES;
_EOF_

mysql -u root -p$MYSQL <<_EOF_
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
FLUSH PRIVILEGES;
_EOF_
else
echo "Warning: mysqld already install"
fi

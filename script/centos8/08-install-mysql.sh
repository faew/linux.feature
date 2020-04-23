# Copyright © 2020 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

if [ "`systemctl is-active mysqld`" != "active" ]
then
yum -y install mysql-server
systemctl enable mysqld

# make full utf8 and set sql_mode
echo "init_connect=\"SET NAMES 'utf8mb4';SET collation_connection = 'utf8mb4_unicode_ci';SET sql_mode='NO_ZERO_IN_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';\"" >> /etc/my.cnf.d/mysql-server.cnf
echo "max_allowed_packet = 50M" >> /etc/my.cnf.d/mysql-server.cnf
echo "innodb_buffer_pool_size = 128M" >> /etc/my.cnf.d/mysql-server.cnf
echo "max_connections = 100" >> /etc/my.cnf.d/mysql-server.cnf
echo "collation-server = utf8_unicode_ci" >> /etc/my.cnf.d/mysql-server.cnf
echo "character-set-server = utf8" >> /etc/my.cnf.d/mysql-server.cnf

systemctl start mysqld

SPECIAL="()*^@#"
MYSQL=`pwgen 12 1`${SPECIAL:`shuf -i 0-5 -n 1`:1}

echo -n $MYSQL > /etc/linux.feature/mysql-pwd

mysql -u root <<_EOF_
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

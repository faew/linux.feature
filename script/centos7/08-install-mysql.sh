# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

rpm -i http://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm
yum install mysql-server
systemctl enable mysqld

# make full utf8 and set sql_mode
echo "init_connect=\"SET NAMES 'utf8mb4';SET collation_connection = 'utf8_unicode_ci';SET sql_mode='NO_ZERO_IN_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';\"" >> /etc/my.cnf

systemctl start mysqld
cat /var/log/mysqld.log | grep "password is generated"
mysql_secure_installation

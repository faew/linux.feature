# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

rpm -i http://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm
yum install mysql-server
systemctl enable mysqld

# disable only_full_group_by
echo "sql_mode='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION'" >> /etc/my.cnf

# make full utf8
echo "init_connect='SET NAMES utf8mb4 COLLATE utf8mb4_unicode_ci'" >> /etc/my.cnf

systemctl start mysqld
cat /var/log/mysqld.log | grep "password is generated"
mysql_secure_installation

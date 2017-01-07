# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

rpm -i http://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm
yum install mysql-server
systemctl enable mysqld
systemctl start mysqld
cat /var/log/mysqld.log | grep "password is generated"
mysql_secure_installation

# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

MYSQL=$1

echo -n $MYSQL > /etc/linux.feature/mysql-pwd

mysql --connect-expired-password -u root -p`cat /var/log/messages /var/log/mysqld.log | grep "password is generated" | tail -n 1 | awk {'print $NF'}` <<_EOF_
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

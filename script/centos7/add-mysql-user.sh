# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

if [ -z $1  ]
then
echo "Usage for create mysql user: sh add-mysql-user.sh user_name_create_as_db_name"
else
SPECIAL="()*^@#"
UPASS=`pwgen 12 1`${SPECIAL:`shuf -i 0-5 -n 1`:1}

mysql --silent -u root -h localhost -p`cat /etc/linux.feature/mysql-pwd`  -e "
CREATE USER $1@'%' IDENTIFIED BY '$UPASS';
GRANT USAGE ON *.* TO $1@'%' IDENTIFIED BY '$UPASS' REQUIRE NONE  WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0 ;
CREATE DATABASE IF NOT EXISTS $1 CHARACTER SET utf8mb4;
GRANT ALL PRIVILEGES ON $1.* TO $1@'%';
FLUSH PRIVILEGES;
" 2> /dev/null
echo -n $UPASS
fi

if [ -f "$1.sql" ]; then
    mysql -u root -h localhost -p`cat /etc/linux.feature/mysql-pwd` $1 < $1.sql
fi

if [ -f "$1.key" ]; then
    UPASS=`cat $1.key | xargs`
    mysql -u root -h localhost -p`cat /etc/linux.feature/mysql-pwd` mysql -e "UPDATE user SET authentication_string='$UPASS' where host='%' and user='$1';FLUSH PRIVILEGES;".
fi

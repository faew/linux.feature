# Copyright © 2018 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

if [ -z $1  ]
then
echo "Usage for create firebird user: sh add-firebird-user.sh user_name_create_as_db_name"
else
UPASS=`pwgen 8 1`

gsec -user sysdba -pass `cat /etc/linux.feature/firebird-pwd` -add $1 -pw $UPASS
echo "CREATE DATABASE '/var/lib/firebird/data/$1.fdb' USER '$1' PASSWORD '$UPASS';exit;" | isql-fb -u SYSDBA -p `cat /etc/linux.feature/firebird-pwd`

echo -n $UPASS
fi

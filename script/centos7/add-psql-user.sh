# Copyright © 2019 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

if [ -z $1  ]
then
echo "Usage for create pg sql user: sh add-psql-user.sh user_name_create_as_db_name"
else
UPASS=`pwgen 12 1`

su -l postgres -c "psql -c 'create user $1 with password '\''$UPASS'\'';'"
su -l postgres -c "psql -c 'create database $1;'"
su -l postgres -c "psql -c 'grant all privileges on database $1 to $1;'"

echo -n $UPASS
fi

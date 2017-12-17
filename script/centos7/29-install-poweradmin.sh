# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

if [ -z $1  ]
then
echo "Usage install poweradmin: sh 29-install-poweradmin.sh main_domain_for_dns"
else
cd /var/www/empty.local/html/web
wget https://github.com/poweradmin/poweradmin/archive/master.zip
unzip master.zip
rm -f master.zip
FOLDER=`pwgen -A 7 1`
mv poweradmin-master pdns-$FOLDER
cd pdns-$FOLDER
rm -f -R install
rm -f -R migrations
rm -f inc/plugins/.gitignore
cd inc

echo "
<?php
\$db_host = 'localhost';
\$db_user = 'pdns';
\$db_pass = '`cat /etc/pdns/pdns.conf | grep gmysql-password  | tail -n 1 | awk -F'=' {'print $NF'}`';
\$db_name = 'pdns';
\$db_type = 'mysql';
\$session_key = '`pwgen 64 1`';
\$dns_hostmaster = 'support.$1';
\$dns_ns1 = 'ns1.$1';
\$dns_ns2 = 'ns2.$1';
\$iface_style = 'punk';
?>" > config.inc.php

cd ..
cd sql

mysql -u root -p`cat /etc/linux.feature/mysql-pwd` pdns < poweradmin-mysql-db-structure.sql

cd ..
rm -f -R sql
cd ..

chown -R empty.local:empty.local pdns-$FOLDER

WEBPASS=`pwgen 12 1`
echo -n $WEBPASS > /etc/linux.feature/poweradmin-pwd
EXECMD5=`cat /etc/linux.feature/poweradmin-pwd | md5sum - | awk '{print $1}'`
mysql -u root -p`cat /etc/linux.feature/mysql-pwd` pdns -e "UPDATE users SET password='$EXECMD5' WHERE id=1;"

echo "Open http://MAIN-IP/pdns-$FOLDER"
echo "user: admin"
echo "password: $WEBPASS"
fi


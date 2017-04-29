# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

if [ "`systemctl is-active pdns`" != "active" ]
then
yum -y install pdns-server pdns-backend-mysql

cp /etc/pdns/pdns.conf /etc/pdns/pdns.conf.distr

echo "allow-recursion=127.0.0.1
master=yes
daemon=yes
guardian=yes
max-tcp-connections=100
launch=gmysql
gmysql-host=127.0.0.1
gmysql-user=pdns
gmysql-dbname=pdns
gmysql-password=`sh add-mysql-user.sh pdns`" > /etc/pdns/pdns.conf


SQLSHEMA="/usr/share/doc/`ls -1 /usr/share/doc/ | grep pdns-backend | tail -n 1`/schema.mysql.sql"

if  [ -f $SQLSHEMA ]; then
mysql -u root -p`cat /etc/linux.feature/mysql-pwd` pdns < $SQLSHEMA
fi

firewall-cmd --zone=public --permanent --add-port=53/tcp
firewall-cmd --zone=public --permanent --add-port=53/udp
firewall-cmd --reload

systemctl enable pdns
systemctl start pdns
else
echo "Warning: pdns already install"
fi

# Copyright © 2019 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

if [ "`systemctl is-active postgresql-9.6`" != "active" ]
then
cd /tmp
wget https://download.postgresql.org/pub/repos/yum/9.6/redhat/rhel-7-x86_64/pgdg-centos96-9.6-3.noarch.rpm
rpm -i pgdg-centos96-9.6-3.noarch.rpm
yum -y install postgresql96 postgresql96-server postgresql96-lib postgresql96-contrib
/usr/pgsql-9.6/bin/postgresql96-setup initdb
systemctl enable postgresql-9.6

sed -i "s/local   all             all                                     peer/local   all             postgres                                     ident/g" /var/lib/pgsql/9.6/data/pg_hba.conf
sed -i "s/host    all             all             127.0.0.1\/32            ident/host    all             all             127.0.0.1\/32            md5/g" /var/lib/pgsql/9.6/data/pg_hba.conf
sed -i "s/host    all             all             ::1\/128                 ident/#host    all             all             ::1\/128                 reject/g" /var/lib/pgsql/9.6/data/pg_hba.conf

systemctl start postgresql-9.6
else
echo "Warning: postgresql-9.6 already install"
fi

# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

yum install postgresql-server postgresql
systemctl enable postgresql
postgresql-setup initdb
sed -i "s/local   all             all                                     peer/local   all             postgres                                     ident/g" /var/lib/pgsql/data/pg_hba.conf
sed -i "s/host    all             all             127.0.0.1\/32            ident/host    all             all             127.0.0.1\/32            md5/g" /var/lib/pgsql/data/pg_hba.conf
sed -i "s/host    all             all             ::1\/128                 ident/#host    all             all             ::1\/128                 reject/g" /var/lib/pgsql/data/pg_hba.conf
sed -i "s/#listen_addresses = 'localhost'$(printf '\t\t')# what IP address(es) to listen on;/listen_addresses = '127.0.0.1'$(printf '\t\t')# what IP address(es) to listen on;/g" /var/lib/pgsql/data/postgresql.conf
systemctl start postgresql

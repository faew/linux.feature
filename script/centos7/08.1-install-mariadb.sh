# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

yum install mariadb-server
systemctl enable mariadb
systemctl start mariadb
mysql_secure_installation


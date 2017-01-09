# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

yum install postgresql-libs
yum install unixODBC
rpm -i http://sphinxsearch.com/files/sphinx-2.2.11-1.rhel7.x86_64.rpm
systemctl start searchd
systemctl enable searchd
echo "Configuration: /etc/sphinx/sphinx.conf"

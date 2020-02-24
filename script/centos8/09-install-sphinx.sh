# Copyright © 2020 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

if [ "`systemctl is-active searchd`" != "active" ]
then
yum -y install sphinx
systemctl start searchd
systemctl enable searchd
echo "Configuration: /etc/sphinx/sphinx.conf"
else 
echo "Warning: sphinx already install" 
fi

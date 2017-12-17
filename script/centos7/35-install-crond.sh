# Copyright © 2017 Feature.su. All rights reserved. 
# Licensed under the Apache License, Version 2.0 

if [ "`systemctl is-active crond`" != "active" ]
then
yum -y install cronie
systemctl start crond
systemctl enable crond
else
echo "Warning: crond already install"
fi

# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

if [ "`systemctl is-active chronyd`" != "active" ] 
then
yum -y install chrony
systemctl enable chronyd
systemctl start chronyd
else
echo "Warning: chronyd already install"
fi

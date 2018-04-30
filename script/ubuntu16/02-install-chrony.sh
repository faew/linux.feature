# Copyright © 2018 Feature.su. All rights reserved. 
# Licensed under the Apache License, Version 2.0  

if [ "`systemctl is-active chrony`" != "active" ]
then
apt-get -y install chrony
systemctl enable chrony
systemctl start chrony
else
echo "Warning: chrony already install"
fi

# Copyright © 2017 Feature.su. All rights reserved. 
# Licensed under the Apache License, Version 2.0 

if [ "`systemctl is-active docker`" != "active" ]
then
curl -fsSL https://get.docker.com/ | sh
systemctl start docker
systemctl enable docker
reboot
else
echo "Warning: docker already install"
fi

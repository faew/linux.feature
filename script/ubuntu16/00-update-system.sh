# Copyright © 2018 Feature.su. All rights reserved. 
# Licensed under the Apache License, Version 2.0  

apt-get -y update

mkdir /etc/linux.feature
chmod 700 /etc/linux.feature

mkdir /var/backup
chmod 700 /var/backup

mkdir /iso/

reboot

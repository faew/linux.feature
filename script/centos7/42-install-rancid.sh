# Copyright © 2018 Feature.su. All rights reserved
# Licensed under the Apache License, Version 2.0 

if ! [ -d /usr/local/rancid/ ] 
then
yum -y install gcc expect cvs rcs
cd /tmp
ftp://ftp.shrubbery.net/pub/rancid/rancid-3.7.tar.gz
tar -xvzf ./rancid-3.7.tar.gz
cd rancid-3.7
./configure --prefix=/usr/local/rancid
make
make install
useradd rancid -c "Networking Backups" -d /usr/local/rancid
chown -R rancid:rancid /usr/local/rancid/
else
echo "Rancid already install"; 
fi

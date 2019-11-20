# Copyright © 2019 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

if ! [ -d /usr/local/mgr5 ]
then
yum -y install fcgi jsoncpp libetpan libxslt ntp qrencode postgresql-libs
cd /tmp
wget http://mirrors.download.ispsystem.com/repo/centos/base/7/x86_64/libmicrohttpd-isp-0.9.48-2.el7.centos.x86_64.rpm
rpm -i libmicrohttpd-isp-0.9.48-2.el7.centos.x86_64.rpm
wget http://mirrors.download.ispsystem.com/repo/centos/5.227/7/x86_64/coremanager-5.227.0-1.el7.centos.x86_64.rpm
rpm -i coremanager-5.227.0-1.el7.centos.x86_64.rpm
else
echo "Coremanager exists";
fi

# Copyright © 2017 Feature.su. All rights reserved. 
# Licensed under the Apache License, Version 2.0 

# https://github.com/ikus060/rdiffweb
# http://www.patrikdufresne.com/en/rdiffweb/

yum -y install rdiff-backup rsync wget
yum -y install cifs-utils python-devel
yum -y install python-pysqlite2
yum -y groupinstall "Development Tools"
yum -y python-devel sqlite-devel python-setuptools python-babel

cd /tmp
wget --no-check-certificate -O rdiffweb.tar.gz https://github.com/ikus060/rdiffweb/archive/master.tar.gz
tar zxf rdiffweb.tar.gz
cd rdiffweb-master
python setup.py install

mkdir -p /etc/rdiffweb
cp rdw.conf /etc/rdiffweb/
cp extras/systemd/rdiffweb.service /etc/systemd/system/
sed -i "s/\/local//g" /etc/systemd/system/rdiffweb.service
systemctl enable rdiffweb
systemctl start rdiffweb

firewall-cmd --zone=public --add-port=8080/tcp  --permanent
firewall-cmd --reload

echo "http://server_ip:8080"
echo "username : admin"
echo "password : admin123"

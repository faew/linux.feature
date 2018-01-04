# Copyright © 2018 Feature.su. All rights reserved. 
# Licensed under the Apache License, Version 2.0 

oinkcode="you personal code from https://www.snort.org"

cd /tmp
yum -y install https://www.snort.org/downloads/snort/snort-2.9.11-1.centos7.x86_64.rpm

if [ -d /etc/snort ]
then
cd /etc/snort
wget https://www.snort.org/rules/snortrules-snapshot-29110.tar.gz?oinkcode=$oinkcode -O snortrules-snapshot-29110.tar.gz
tar -xvzf ./snortrules-snapshot-29110.tar.gz
rm -f snortrules-snapshot-29110.tar.gz
sed -i "s/INTERFACE=eth0/INTERFACE=`basename -a /sys/class/net/* | grep -v lo | tail -n 1`/g" /etc/sysconfig/snort
sed -i "s/ipvar HOME_NET any/ipvar HOME_NET `ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1' | tail -n 1`\/32/g" /etc/snort/snort.conf
sed -i "s/dynamicdetection directory \/usr\/local\/lib\/snort_dynamicrules/dynamicdetection directory \/etc\/snort\/so_rules/g" /etc/snort/snort.conf
sed -i "s/var WHITE_LIST_PATH \.\.\/rules/var WHITE_LIST_PATH \.\/rules/g" /etc/snort/snort.conf
sed -i "s/var BLACK_LIST_PATH \.\.\/rules/var BLACK_LIST_PATH \.\/rules/g" /etc/snort/snort.conf
touch /etc/snort/rules/white_list.rules
touch /etc/snort/rules/black_list.rules
touch /etc/snort/rules/local.rules
chown -R root:root /etc/snort
ln -s /usr/lib64/libdnet.so.1.0.1 /usr/lib64/libdnet.1
systemctl start snortd
systemctl enable snortd
else
echo "Warning: snort NOT install" 
fi 

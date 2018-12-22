# Copyright © 2018 Feature.su. All rights reserved. 
# Licensed under the Apache License, Version 2.0 

if [ "`systemctl is-active lighttpd`" != "active" ]
then

yum -y install lighttpd

sed -i "s/Listen 0.0.0.0:80/Listen 0.0.0.0:81/g" /etc/httpd/conf/httpd.conf
sed -i "s/:80/:81/g" /etc/httpd/conf.modules.d/10-vhost.conf
sed -i "s/KeepAlive On/KeepAlive Off/g" /etc/httpd/conf.modules.d/10-vhost.conf

sed -i "s/server.use-ipv6 = \"enable\"/server.use-ipv6 = \"disable\"/g" /etc/lighttpd/lighttpd.conf
echo "" >> /etc/lighttpd/lighttpd.conf
echo "include \"conf.d/proxy.conf\"" >> /etc/lighttpd/lighttpd.conf

echo "" >> /etc/lighttpd/conf.d/proxy.conf
echo "proxy.server = ( \"\" =>  ( \"first\" =>  (\"host\" => \"127.0.0.1\",  \"port\" => 81 )  ) )" >> /etc/lighttpd/conf.d/proxy.conf

systemctl enable lighttpd

systemctl restart httpd
systemctl start lighttpd

else
echo "Warning: lighttpd already install"
fi

# static folder 

#/etc/lighttpd/conf.d/proxy.conf
# $HTTP["host"] =~ "^.*site.ru$" {
# $HTTP["url"] =~ "^/(upload)/.*$" {
# proxy.server = ()
# }
# }

# /etc/fstab
# mount -a
# /var/www/site.ru/project/html/web/upload /var/www/lighttpd/upload  none bind

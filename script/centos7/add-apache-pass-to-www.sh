# Copyright © 2019 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

if [ -z $3  ]
then
echo "Usage for create apache password: sh add-apache-pass-to-www.sh domain.name.without.www user pass"
else
    if [ -d /var/www/$1 ]
    then
    mkdir -p /etc/httpd/htpasswd/
    htpasswd -b -c /etc/httpd/htpasswd/$1 $2 $3
    chmod 600 /etc/httpd/htpasswd/$1
    chown $1:$1 /etc/httpd/htpasswd/$1
    echo "Use VHostHtpasswd $1 html/web" >> /etc/httpd/conf.modules.d/11-domains.conf
    systemctl reload httpd
    else
    echo "Domain $1 NOT exists";
    fi
fi

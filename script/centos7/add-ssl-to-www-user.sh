# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

if [ -z $1  ]
then
echo "Usage for create web user: sh add-ssl-to-www-user.sh domain.name.without.www"
else
    if [ -d /var/www/$1 ]
    then
    /usr/bin/certbot certonly --webroot -d $1 --webroot-path /var/www/$1/project/html/web
    echo "Use VHostSSLetsencrypt $1 $1 html/web" >> /etc/httpd/conf.modules.d/11-domains.conf
    systemctl reload httpd
    else
    echo "Domain $1 NOT exists";
    fi
fi

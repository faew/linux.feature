# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

if [ -z $1  ]
then
echo "Usage for create web user: sh add-www-user.sh domain.name.without.www"
else
    if ! [ -d /var/www/$1 ]
    then
    useradd -d /var/www/$1 $1
    mkdir -p /var/www/$1/htdocs
    mkdir -p /var/www/$1/tmp
    chown -R $1:$1 /var/www/$1
    chmod 750 /var/www/$1/htdocs
    chmod 750 /var/www/$1/tmp
    echo "Use VHost $1" >> /etc/httpd/conf.modules.d/11-domains.conf
    systemctl reload httpd
    else
    echo "Domain $1 exists";
    fi
fi

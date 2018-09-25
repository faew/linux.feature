# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

if [ -z $1  ]
then
echo "Usage for create web user: sh add-www-user.sh domain.name.without.www"
else
    if ! [ -d /var/www/$1 ]
    then
    useradd -d /var/www/$1 $1
    mkdir -p /var/www/$1/project/html/web
    mkdir -p /var/www/$1/tmp
    chown -R $1:$1 /var/www/$1
    chmod 750 /var/www/$1/project
    chmod 750 /var/www/$1/tmp
    chcon -R -t tmp_t /var/www/$1/tmp
    chcon -R -t httpd_sys_rw_content_t /var/www/$1/project
    echo "Use VHost $1" >> /etc/httpd/conf.modules.d/11-domains.conf
    systemctl reload httpd
    PASS=`pwgen 12 1`
    echo -n $PASS | passwd --stdin $1
    echo -n $PASS
    else
    echo "Domain $1 exists";
    fi
fi

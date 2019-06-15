# Copyright © 2018 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

if [ -z $1  ]
then
echo "Usage for create external import: sh add-import-user-nologin.sh main.domain.name.without.www"
else
    if [ -d /var/www/$1 ]
    then
        if ! [ -d /var/www/$1/html/web/import ]
        then
        mkdir -p /var/www/$1/project/html/web/import
        chown -R $1:$1 /var/www/$1/project/html/web/import
        useradd -s /sbin/nologin import.$1
        mkdir -p /home/import.$1/project/import/
        chown -R import.$1:import.$1 /home/import.$1/import/
        chcon -R -t httpd_sys_rw_content_t /home/import.$1/import/
        echo "" >> /etc/fstab
        echo "/home/import.$1/import/    /var/www/$1/project/html/web/import    none    bind" >> /etc/fstab
        mount -a
        PASS=`pwgen 12 1`
        echo -n $PASS | passwd --stdin import.$1
        echo -n $PASS
        else
        echo "Folder domain /var/www/$1/project/html/web/import exists";
        fi
    else
    echo "Main domain $1 NOT exists";
    fi
fi

# Copyright © 2020 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

if [ -z $1  ]
then
echo "Add php-cgi to web user: sh add-php-cgi-to-user.sh domain.name.without.www"
else
    if [ -d /var/www/$1 ]
    then
    mkdir -p /var/www/$1/php-cgi
    echo "#!/usr/local/php54/bin/php-cgi" > /var/www/$1/php-cgi/php
    chown -R $1:$1 /var/www/$1
    chmod 750 /var/www/$1/php-cgi
    chmod 700 /var/www/$1/php-cgi/php
    chcon -t httpd_sys_script_exec_t /var/www/$1/php-cgi/php
    else
    echo "Domain $1 not exists";
    fi
fi

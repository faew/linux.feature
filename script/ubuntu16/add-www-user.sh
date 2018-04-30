# Copyright © 2018 Feature.su. All rights reserved. 
# Licensed under the Apache License, Version 2.0  

if [ -z $1  ]
then
echo "Usage for create web user: sh add-www-user.sh domain.name.without.www"
else
 if ! [ -d /var/www/$1 ]
 then
 useradd -d /var/www/$1 $1
 mkdir -p /var/www/$1/html/web
 mkdir -p /var/www/$1/tmp
 chown -R $1:$1 /var/www/$1
 chmod 750 /var/www/$1/html
 chmod 750 /var/www/$1/tmp
 echo "Use VHost $1" >> /etc/apache2/sites-available/$1.conf
 a2ensite $1
 systemctl reload apache2
 PASS=`pwgen 12 1`
 echo "$1:$PASS" | /usr/sbin/chpasswd
 echo -n $PASS
 else
 echo "Domain $1 exists";
 fi
fi

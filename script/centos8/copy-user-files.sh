# Copyright © 2020 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

if [ -z $1 ]
then
echo "Copy user files: sh cp-user-files.sh from.server domain.name.without.www"
else
    if [ -z $2 ]
    then
    echo "User not set.";
    else
    sh add-www-user.sh $2
    rsync -riz --links --delete $1:/var/www/$2/project/ /var/www/$2/project/
    chown -R $2:$2 /var/www/$2/project
    chcon -R -t httpd_sys_rw_content_t /var/www/$2/project
    fi
fi

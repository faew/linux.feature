# Copyright © 2018 Feature.su. All rights reserved. 
# Licensed under the Apache License, Version 2.0  

if [ -z $1  ]
then
echo "Usage for demo yii: sh demo-yii2.sh domain.name.without.www"
else
 if [ -d /var/www/$1 ]
 then
 cd /var/www/$1/project/html/web
 wget https://github.com/yiisoft/yii2/releases/download/2.0.15/yii-basic-app-2.0.15.tgz
 tar -xvzf yii-basic-app-2.0.15.tgz
 mkdir vendor
 cp -R /var/www/$1/project/html/web/basic/vendor/yiisoft /var/www/$1/project/html/web/vendor
 cp -R /var/www/$1/project/html/web/basic/requirements.php /var/www/$1/project/html/web/requirements.php
 rm -f -R /var/www/$1/project/html/web/basic
 rm -f /var/www/$1/project/html/web/yii-basic-app-2.0.15.tgz
 chown -R $1:$1 /var/www/$1/project/html/web
 else
 echo "Domain NOT $1 exists";
 fi
fi

# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

cd /var/www/empty.local/project/html/web/
wget https://files.phpmyadmin.net/phpMyAdmin/4.4.15.10/phpMyAdmin-4.4.15.10-english.tar.gz
tar -xvzf ./phpMyAdmin-4.4.15.10-english.tar.gz
rm -f phpMyAdmin-4.4.15.10-english.tar.gz
FOLDER=`pwgen -A 7 1`
mv phpMyAdmin-4.4.15.10-english pma-$FOLDER
cd pma-$FOLDER
rm -f -R setup
cp config.sample.inc.php config.inc.php
sed -i "s/blowfish_secret'] = ''/blowfish_secret'] = '`pwgen 64 1`'/g" ./config.inc.php
cd ..
chown -R empty.local:empty.local pma-$FOLDER

echo "Open http://MAIN-IP/pma-$FOLDER"

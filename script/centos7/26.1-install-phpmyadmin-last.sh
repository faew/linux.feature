# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

cd /var/www/empty.local/project/html/web/
wget https://files.phpmyadmin.net/phpMyAdmin/4.8.5/phpMyAdmin-4.8.5-english.tar.gz
tar -xvzf ./phpMyAdmin-4.8.5-english.tar.gz
rm -f ./phpMyAdmin-4.8.5-english.tar.gz
mv phpMyAdmin-4.8.5-english pma-`pwgen -A 12 1`
cd pma-*
rm -f -R setup
cp config.sample.inc.php config.inc.php
sed -i "s/blowfish_secret'] = ''/blowfish_secret'] = '`pwgen 64 1`'/g" ./config.inc.php
cd ..
cd ..
chown -R empty.local:empty.local ./web
echo "Open http://MAIN-IP/`ls -1 /var/www/empty.local/project/html/web/ | grep "pma-" | tail -n 1`"

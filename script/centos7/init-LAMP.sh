# Copyright © 2018 Feature.su. All rights reserved. 
# Licensed under the Apache License, Version 2.0 
  
sh 00-update-system.sh
sh 01-install-utils.sh
sh 02-install-chrony.sh
sh 03-enable-firewall.sh
sh 04-install-fail2ban.sh
sh 05-install-apache.sh
sh 05.1-install-apache-ssl.sh
sh 06-install-devel.sh
sh 08-install-mysql.sh
sh 30-compile-icu.sh
sh 30-compile-php-7.1.sh
sh 30.2-imagick-php-7.1.sh
sh 35-install-crond.sh
sh 09-install-sphinx.sh
sh 10-install-redis.sh

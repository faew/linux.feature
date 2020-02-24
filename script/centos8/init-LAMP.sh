# Copyright © 2020 Feature.su. All rights reserved. 
# Licensed under the Apache License, Version 2.0 
  
sh 00-update-system.sh
sh 00.1-add-swap-file.sh
sh 01-install-utils.sh
sh 02-install-chrony.sh
sh 03-enable-firewall.sh
sh 04-install-fail2ban.sh
sh 05-install-apache.sh
sh 05.1-install-apache-ssl.sh
sh 07-install-php.sh
sh 08-install-mysql.sh
sh 09-install-sphinx.sh
sh 10-install-redis.sh
sh 35-install-crond.sh
sh 50-install-rdiff-backup.sh

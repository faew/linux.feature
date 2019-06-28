# Copyright © 2019 Feature.su. All rights reserved.  
# Licensed under the Apache License, Version 2.0   
#!/bin/sh

whiptail --yesno --fb  --yes-button Start --no-button Exit "Linux.Feature $1" 10 50
exitstatus=$?
if [ $exitstatus != 0 ]; then
exit 1
else
    if [ ! -d "/etc/linux.feature" ]; then
        cd ..
        sh 00.1-add-swap-file.sh
        sh 00-update-system.sh
        sh 01-install-utils.sh
        sh 06-install-devel.sh
        sh 02-install-chrony.sh
        sh 03-enable-firewall.sh
        sh 04-install-fail2ban.sh
        cd GUI
    fi
fi


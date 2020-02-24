# Copyright © 2020 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

if [ `grep SwapFree /proc/meminfo | awk '{print $2}'` -eq "0" ]; then
    if ! [ -f /swapfile ]; then
    dd if=/dev/zero of=/swapfile bs=1M count=1024
    chown root:root /swapfile
    chmod 0600 /swapfile
    mkswap /swapfile
    swapon /swapfile
    echo "/swapfile swap swap defaults 0 0" >> /etc/fstab
    else
    echo "Warning: swapfile already exists"
    fi
fi

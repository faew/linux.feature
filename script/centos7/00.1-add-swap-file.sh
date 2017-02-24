# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0


dd if=/dev/zero of=/swapfile bs=1M count=1024
chown root:root /swapfile
chmod 0600 /swapfile
mkswap /swapfile
swapon /swapfile
echo "/swapfile swap swap defaults 0 0" >> /etc/fstab

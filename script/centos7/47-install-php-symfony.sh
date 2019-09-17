# Copyright © 2019 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

cd /usr/local/bin
wget -O symfony https://github.com/symfony/cli/releases/download/v4.7.0/symfony_linux_amd64
chmod 755 symfony
cd /tmp
echo "Exec: symfony"

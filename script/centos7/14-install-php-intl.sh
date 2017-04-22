# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

cd /tmp
wget http://download.icu-project.org/files/icu4c/58.2/icu4c-58_2-src.tgz
tar -xvzf ./icu4c-58_2-src.tgz
cd /tmp/icu/source
./configure
make
make install
cd /tmp
echo "" | pecl install intl
echo 'extension=intl.so' > /etc/php.d/intl.ini
echo "Delete temp files /tmp/icu"

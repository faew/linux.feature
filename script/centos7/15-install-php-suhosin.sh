# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

sh 06-install-devel.sh

cd /tmp
wget https://download.suhosin.org/suhosin-0.9.38.tar.gz
tar -xvzf ./suhosin-0.9.38.tar.gz
cd suhosin-0.9.38
phpize
./configure
make
make install
echo 'extension=suhosin.so' > /etc/php.d/suhosin.ini
echo "Delete temp files /tmp/suhosin-0.9.38"

# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0 

cd /tmp
wget http://download.icu-project.org/files/icu4c/64.2/icu4c-64_2-src.tgz
tar -xvzf ./icu4c-64_2-src.tgz
cd /tmp/icu/source
./configure
make
make install

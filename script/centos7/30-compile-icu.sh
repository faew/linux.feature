# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0 

cd /tmp
wget https://github.com/unicode-org/icu/releases/download/release-64-2/icu4c-64_2-src.tgz
tar -xvzf ./icu4c-64_2-src.tgz
cd /tmp/icu/source
./configure
make
make install

# Copyright © 2020 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

cd /tmp
git clone https://github.com/faew/openssl-gost2012.git
./config shared --prefix=/usr/local/gost --openssldir=/usr/local/gost
make all
make install

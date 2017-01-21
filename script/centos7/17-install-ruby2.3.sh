# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

sh 06-install-devel.sh

cd /tmp
wget https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.3.tar.bz2
tar -xvjf ruby-2.3.3.tar.bz2
cd /tmp/ruby-2.3.3
./configure
make
make install

gem update --system
gem update

gem install rails


ruby -v

echo "Bin folder:  /usr/local/bin"
echo "Delete temp files /tmp/ruby-2.3.3"

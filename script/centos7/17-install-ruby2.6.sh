# Copyright © 2019 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0


cd /tmp
wget https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.2.tar.gz
tar -xvzf ruby-2.6.2.tar.gz
cd /tmp/ruby-2.6.2
./configure
make
make install

gem update --system
gem update

gem install rails
gem install bundler
gem install passenger -v 5.3.7

ruby -v

echo "Bin folder:  /usr/local/bin"
echo "Delete temp files /tmp/ruby-2.6.2"

# Warning: Compile if more 1Gb RAM free

cd /usr/local/lib/ruby/gems/2*/gems/passenger-*/bin
echo "" | ./passenger-install-apache2-module

cd /usr/local/lib/ruby/gems/2*/gems/passenger-*
path=`pwd`

echo "LoadModule passenger_module $path/buildout/apache2/mod_passenger.so
<IfModule mod_passenger.c>
PassengerRoot $path
PassengerDefaultRuby /usr/local/bin/ruby
</IfModule>" > /etc/httpd/conf.d/passenger.conf

cd /tmp
wget https://raw.githubusercontent.com/faew/linux.feature/master/patch/passenger_local.te
checkmodule -M -m -o passenger_local.mod passenger_local.te
semodule_package -o passenger_local.pp -m passenger_local.mod
semodule -i passenger_local.pp

systemctl reload httpd

# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

sh 06-install-devel.sh

cd /tmp
wget https://www.python.org/ftp/python/3.5.3/Python-3.5.3.tgz
tar -xvzf Python-3.5.3.tgz
cd /tmp/Python-3.5.3
./configure
make
make install

pip3.5 install virtualenv

python3.5 -V
pip3.5 -V

echo "Delete temp files /tmp/Python-3.5.3"
echo "Bin folder: /usr/local/bin"
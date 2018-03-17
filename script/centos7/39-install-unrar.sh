# Copyright © 2018 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

cd /tmp
wget https://www.rarlab.com/rar/rarlinux-x64-5.5.0.tar.gz
tar -zxvf rarlinux-x64-5.5.0.tar.gz
cd rar
cp unrar /usr/local/bin
cd ..
rm -R -f ./rar
rm -f rarlinux-x64-5.5.0.tar.gz

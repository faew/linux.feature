# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

yum -y install ImageMagick-devel
echo "" | pecl install imagick-3.4.1
echo 'extension=imagick.so' > /etc/php.d/imagick.ini

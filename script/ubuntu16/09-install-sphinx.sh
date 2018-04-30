# Copyright © 2018 Feature.su. All rights reserved. 
# Licensed under the Apache License, Version 2.0  

apt-get -y install sphinxsearch
systemctl start sphinxsearch
systemctl enable sphinxsearch
echo "Configuration: /etc/sphinxsearch/sphinx.conf"

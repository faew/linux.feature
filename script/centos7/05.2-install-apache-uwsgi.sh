# Copyright © 2019 Feature.su. All rights reserved.  
# Licensed under the Apache License, Version 2.0   

if [ ! -f "/etc/httpd/modules/mod_proxy_uwsgi.so" ]; then 
    yum -y install mod_proxy_uwsgi
    echo "LoadModule proxy_uwsgi_module modules/mod_proxy_uwsgi.so" >> /etc/httpd/conf.modules.d/00-proxy.conf
    systemctl restart httpd
else
    echo "Warning: mod_proxy_uwsgi already install"
fi

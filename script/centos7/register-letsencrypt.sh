# Copyright © 2019 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

if [ -z $1  ]
then
echo "Usage for create account Letsencrypt: sh register-letsencrypt.sh admin@example.com"
else
    if ! [ -d /etc/letsencrypt/accounts ]
    then
    certbot register --non-interactive --agree-tos -m $1
    else
    echo "account Letsencrypt exists";
    fi
fi

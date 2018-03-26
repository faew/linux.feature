# Copyright © 2018 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

if [ -z $1  ]
then
echo "Usage for create certificate: sh self-signed-ssl.sh domain.name"
else
openssl req -x509 -nodes -newkey rsa:2048 -days 365 -keyout /tmp/$1.key -out /tmp/$1.crt -subj /C=/ST=/L=/O=/CN=$1
cat /tmp/$1.key /tmp/$1.crt > /tmp/$1.pem
openssl x509 -outform der -in /tmp/$1.crt -out /tmp/$1.cer
cat /tmp/$1.pem
fi

# Copyright © 2017 Feature.su. All rights reserved. 
# Licensed under the Apache License, Version 2.0 

# /etc/postfix/mydomains.list - list mail domains
# /etc/postfix/virtual - list map mail->user

if [ ! -f /etc/postfix/mydomains.list ]; then
    yum -y install postfix
    sed -i "s/\#myhostname = host.domain.tld/myhostname = `hostname`/g" /etc/postfix/main.cf
    sed -i "s/inet_interfaces = localhost/inet_interfaces = all/g" /etc/postfix/main.cf
    sed -i "s/mydestination = \$myhostname, localhost.\$mydomain, localhost/mydestination = \$myhostname, localhost/g" /etc/postfix/main.cf
    sed -i "s/\#home_mailbox = Maildir\//home_mailbox = Maildir\//g" /etc/postfix/main.cf
    sed -i "s/\#mynetworks = 168.100.189.0\/28, 127.0.0.0\/8/mynetworks = 127.0.0.0\/8/g" /etc/postfix/main.cf
    echo "" >> /etc/postfix/main.cf
    echo "message_size_limit = 10485760" >> /etc/postfix/main.cf
    echo "mailbox_size_limit = 1073741824" >> /etc/postfix/main.cf
    echo "smtpd_sasl_type = dovecot" >> /etc/postfix/main.cf
    echo "smtpd_sasl_path = private/auth" >> /etc/postfix/main.cf
    echo "smtpd_sasl_auth_enable = yes" >> /etc/postfix/main.cf
    echo "smtpd_sasl_security_options = noanonymous" >> /etc/postfix/main.cf
    echo "smtpd_sasl_local_domain = \$myhostname" >> /etc/postfix/main.cf
    echo "smtpd_recipient_restrictions = permit_mynetworks,permit_auth_destination,permit_sasl_authenticated,reject" >> /etc/postfix/main.cf
    echo -n "" > /etc/postfix/mydomains.list
    chmod 600 /etc/postfix/mydomains.list
    postmap /etc/postfix/virtual
    echo "virtual_alias_domains = /etc/postfix/mydomains.list" >> /etc/postfix/main.cf
    echo "virtual_alias_maps = hash:/etc/postfix/virtual" >> /etc/postfix/main.cf
    systemctl restart postfix
    systemctl enable postfix
    
    yum -y install dovecot
    sed -i "s/\#protocols = imap pop3 lmtp/protocols = imap pop3 lmtp/g" /etc/dovecot/dovecot.conf
    sed -i "s/\#listen = \*, \:\:/listen = */g" /etc/dovecot/dovecot.conf
    sed -i "s/\#disable_plaintext_auth = yes/disable_plaintext_auth = no/g" /etc/dovecot/conf.d/10-auth.conf
    sed -i "s/auth_mechanisms = plain/auth_mechanisms = plain login/g" /etc/dovecot/conf.d/10-auth.conf
    sed -i "s/\#mail_location = /mail_location = maildir:\~\/Maildir/g" /etc/dovecot/conf.d/10-mail.conf
    sed -i "s/\# Postfix smtp-auth/\# Postfix smtp-auth\nunix_listener \/var\/spool\/postfix\/private\/auth \{\nmode = 0666\nuser = postfix\ngroup = postfix\n\}\n/g" /etc/dovecot/conf.d/10-master.conf
    systemctl restart dovecot
    systemctl enable dovecot
    
    firewall-cmd --zone=public --permanent --add-service=smtp
    firewall-cmd --zone=public --permanent --add-service=imap
    firewall-cmd --reload
else
echo "Warning: postfix already init" 
fi

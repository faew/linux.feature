# Copyright © 2019 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0
#!/bin/sh

sh welcome.sh DNS
exitstatus=$?
if [ $exitstatus != 0 ]; then
exit
fi

if [ "`systemctl is-active named-chroot`" != "active" ]; then

    whiptail --yesno --fb  "Install DNS named ?" 10 50
    exitstatus=$?
    if [ $exitstatus != 0 ]; then
    exit
    fi
    cd ..
    sh 32-install-named-as-master.sh
    cd GUI
else

ACTION=$(whiptail --menu --fb --notags "DNS Server" 20  50 10  \
        "LIST" "List park domains" \
        "CREATE" "Creare park new domain" \
        "DELETE" "Delete domain name"  3>&1 1>&2 2>&3)
exitstatus=$?
    if [ $exitstatus = 0 ]; then
        case $ACTION in
        CREATE)
        DOMAIN=$(whiptail --inputbox --fb "DNS new domain" 10 50  3>&1 1>&2 2>&3)
        exitstatus=$?
            if [ $exitstatus = 0 ]; then
                if [ "$DOMAIN" != "" ]; then
                    if [ ! -f "/var/named/data/$DOMAIN.db" ]; then
                    MYHOST=`hostname`
                    SERIAL=`date +%Y%m%H%M`
                    
                    # Simple dns zone template 
                    echo "\$TTL 3600" > /var/named/data/$DOMAIN.db
                    echo "$DOMAIN. IN SOA $MYHOST. hostmaster.$DOMAIN. ( $SERIAL 10800 3600 604800 86400 )" >> /var/named/data/$DOMAIN.db
                    echo "$DOMAIN. IN NS $MYHOST." >> /var/named/data/$DOMAIN.db
                    echo "localhost IN A 127.0.0.1" >> /var/named/data/$DOMAIN.db
                    
                    echo "zone \"$DOMAIN\" { type master; file \"/var/named/data/$DOMAIN.db\"; };" >> /etc/named.conf
                    rndc reconfig
                    whiptail --fb --msgbox "Domain add" 10 50
                    else
                    whiptail --fb --msgbox "Domain is exist" 10 50
                    exit
                    fi
                else
                whiptail --fb --msgbox "Domain is empty" 10 50
                exit
                fi
            fi
        ;;
        LIST|DELETE)
        DOMAINS=$(cat /etc/named.conf | grep "zone " | grep "{" | grep "};" | sort)
        if [ "$DOMAINS" = "" ]; then
            whiptail --fb --msgbox "No existing domains" 20 50
            exit
        else
            DOMAINS=$(echo "$DOMAINS" | awk -F"\"" '{print $2," ",$2}' | xargs)
            DOMAIN=$(whiptail --menu --fb --notags --ok-button Edit "DNS Server - parked domains" 20  50 10 $DOMAINS 3>&1 1>&2 2>&3)
            exitstatus=$?
            if [ $exitstatus = 0 ]; then
                if [ "$ACTION" != "DELETE" ]; then
                    vi /var/named/data/$DOMAIN.db
                    rndc reload $DOMAIN
                else
                    DELME=$(whiptail --inputbox --fb  "DESTROY DNS zone $DOMAIN ?" 10 50 "type destroy up case" 3>&1 1>&2 2>&3)
                    exitstatus=$?
                        if [ $exitstatus = 0 ]; then
                            if [ "$DELME" = "DESTROY" ]; then
                                rm -f /var/named/data/$DOMAIN.db
                                cp -f /etc/named.conf /etc/named.conf.lf
                                cat /etc/named.conf.lf | grep -v $DOMAIN > /etc/named.conf
                                rndc reconfig
                                whiptail --fb --msgbox "Domain delete" 10 50
                            fi
                        fi
                fi
            fi
        fi
        esac
    fi
fi


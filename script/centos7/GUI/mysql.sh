# Copyright © 2019 Feature.su. All rights reserved.  
# Licensed under the Apache License, Version 2.0   
#!/bin/sh

sh welcome.sh MySQL
exitstatus=$?
if [ $exitstatus != 0 ]; then
exit
fi

if [ "`systemctl is-active mysqld`" != "active" ]; then

    whiptail --yesno --fb  "Install MySQL ?" 10 50
    exitstatus=$?
    if [ $exitstatus != 0 ]; then
    exit
    fi
    cd ..
    sh 08-install-mysql.sh
    cd GUI
else

ACTION=$(whiptail --menu --fb --notags "MySQL Server" 20  50 10  \
        "LIST" "Change MySQL user password" \
        "CREATE" "Add MySQL User and database" \
        "DELETE" "Delete user and data from database" \
        "RPASS" "Recovery root password" 3>&1 1>&2 2>&3)
exitstatus=$?
    if [ $exitstatus = 0 ]; then
        case $ACTION in
        CREATE)
        mysqlUser=$(whiptail --inputbox --fb "MySQL new username" 10 50  3>&1 1>&2 2>&3)
        exitstatus=$?
            if [ $exitstatus = 0 ]; then
            PASS=$(whiptail --inputbox --fb "MySQL password for $mysqlUser" 10 50 `pwgen -y 12 1` 3>&1 1>&2 2>&3)
            exitstatus=$?
                if [ $exitstatus = 0 ]; then
                mysql --silent -u root -p`cat /etc/linux.feature/mysql-pwd`  <<_EOF1_
                CREATE USER $mysqlUser@'%' IDENTIFIED BY '$PASS' WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;
                CREATE DATABASE IF NOT EXISTS $mysqlUser;
                GRANT ALL PRIVILEGES ON $mysqlUser.* TO $mysqlUser@'%';
                FLUSH PRIVILEGES;
_EOF1_
                echo $PASS
                fi
            fi
        ;;
        LIST|DELETE)
        mysqlUsers=$(echo "select distinct User from mysql.user;" | mysql -u root -p`cat /etc/linux.feature/mysql-pwd` 2>/dev/null | grep -v root | grep -v mysql | grep -v User | awk '{print $0," ",$0}'| xargs)
        if [ "$mysqlUsers" = "" ]; then
        whiptail --fb --msgbox "No existing users" 20 50
        exit
        fi
        mysqlUser=$(whiptail --menu --fb --notags "List MySQL Users/Databases" 30 90 17 $mysqlUsers  3>&1 1>&2 2>&3)
        exitstatus=$?
            if [ "$ACTION" != "DELETE" ]; then
                if [ $exitstatus = 0 ]; then
                PASS=$(whiptail --inputbox --fb "Change MySQL password for $mysqlUser" 10 50 `pwgen -y 12 1` 3>&1 1>&2 2>&3)
                    exitstatus=$?
                    if [ $exitstatus = 0 ]; then
                    echo "SET PASSWORD FOR $mysqlUser@'%' = PASSWORD('$PASS'); FLUSH PRIVILEGES;" | mysql --silent -u root -p`cat /etc/linux.feature/mysql-pwd`
                    echo $PASS
                    fi
                fi
            else
            DELME=$(whiptail --inputbox --fb  "DESTROY mysql user and database: $mysqlUser ?" 10 50 "type destroy up case" 3>&1 1>&2 2>&3)
            exitstatus=$?
                if [ $exitstatus = 0 ]; then
                    if [ "$DELME" = "DESTROY" ]; then
                    mysql --silent -u root -p`cat /etc/linux.feature/mysql-pwd` <<_EOF2_
                    DROP USER $mysqlUser;
                    DROP DATABASE $mysqlUser;
_EOF2_
                    fi
                fi
            fi
        ;;
        RPASS)
        whiptail --yesno --defaultno --fb  "Is it dangerous. To try ?" 10 50
        exitstatus=$?
        if [ $exitstatus != 0 ]; then
        exit
        fi

        systemctl stop mysqld
        mysqld --user=mysql --skip-grant-tables --skip-networking &
        sleep 5
        PASS=`pwgen -y 12 1`
        mysql -u root  <<_EOF_
        FLUSH PRIVILEGES;
        SET PASSWORD FOR root@'localhost' = PASSWORD('$PASS');
        FLUSH PRIVILEGES;
_EOF_
        killall mysqld
        systemctl start mysqld
        echo -n $PASS > /etc/linux.feature/mysql-pwd
        esac
    fi
fi

# linux.feature

Manage you server with small shell scripts.

## How to start ?

### Install CentOS 7 Core (minimal edition)

    yum update
    yum install git mc wget unzip
    cd /root
    git clone https://github.com/faew/linux.feature.git
    mc

### Setup In CentOS 7 Internet via proxy

#### Add into /etc/yum.conf
    
    proxy=http://IP:PORT
    proxy_username=User
    proxy_password=Password
    
#### Add into /etc/wgetrc

    use_proxy = on
    http_proxy=http://login:password@ip:port
    https_proxy=http://login:password@ip:port
    ftp_proxy=http://login:password@ip:port

#### Get scripts
    
    cd /root
    wget "https://github.com/faew/linux.feature/archive/master.zip"
    unzip master.zip
    mv linux.feature-master linux.feature
    rm -f master.zip

more information http://linux.feature.su/     

#!/bin/bash

source Components/common.sh
rm -f /tmp/roboshop.log
set-hostname redis
disable-auto-shutdown

HEAD "Setup Redis Repos"
yum install epel-release yum-utils  http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y &>>/tmp/roboshop.log && yum-config-manager --enable remi &>>/tmp/roboshop.log
STAT $?

HEAD "Install Redis "
yum install redis -y &>>/tmp/roboshop.log
STAT $?

HEAD "Update the address in Redis.config"
sed -i -e "s/127.0.0.1/0.0.0.0/" /etc/redis/redis.conf
STAT $?


#!/bin/bash

source Components/common.sh
rm -f /tmp/roboshop.log
set-hostname redis
disable-auto-shutdown

HEAD "Install Redis Repos"
yum install epel-release yum-utils  http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y &>>/tmp/roboshop.log && yum-config-manager --enable remi &>>/tmp/roboshop.log
STAT $?

yum install redis -y

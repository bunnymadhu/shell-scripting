#!/bin/bash

source Components/common.sh
rm -f /tmp/roboshop.log
disable-auto-shutdown

HEAD "Setup MongoDB Yum repo file\t\t"
echo '[mongodb-org-4.2]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/4.2/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-4.2.asc' >/etc/yum.repos.d/mongodb.repo
STAT $?

HEAD "Install MongoDB\t\t\t"
yum install -y mongodb-org &>>/tmp/roboshop.log
STAT $?

HEAD "Update IP Adress in MongoDB config file"
sed  -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf
STAT $?

HEAD "Start MongoDB service\t\t\t"
systemctl enable mongod &>>/tmp/roboshop.log
systemctl restart mongod &>>/tmp/roboshop.log
STAT $?

HEAD "Download Schema from Github\t\t"
curl -s -L -o /tmp/mongodb.zip "https://github.com/roboshop-devops-project/mongodb/archive/main.zip" &>>/tmp/roboshop.log
STAT $?

HEAD "Extract Downloaded Schema\t\t"
cd /tmp
unzip mongodb.zip &>>/tmp/roboshop.log
STAT $?

HEAD "Load Schema\t\t\t"
cd mongodb-main
mongo < catalogue.js &>>/tmp/roboshop.log && mongo < users.js &>>/tmp/roboshop.log
STAT $?


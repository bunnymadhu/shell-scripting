#!/bin/bash

source Components/common.sh
rm -f /tmp/roboshop.log
disable-auto-shutdown

HEAD "Insatlling Nodejs"
yum install nodejs make gcc-c++ -y &>>/tmp/roboshop.log
STAT $?

HEAD "Add Roboshop  APP  User "
useradd roboshop &>>/tmp/roboshop.log
STAT $?

HEAD "Download from Github"
curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip" &>>/tmp/roboshop.log
STAT $?

HEAD "Extract Downloaded Content\t"
cd /home/roboshop && unzip /tmp/catalogue.zip &>>/tmp/roboshop.log && mv catalogue-main catalogue
STAT $?

HEAD "Install Nodejs Dependencies"
cd /home/roboshop/catalogue &&  npm install &>>/tmp/roboshop.log
STAT $?




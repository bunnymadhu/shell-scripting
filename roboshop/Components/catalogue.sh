#!/bin/bash

source Components/common.sh
rm -f /tmp/roboshop.log
disable-auto-shutdown

HEAD "Insatlling Nodejs\t\t"
yum install nodejs make gcc-c++ -y &>>/tmp/roboshop.log
STAT $?

HEAD "Add Roboshop  APP  User\t"
id roboshop &>>/tmp/roboshop.log
if [  $? -eq 0 ]; then
  echo User is already there, so avoid the User creation &>>/tmp/roboshop.log
  STAT $?
else
  useradd roboshop &>>/tmp/roboshop.log
  STAT $?
fi

HEAD "Download from Github\t\t"
curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip" &>>/tmp/roboshop.log
STAT $?

HEAD "Extract Downloaded Content\t"
cd /home/roboshop && rm -rf catalogue &>>/tmp/roboshop.log
STAT $?

HEAD "unzip the file\t\t"
unzip /tmp/catalogue.zip &>>/tmp/roboshop.log && mv catalogue-main catalogue
STAT $?

HEAD "Install Nodejs Dependencies\t"
cd /home/roboshop/catalogue &&  npm install --unsafe-perm &>>/tmp/roboshop.log
STAT $?



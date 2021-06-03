#!/bin/bash

SOURCE Components/common.sh

HEAD "Installing Nginx"
yum install nginx -y &>>/tmp/roboshop.log
echo -e "\e[32mdone\e[0m"
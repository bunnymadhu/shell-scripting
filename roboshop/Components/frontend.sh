#!/bin/bash

SOURCE components/common.sh

HEAD -n "installing Nginx"
yum install nginx -y &>>/tmp/roboshop.log
echo -e "\e[32mdone\e[0m"
#!/bin/bash

echo -e  "\e[1m---------------------------------------------------------------------"
echo  -e "installing Nginx"
echo  -e "---------------------------------------------------------------------\e[0m"

yum install nginx -y

echo -e  "\e[1m---------------------------------------------------------------------"
echo  -e "\e[1;32mSUCCESS"
echo  -e "\e[1m---------------------------------------------------------------------\e[0m"

echo "installinh Nginx ..."
yum install nginx -y &>>/tmp/roboshop.log
echo -e "\e[32mdone\e[0m"
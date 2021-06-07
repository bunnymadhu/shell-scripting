#!/bin/bash

source Components/common.sh
rm -f /tmp/roboshop.log
set-hostname rabbitmq
disable-auto-shutdown

HEAD "Install ERLNG\t\t\t"
yum list installed | grep erlang
yum install https://github.com/rabbitmq/erlang-rpm/releases/download/v23.2.6/erlang-23.2.6-1.el7.x86_64.rpm -y  &>>/tmp/roboshop.log
STAT $?

HEAD "Setup Rabbitmq Yum Repos"
curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | sudo bash  &>>/tmp/roboshop.log
STAT $?

HEAD "Install RabbitMQ Server\t\t"
yum install rabbitmq-server -y  &>>/tmp/roboshop.log
STAT $?

HEAD "Start RabbitMQ Server\t\t"
systemctl enable rabbitmq-server  &>>/tmp/roboshop.log && systemctl start rabbitmq-server &>>/tmp/roboshop.log
STAT $?

HEAD "Create Application user in RabbitMq"
rabbitmqctl add_user roboshop roboshop123 &>>/tmp/roboshop.log && rabbitmqctl set_user_tags roboshop administrator &>>/tmp/roboshop.log && rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*" &>>/tmp/roboshop.log
STAT $?
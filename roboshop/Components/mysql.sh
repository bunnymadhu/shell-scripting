#!/bin/bash

source Components/common.sh
rm -f /tmp/roboshop.log
set-hostname mysql
disable-auto-shutdown

HEAD "Setup MySQL Repos\t"
echo '[mysql57-community]
name=MySQL 5.7 Community Server
baseurl=http://repo.mysql.com/yum/mysql-5.7-community/el/7/$basearch/
enabled=1
gpgcheck=0' > /etc/yum.repos.d/mysql.repo
STAT $?

HEAD "Installing of MySQL Server"
yum remove mariadb-libs -y &>>/tmp/roboshop.log && yum install mysql-community-server -y &>>/tmp/roboshop.log
STAT $?

HEAD "Start MySQL Services\t"
systemctl enable mysqld &>>/tmp/roboshop.log && systemctl start mysqld &>>/tmp/roboshop.log
STAT $?

## a default root password will be generated and given in the log file,soo to opn {cat},
## sudo cat /var/log/mysqld.log and to search {grep},
## sudo grep temp  /var/log/mysqld.log, in that {A temporary password is there},
## sudo grep 'A temporary password' /var/log/mysqld.log
## sudo grep 'A temporary password' /var/log/mysqld.log | aws '{print $NF}' , to print Nth field in that line  aws'{print $NF}'

DEF_PASS=$(sudo grep 'A temporary password' /var/log/mysqld.log | awk '{print $NF}')
echo " ALTER USER 'root'@'localhost' IDENTIFIED BY 'RoboShop@1';
uninstall plugin validate_password;" >/tmp/db.sql

HEAD "Reset mySQL Password"
mysql -uroot -p"${DEF_PASS}" </tmp/db.sql &>>/tmp/roboshop.log
STAT $?
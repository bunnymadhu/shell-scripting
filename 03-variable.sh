#!/bin/bash

# declare a variable
 COURSE =DEVOPS

# access a variable
echo Course Name = $COURSE

DATE =2021-05-30
DATE = $(date +%F)
echo Good Morning, Today date is $DATE

NO_OF_USERS = $(who | wc -1)
echo number of users logged in system = $NO_OF_USERS

NO_OF_LINES IN etc/passwd = $(wc /etc/passwd)
echo number of lines in etc/passwd = $NO_OF_LINES

ADD = $((1+2+3))
BIG = $((4+5-3/6x80/5-2x900/8))
echo BIG = $BIG
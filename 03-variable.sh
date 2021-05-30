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
BIG = $((4+5+3))
echo BIG = $BIG

#types of variables
#readonly
#in read only only we can acess that particular file in readonly manner,so don't give that permission in very rarecase it will use
#scalar
#a=100,echo $a=100 but
#but in that 3 lines in given command we want only 1 line then
#b=(10 20 30)
# echo ${b[0]} for first line
# echo ${b[1]} for 2nd line like n...
#local
#x=100,in is only in local area where as it is environment area then
#export  x
#03-variable.sh
#x=100 it will show in env area...

echo variable from command line x=$x


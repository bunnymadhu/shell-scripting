#!/bin/bash

#if you assign a name to set of date that is a  variable.

# declare a variable
 COURSE=DEVOPS
 BRANCH=MECHANICAL
 SACHIN=CRICKET

# access a variable
echo Course Name = $COURSE
echo branch name = $BRANCH
echo sachin = $SACHIN

DATE=30-05-2021
DATE=$(date +%F)
echo Good Morning, Today date is $DATE

NO_OF_USERS=$(who | wc -l)
echo number of users logged in system = $NO_OF_USERS


NO_OF_LINES=$(wc -l /etc/passwd)
echo number of lines in etc/passwd = $NO_OF_LINES

ADD=$((1+2+3))
BIG=$((4+5+3))
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


#! bin/bash

# Quotes are 2 types
# ' '," "
a=100
# echo $a
#100 but in case echo ' $a'           # echo -e "hello \n this is madhu"'
#$a                                             #hello
#echo '$*'                                     #this is madhu
#$*

#Redirectors               #standard output - (1>,>)
# > - output                 #standard input  - (2>) ,
#< -  input                   # std out & std err -  ex:  1> tmp/out, 2>tmp/err
                                  # shows no output and no err - &>dev/null
 # input which we will use only to install some data base and whatever,
 # we enter  any kind of some data we give some input to show the the date...
 # on that time input (<) will use...ex: step-1 : sudo yum install mariadb-server -y,step-2:  mysql in that we will give some input like (show databases ;)...

# exit command
#exit $?

echo hello
exit 10
echo bye
#get exit status echo $?

#!bin/bash

#if you assign a name to set of commands that is a  function.
#functions that are used to be keep the code DRY (reusability).

#declare a function
SATHYA () {
 echo hai, welcome to SATHYA function
 return 0-255
 echo value of a = $a
 b=200
 echo First argument = $1
}

# access a function
a=150
SATHYA xyz
SATHYA $1
echo exit status of SATHYA function = $?
echo value of b = $b


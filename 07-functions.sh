#!bin/bash

#if you assign a name to set of commands that is a  function.
#functions that are used to be keep the code DRY (reusability).

#declare a function
SATHYA () {
 echo hai, welcome to SATHYA function
 echo value of a = $a
 b=200
 echo First argument = $1
}

# access a function
a=150
SATHYA
SATHYA xyz
SATHYA $1
echo value of b = $b


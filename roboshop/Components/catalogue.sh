#!/bin/bash

source Components/common.sh
rm -f /tmp/roboshop.log
set-hostname catalogue
disable-auto-shutdown


NODEJS "catalogue"

## --unsafe-perm -- switching to users in shell-scripting a bit complexm,so thats why,to use root user to normal user give permissions..
## -R(recursively) -- because its a directory so all the content in the web  should be change in this file..
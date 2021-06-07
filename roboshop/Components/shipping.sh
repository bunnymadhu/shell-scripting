#!/bin/bash

source Components/common.sh
rm -f /tmp/roboshop.log
set-hostname shipping
disable-auto-shutdown

MAVEN  "shipping"


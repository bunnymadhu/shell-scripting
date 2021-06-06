#!/bin/bash

source Components/common.sh
rm -f /tmp/roboshop.log
set-hostname rabbitmq
disable-auto-shutdown
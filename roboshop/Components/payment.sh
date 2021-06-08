#!/bin/bash

source Components/common.sh
rm -f /tmp/roboshop.log
set-hostname payment
disable-auto-shutdown

PYTHON3 "payment"
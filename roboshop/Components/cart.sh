#!/bin/bash

source Components/common.sh
rm -f /tmp/roboshop.log
set-hostname cart
disable-auto-shutdown

NODEJS "cart"
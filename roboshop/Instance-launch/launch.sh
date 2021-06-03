#!/bin/bash

COMPONENT = $1

##  -z validates the variable empty, true if it is empty.
if [ -z "${COMPONENT}" ]; then
 echo "Component input  is needed"
 exit 1
fi

LAUNCH TEMPLATE ID = lt-0132406f31a96f585
LAUNCH TEMPLATE VERSION =1

aws ec2 run-instances --launch-template LaunchTemplateId=${LAUNCH TEMPLATE ID},Version=${LAUNCH TEMPLATE VERSION} --tag-specifications "ResourceType=instance ,Tags=[{Key=name,Value=${COMPONENT}]"
#!/bin/bash

COMPONENT=$1

##  -z validates the variable empty, true if it is empty.
if [ -z "${COMPONENT}"  ]; then
 echo "Component Input  is Needed"
 exit 1
fi

LAUNCHTEMPLATEID=lt-0132406f31a96f585
LAUNCHTEMPLATEVERSION=1

##  validate if instance is running r not

INSTANCE_STATE=$(aws ec2 describe-instances --filters "Name=tag:name,Values=${COMPONENT}"  | jq .Reservations[].Instances[].State.Name | xargs -n1)
if [ "${INSTANCE_STATE}" = "running" ]; then
  echo "Instances already exists,not creating any !!"
  exit 0
fi

if [ "${INSTANCE_STATE}" = "stopped" ]; then
  echo "Instances already exists,not creating any !!"
  exit 0
fi

aws ec2 run-instances --launch-template LaunchTemplateId=${LAUNCHTEMPLATEID},Version=${LAUNCHTEMPLATEVERSION} --tag-specifications "ResourceType=instance ,Tags=[{Key=name,Value=${COMPONENT}}]" | jq

## | jq: to avoid that everytime instead press= q
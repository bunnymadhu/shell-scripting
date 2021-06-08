#!/bin/bash

COMPONENT=$1

##  -z validates the variable empty, true if it is empty.
if [ -z "${COMPONENT}"  ]; then
 echo "Component Input  is Needed"
 exit 1
fi

LAUNCHTEMPLATEID=lt-05cd3a1572980b093
LAUNCHTEMPLATEVERSION=2

##  validate if instance is running r not

if  [ "${COMPONENT}" == "all" ]; then
  for Component in mongodb catalogue redis user cart mysql shipping rabbitmq payment ; do

  done
fi

DNS_UPDATE () {
  PRIVATEIP=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=${COMPONENT} "  | jq .Reservations[].Instances[].PrivateIpAddress | xargs -n1)
  sed  -e "s/COMPONENT/${COMPONENT}/" -e "s/IPADDRESS/${PRIVATEIP}/" record.json >/tmp/record.json
  aws route53 change-resource-record-sets --hosted-zone-id Z03444518JCZ2U6FF5S6 --change-batch file:///tmp/record.json | jq
}

## here am searching for COMPONENT AND REPLACING WITH THE VARIABLE OF ${COMPONENT} of json file
## here am searching for IPADDRESS AND REPLACING WITH THE VARIABLE OF ${PRIVATEIP} of json file

INSTANCE_CREATE() {
  INSTANCE_STATE=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=${COMPONENT} "  | jq .Reservations[].Instances[].State.Name | xargs -n1)
  if [ "${INSTANCE_STATE}" = "running" ]; then
    echo "${COMPONENT} Instances already exists,not creating any !!"
    DNS_UPDATE
    return 0
  fi

  if [ "${INSTANCE_STATE}" = "stopped" ]; then
    echo "${COMPONENT} Instances already exists,not creating any !!"
    DNS_UPDATE
    return 0
  fi

   echo -n Instance ${COMPONENT} created - IPADDRESS is
  aws ec2 run-instances --launch-template LaunchTemplateId=${LAUNCHTEMPLATEID},Version=${LAUNCHTEMPLATEVERSION} --tag-specifications "ResourceType=instance ,Tags=[{Key=Name,Value=${COMPONENT}}]" | jq | grep  PrivateIpAddress | xargs -n1
  sleep 10
  DNS_UPDATE
}

if  [ "${1}" == "all" ]; then
  for component in mongodb catalogue redis user cart mysql shipping rabbitmq payment ; do
    COMPONENT=$component
    INSTANCE_CREATE
  done
else
  COMPONENT=$1
  INSTANCE_CREATE
fi





## | jq: to avoid that everytime instead press= q
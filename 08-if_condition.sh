#!/bin/bash

#string comparison

read -p "Enter Username: " username

if [ "$username" == "root" ]; then
  echo "Hey,User $username is a Admin User"
else
  echo "Hey, User $username is a Normal User"
fi
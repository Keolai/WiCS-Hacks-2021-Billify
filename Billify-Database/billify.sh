#!/bin/bash

read -r -p "read(1) or write(2)?" DEC

if [ "$DEC" = "1" ]; then
read -r -p "unique ID of patient:" USER

link='https://billify-51384-default-rtdb.firebaseio.com/userinfo/-'

link2='.json?print=pretty'

linkFULL1=${link}${USER}

linkFULL2=${linkFULL1}${link2}

curl ${linkFULL2}

echo ${linkFULL2}
fi

if [ "$DEC" = "2" ]; then

read -r -p "patient username: " User
read -r -p "name: " Name
read -r -p "birthday: " Bday
read -r -p "insurance provider: " Insprov
read -r -p "insurance number: " Insnumb
read -r -p "group number: " Grpnumb

curl -X POST -d "\
{
  \"$User\":
  {
    \"name\": \"$Name\",
    \"birthday\": \"$Bday\",
    \"insurance provider\": \"$Insprov\",
    \"insurance number\": \"$Insnumb\",
    \"group number\": \"$Grpnumb\"
  }
}" 'https://billify-51384-default-rtdb.firebaseio.com/userinfo.json'
echo
fi

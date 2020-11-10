#!/usr/bin/bash

if ! [ -d /home/web_project ]; then
    mkdir /home/web_project
fi
if ! [ -d /home/web_project/dev_staff ]; then
    mkdir /home/web_project/dev_staff
fi
if ! [ -d /home/web_project/des_staff ]; then
    mkdir /home/web_project/des_staff
fi

useradd -m -d /home -s /usr/bin/bash -p admin project_manager # создание project_manager
echo "Created project_manager"
groupadd staff
echo "Created staff group"

groupadd developers
echo "Created developers group"
groupadd designers
echo "Created designers group"

PASWD1="dev$((0 + RANDOM % $1))12345"
PASWD2="des$((0 + RANDOM % $2))12345"

useradd -p $PASWD1 -d /home/web_project -e $(date -d "+30 days" +%F) -G developers,staff dev_user$1
chage -W 3 -M 7 dev_user$1
echo "Create dev_user$1 with password: $PASWD1"

useradd -p $PASWD2 -d /home/web_project -e $(date -d "+30 days" +%F) -G designers,staff des_user$1
chage -W 3 -M 7 des_user$1
echo "Create des_user$2 with password: $PASWD2"



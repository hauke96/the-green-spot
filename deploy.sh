#!/bin/bash

httpdocs=/httpdocs
home=$httpdocs/the-green-spot

function hline {
    printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' =
}

hline
echo "1. Prepare build"
hline
echo "Remove folder ./public"
rm -rf ./public

hline
echo "2. Build"
hline
hugo -D -v

hline
echo "3. Login into server"
hline
echo -n "Username: "
read username
echo -n "Password: "
read -s password
echo

hline
echo "4. Backup old installation"
hline
# Generates the UTC ISO 8601 date string
date_str=$(date --iso-8601=seconds -u)
backup_folder="$httpdocs/backup_$date_str"

echo "   Create backup folder"
sshpass -p $password ssh $username@the-green-spot.de "mkdir $backup_folder"
echo "   Move files"
sshpass -p $password ssh $username@the-green-spot.de "mv $home/* $backup_folder"
echo "   Move backup to $backup_folder"
sshpass -p $password ssh $username@the-green-spot.de "mv $backup_folder $home"

hline
echo "5. Upload new data"
hline
sshpass -p $password scp -r ./public/* $username@the-green-spot.de:$home/
hline

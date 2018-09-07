#!/bin/bash

httpdocs=/httpdocs
home=$httpdocs/the-green-spot

function hline {
    printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' =
}

hline
echo "1. Build"
hline
./build.sh

hline
echo "2. Login into server"
hline
echo -n "Username: "
read username
echo -n "Password: "
read -s password
echo

hline
echo "3. Backup old installation"
hline
# Generates the UTC ISO 8601 date string
date_str=$(date --iso-8601=seconds -u)
backup_folder="$httpdocs/backup_$date_str"

echo "   Create backup folder"
sshpass -p $password ssh $username@the-green-spot.de "mkdir $backup_folder"
echo "   Move files"
sshpass -p $password ssh $username@the-green-spot.de "mv $home/* $home/.* $backup_folder"
sshpass -p $password ssh $username@the-green-spot.de "mv $backup_folder/beta $backup_folder/analytics $backup_folder/google*.html $home/"
echo "   Move backup to $backup_folder"
sshpass -p $password ssh $username@the-green-spot.de "mv $backup_folder $home"

hline
echo "4. Upload new data"
hline
sshpass -p $password scp -r ./public/. $username@the-green-spot.de:$home/
echo "Uploading done. For possible errors see above."
hline

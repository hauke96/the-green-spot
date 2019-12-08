#!/bin/bash

set -e

httpdocs=/httpdocs
home=$httpdocs/the-green-spot

function hline {
    printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' =
}

hline
echo "1. Build with drafts"
hline
./build.sh -D

hline
echo "2. Login into server"
hline
echo -n "Username: "
read username
echo -n "Password: "
read -s password
echo

hline
echo "3. Remove old installation"
hline
echo "    Remove beta folder"
sshpass -p $password ssh $username@the-green-spot.de "rm -rf $home/beta/*"
echo "    Done"

hline
echo "4. Upload new data"
hline
echo "    Upload public-folder to '$username@the-green-spot.de:$home/beta/'"
sshpass -p $password scp -r ./public/. $username@the-green-spot.de:$home/beta/
#scp -r ./public/. $username@the-green-spot.de:$home/beta/
echo "    Uploading done. For possible errors see above."
hline

#!/bin/bash

set -e

httpdocs=/httpdocs
home=$httpdocs/the-green-spot

function hline {
	echo
    printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' =
	echo " $1"
    printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' =
	echo
}

if [ "$1" == "--ignore-build" ]
then
	echo "Skip building and proceed with upload"
else
	hline "1. Build"

	if [ "$1" == "--beta" ]
	then
		home="$home/beta"
		./build.sh -D
	else
		./build.sh
	fi
fi

hline "2. Build package"

date_str=$(date -u +"%y-%m-%d_%H-%M-%S")
file="the-green-spot_$date_str.zip"

cd public 
zip -q -r -9 ../$file ./*
cd ..
echo
ls -alh $file

hline "3. Login into server"

#echo -n "Username: "
#read username
username="sub6691_26"
echo -n "Password (SSH): "
read -s password
echo

hline "4. Upload package"

echo "Upload file $file"

sshpass -p $password scp -oHostKeyAlgorithms=+ssh-rsa -r $file $username@the-green-spot.de:$home/

hline "5. Extract package"

sshpass -p $password ssh -oHostKeyAlgorithms=+ssh-rsa $username@the-green-spot.de "cd $home && rm -rf de en images css fonts && unzip -q -o $file && rm -f *.zip"

echo
echo
echo
echo "Deployment done. For possible errors see above."

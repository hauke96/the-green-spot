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

hline "1. Build"

rm -rf public

if [ "$1" == "--beta" ]
then
	home="$home/beta"
	./build.sh -D
else
	./build.sh
fi

hline "2. Build package"

date_str=$(date -u +"%y-%m-%d_%H-%M-%S")
file="the-green-spot_$date_str.zip"

cd public 
zip -r -9 ../$file ./*
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

sshpass -p $password scp -r $file $username@the-green-spot.de:$home/

hline "5. Extract package"

sshpass -p $password ssh $username@the-green-spot.de "cd $home && unzip -o $file"

echo
echo
echo
echo "Deployment done. For possible errors see above."

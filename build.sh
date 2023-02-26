#!/bin/bash

if [[ $1 == "-D" ]]
then
	BUILD_DRAFTS="$1"
fi

echo "Clear folder ./public"
rm -rf ./public/*

echo "Build site"
hugo --environment production -v $BUILD_DRAFTS

echo
echo "Copy .htaccess file to ./public/"
cp .htaccess_de public/.htaccess
echo "Copy .htaccess file to ./public/en/"
cp .htaccess_en public/en/.htaccess

# Check that folder of tags, posts, etc. only contain ASCII characters
NON_ASCII_FOLDERS=$(find public/ -type d 2>/dev/null | grep -P "[\x80-\xFF]")
if [[ -n $NON_ASCII_FOLDERS ]]
then
	echo
	echo "WARNING: Some folders contain non-ASCII characters!"

	for dir in $NON_ASCII_FOLDERS
	do
		echo "    $dir"
	done
fi

echo
echo -n "Final size: "
du -sk0 public | cut -f-1 -z
echo " kB"

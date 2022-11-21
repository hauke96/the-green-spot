#!/bin/bash

if [[ $1 == "-D" ]]
then
	BUILD_DRAFTS="$1"
fi

echo "Clear folder ./public"
rm -rf ./public/*

echo "Build site"
hugo --environment production -v $BUILD_DRAFTS

echo "Copy .htaccess file to ./public/"
cp .htaccess_de public/.htaccess
echo "Copy .htaccess file to ./public/en/"
cp .htaccess_en public/en/.htaccess

echo -n "Final size: "
du -sk0 public | cut -f-1 -z
echo " kB"

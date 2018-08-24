#!/bin/bash

./build.sh
sudo rm -rf /var/www/html/*
sudo rm -rf /var/www/html/.*
sudo cp -r public/* /var/www/html/
sudo cp -r public/.htaccess /var/www/html/
sudo cp -r public/en/.htaccess /var/www/html/en/

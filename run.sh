#!/bin/bash

URL=$(cat config.toml | grep "^baseurl = " | grep -oE "\"(.*)\"" | sed "s/\"\(.*\)\"/\1/")
echo "Use URL='$URL'"

firefox "$URL" &

hugo serve -D -v

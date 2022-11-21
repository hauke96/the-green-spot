#!/bin/bash

ENVIRONMENT="local"

URL=$(cat config/$ENVIRONMENT/config.toml | grep "^baseurl = " | grep -oE "\"(.*)\"" | sed "s/\"\(.*\)\"/\1/")
echo "Use URL='$URL'"

firefox "$URL" &

hugo server --environment $ENVIRONMENT -D -v

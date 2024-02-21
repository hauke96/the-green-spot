#!/bin/bash

ENVIRONMENT="local"

URL=$(cat config/$ENVIRONMENT/config.toml | grep "^baseurl = " | grep -oE "\"(.*)\"" | sed "s/\"\(.*\)\"/\1/")
echo "Use URL='$URL'"

if [[ $1 == "-f" ]]
then
	bash -c "sleep 2; firefox $URL" &
fi

hugo server --environment $ENVIRONMENT -D --logLevel debug

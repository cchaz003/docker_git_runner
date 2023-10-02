#!/bin/sh

cd /repo
git config --global --add safe.directory /repo
branch=`git rev-parse --abbrev-ref HEAD`
git fetch
git merge origin/$(branch)

FILE=./startup.sh
if test -f "$FILE"; then
    echo "$FILE exists, running startup script."
    chmod +x startup.sh
    ./startup.sh
    #pip3 install -r requirements.txt
else
    echo "No startup script found"
fi

# exec "$@"
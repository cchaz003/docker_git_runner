#!/bin/sh

cd /repo

git fetch
git merge origin/$CURRENT_BRANCH

FILE=./startup.sh
if test -f "$FILE"; then
    echo "$FILE exists, running startup script."
    chmod +x startup.sh
    ./startup.sh
    #pip3 install -r requirements.txt
fi

exec "$@"
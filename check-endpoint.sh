#!/bin/bash

URL=$1
for i in $(seq 1 10); do
    retcode=$(curl -o /dev/null -s -w "%{http_code}" ${URL})
    if [ $retcode -eq 200 ]; then
        exit 0
    fi
    sleep 30
done
exit 1

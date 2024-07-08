#!/bin/bash

log="log_web.log"

> "$log"

sites=(
    "https://google.com"
    "https://facebook.com"
    "https://twitter.com"
)

test_site() {
    if curl -sL --head "$1" | grep "HTTP/[^\s]*\s200" >> /dev/null; then
        echo "<$1> is UP"
        log "<$1> is UP"
    else
        echo "<$1> is DOWN"
        log "<$1> is DOWN"
    fi
}

log() {
    currentDate=`date +"%Y-%m-%d %T"`
    echo "$currentDate $1">>"$log" 
}

for site in "${sites[@]}"
do
    test_site "$site"
done
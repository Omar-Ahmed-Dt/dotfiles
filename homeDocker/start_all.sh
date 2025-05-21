#!/bin/bash

for dir in */; do
    # Remove trailing slash
    dirname="${dir%/}"

    echo "Entering $dirname and running docker-compose up -d"
    cd "$dirname" || continue
    docker-compose up -d
    cd ..
done

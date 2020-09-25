#!/bin/bash

FILES=$PWD/*
regex=".*\.bak$"

for file in $FILES; do
    if [[ $file =~ $regex ]]; then
        echo "Bak: $file"
    else
        if [[ ! -f "$file.bak" ]]; then
            touch $file.bak
            cat $file >> $file.bak
        else
            echo "Exist"
        fi
    fi
done

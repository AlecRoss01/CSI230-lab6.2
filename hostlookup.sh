#!/bin/bash

file=${1}
if [ -f ${file} ]; then
while read p; do
        out=$(host -W1 -t A $p)
        if [ $? -eq 0 ]; then
                ip=$(echo $out | cut -d " " -f 4)
                echo $p - $ip
        else
                echo "${p},not found"
        fi
done <${file}
else
        echo "file does not exist"
        exit 1
fi

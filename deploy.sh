#!/bin/bash
#
for file in $(ls bins/*); do
    TARGET_FILE=~/.bin/$(basename ${file})
    echo ${TARGET_FILE}
    if [ -f "${TARGET_FILE}" ]; then
        diff ${file} ~/.bin/$(basename ${file})
        if [ $? -eq 0 ]; then
            echo "<no diff>"
        fi
    else
        echo "<no target file>"
    fi

    cp -i ${file} ~/.bin/
done

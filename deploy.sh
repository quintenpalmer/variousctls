#!/bin/bash

function main(){
    for file in $(ls bins/*); do
        TARGET_FILE=~/.bin/$(basename ${file})
        echo "${TARGET_FILE}:"
        if [ -f "${TARGET_FILE}" ]; then
            colordiff -w -u ~/.bin/$(basename ${file}) ${file}
            if [ $? -eq 0 ]; then
                echo -e "  \033[1;31m<no diff>\033[0;0m"
            else
                cp -i ${file} ~/.bin/
            fi
        else
            echo "  <no target file>"
            # We still use the -i
            # just in case a file has snuck in
            # since we asked if it existed above
            cp -i ${file} ~/.bin
        fi
    done
}

main $@

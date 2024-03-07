#!/bin/bash

function main(){
    LONGEST=1
    for file in $(ls bins/*); do
        BASEFILE=$(basename ${file})
        if [ "${#BASEFILE}" -gt "${LONGEST}" ]; then
            LONGEST=${#BASEFILE}
        fi
    done

    for file in $(ls bins/*); do
        TARGET_FILE=~/.bin/$(basename ${file})
        echo -e " $(padded_right ${LONGEST} $(basename ${file})) (${TARGET_FILE})"
        if [ -f "${TARGET_FILE}" ]; then
            colordiff -w -u ~/.bin/$(basename ${file}) ${file}
            if [ $? -eq 0 ]; then
                echo -e "  \033[1;31m<no diff>\033[0;0m"
            else
                cp -i ${file} ~/.bin/
            fi
        else
            echo -e "  \033[1;32m<no target file>\033[0;0m"
            # We still use the -i
            # just in case a file has snuck in
            # since we asked if it existed above
            cp -i ${file} ~/.bin
        fi
    done
}

function padded_right() {
    LONGEST=$1
    TOPRINT=$2
    echo -n -e "${TOPRINT}:"
    for i in $(seq ${#TOPRINT} ${LONGEST}); do
        echo -n " "
    done
}

main $@

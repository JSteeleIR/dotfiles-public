#!/bin/bash
#Taken from https://unix.stackexchange.com/questions/308094/print-a-256-color-test-pattern-in-the-terminal
for i in {0..255} ; do
    printf "\x1b[38;5;${i}m%3d " "${i}"
    if (( $i == 15 )) || (( $i > 15 )) && (( ($i-15) % 12 == 0 )); then
        echo;
    fi
done

#!/bin/bash


function addFileToTrash {
    if [ ! -d ~/.trach ]; then
        echo "Сreating a trash"
        mkdir ~/.trach
    fi
    if [ -f $1 ]; then
        if [ -f ~/.trach/$1 ]; then
            mv $1 ~/.trach/$1_1
            echo "File name was changed to $1_1"
        else
            mv $1 ~/.trach/
        fi
    else
        echo "File does not exist!"
    fi
}

function restoreFile {
    echo "Restore file: $1"
    if [ -f ~/.trach/$1 ]; then
        mv ~/.trach/$1 $PWD
    else
        echo "File does not exist!"
    fi
}


if [ -n "$1" ]; then
    while [ -n "$1" ]; do
    case "$1" in
        -h) echo "Usage: trash.sh [OPTIONS]... [FILE]...
                    Sending a specified FILEs to the /home/%user%/.trash
                    OPTIONS:
                        -h display this help and exit
                        -e empty trash
                        -l list contents
                        -r FILENAME restore the specified FILENAME" ;;
        -r) fileToRestore="$2"
            restoreFile $fileToRestore
            shift ;;
        -l) echo | ls ~/.trach/ ;;
        -*) echo "Key not found!" ;;
        *)  fileToAdd="$1"
            addFileToTrash $fileToAdd
    esac
    shift
    done    
else
    echo "Usage: trash.sh [OPTIONS]... [FILE]... "
fi

#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# $1 = file name
# $2 = containing path
function moveFilesHome () {
    if [ -f ~/$1 ]; then
        echo "File Already Exists: ~/$1 "
    else
        cp $DIR/$2/$1 ~/$1

        if [ -f ~/$1 ]; then
            echo "Successfully created ~/$1"
        else 
            echo "Error: ~/$1 not created"
        fi
    fi
}

#  Move bash files to home directory
for file in $(find ./bash -type f -exec basename {} \;)
do
    moveFilesHome $file bash
done

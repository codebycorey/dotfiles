#!/usr/bin/env bash

source ./util/dots_delete_files.sh

dots_delete_files

if [ ! -L ~/.bash_profile ]; then
    touch ~/.bash_profile
fi

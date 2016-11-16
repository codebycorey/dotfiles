#!/usr/bin/env bash

# Backup bash script file if not a symlink
# $1 = file name
function backupBashScripts () {

    if [ -f ~/$1 ] && [ ! -L ~/$1 ]; then
        echo "Backing up bash_profile..."
        mv ~/$1 ~/backupBashScripts/$1.backup
    fi
}

# Deletes current files and symlinks dotfiles
# $1 = file name
# $2 = project absolute path
function moveFilesHome () {

    backupBashScripts $1

    if [ -L ~/$1 ]; then
        echo "~/$1 Already Exists:  Removing..."
        rm ~/$1
    fi
    ln -s $2/dots/$1 ~/$1

    if [ -L ~/$1 ]; then
        echo "Successfully created ~/$1"
    else
        echo "Error: ~/$1 not created"
    fi
}

#  Move bash files to home directory
#  $1 = project absolute path
function dots_sym_link_dotfiles () {

    for file in $(ls -A ./dots)
    do
        moveFilesHome $file $1
    done
}

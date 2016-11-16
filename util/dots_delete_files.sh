#!/usr/bin/env bash

# Backup bash script file if not a symlink
# $1 = file name
function restore_backup_bash_scripts () {

    if [ -f ~/.dotbackup/$1 ]; then
        echo "Restoring $1..."
        cp --remove-destination ~/.dotbackup/$1 ~/"$(echo "$1" | sed -r 's/.backup//')"
    fi
}

# Deletes current files and symlinks dotfiles
# $1 = file name
# $2 = project absolute path
function delete_symlink_files_home () {

echo $1



    if [ -L ~/$1 ] && [ ! -f ~/$1 ]; then
        echo "Deleting: ~/$1"
        rm ~/$1
    fi
}

#  Move bash files to home directory
#  $1 = project absolute path
function dots_delete_files () {

    for file in $(ls -A ./dots); do
        delete_symlink_files_home $file
    done

    if [ -d ~/.dotbackup ]; then
        for file in $(ls -A ~/.dotbackup); do

            restore_backup_bash_scripts $file
        done
    fi
}

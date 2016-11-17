#!/usr/bin/env bash

# Backup bash script file if not a symlink
# $1 = file name
function backup_bash_scripts () {

    if [ ! -d ~/.dotbackup ]; then
        mkdir ~/.dotbackup
    fi

    if [ -f ~/$1 ] && [ ! -L ~/$1 ]; then

        echo "Backing up $1..."
        mv ~/$1 ~/.dotbackup/$1.backup
    fi

    # TODO: Plan to handle directories better in future
    if [ -d ~/$1 ] && [ ! -L ~/$1 ]; then
        echo "Backing up $1..."
        mv -f ~/$1 ~/.dotbackup/$1
    fi

}

# Deletes current files and symlinks dotfiles
# $1 = file name
# $2 = project absolute path
function symlink_files_home () {

    backup_bash_scripts $1

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
function dots_move_files_home () {

    for file in $(ls -A ./dots); do
        symlink_files_home $file $1
    done
}

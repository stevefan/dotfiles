#!/usr/bin/env bash

#make script do different things in different contexts,
#curl install & install from git
#passing on curl+install for git clone & source install-dotfiles.sh
#determine the context of installation
#determine which github based on ubuntu email?

#philosophy & aim
#easy deploy through salt state apply
#easy manual deploy by hand
#linux only, maybe as portable within reason (e.g. post 2014 platforms?)
#idemipotent install
#install overrides previous symlinks
#maybe save old bashrc and files?
#

# 'ls -a1' sorted lists all files in the current directory outputting one per line.
# 'sort excluded-files' sorted lists the lines in the file representative of non-dotfiles responsible for distribution or installation of dotfiles.
# '<(bash-command)' runs bash-command in a subshell and redirects the output as an input.
# comm -23 compares inputs line by line and outputs unique lines in the first argument while excluding from output the unique lines in the second output and lines common to both.
# Together this line gives all non-excluded-files in the current directory.
# echo another-file >> excluded-files' to exclude additional files.

SCRIPTPATH=$( cd $(dirname $0) ; pwd -P )

for dotfile in $(comm -23 <(ls -a1 $SCRIPTPATH) <(sort excluded-files) )
do ln -sv $SCRIPTPATH/$dotfile $HOME/$dotfile
done


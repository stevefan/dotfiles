#!/usr/bin/env bash

#shall we check if we are in the right directory?
#make file execuitable?
#make script do different things in different contexts,
#curl install & install from git
#passing on curl+install for git clone & source install-dotfiles.sh
#determine the context of installation
#determine which github based on ubuntu email?


# 'ls -a1' sorted lists all files in the current directory outputting one per line.
# 'sort excluded-files' sorted lists the lines in the file representative of non-dotfiles responsible for distribution or installation of dotfiles.
# '<(bash-command)' runs bash-command in a subshell and redirects the output as an input.
# comm -23 compares inputs line by line and outputs unique lines in the first argument while excluding from output the unique lines in the second output and lines common to both.
# Together this line gives all non-excluded-files in the current directory.
# 'echo another-file >> excluded-files' to exclude additional files.
for dotfile in $(comm -23 <(ls -a1) <(sort excluded-files) )
do ln -s $PWD/$item $HOME/$item
done

